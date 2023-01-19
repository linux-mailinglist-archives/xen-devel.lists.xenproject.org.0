Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 7756E673611
	for <lists+xen-devel@lfdr.de>; Thu, 19 Jan 2023 11:51:41 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.480954.745600 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1pISVI-0006Fw-7o; Thu, 19 Jan 2023 10:50:44 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 480954.745600; Thu, 19 Jan 2023 10:50:44 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1pISVI-0006Dc-4R; Thu, 19 Jan 2023 10:50:44 +0000
Received: by outflank-mailman (input) for mailman id 480954;
 Thu, 19 Jan 2023 10:50:42 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=DP+J=5Q=suse.com=JBeulich@srs-se1.protection.inumbo.net>)
 id 1pISVF-0006DG-Uv
 for xen-devel@lists.xenproject.org; Thu, 19 Jan 2023 10:50:42 +0000
Received: from EUR05-VI1-obe.outbound.protection.outlook.com
 (mail-vi1eur05on2089.outbound.protection.outlook.com [40.107.21.89])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 1d2c178f-97e7-11ed-91b6-6bf2151ebd3b;
 Thu, 19 Jan 2023 11:50:40 +0100 (CET)
Received: from VE1PR04MB6560.eurprd04.prod.outlook.com (2603:10a6:803:122::25)
 by AS4PR04MB9692.eurprd04.prod.outlook.com (2603:10a6:20b:4fe::20)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6002.12; Thu, 19 Jan
 2023 10:50:38 +0000
Received: from VE1PR04MB6560.eurprd04.prod.outlook.com
 ([fe80::2991:58a4:e308:4389]) by VE1PR04MB6560.eurprd04.prod.outlook.com
 ([fe80::2991:58a4:e308:4389%7]) with mapi id 15.20.6002.024; Thu, 19 Jan 2023
 10:50:38 +0000
X-BeenThere: xen-devel@lists.xenproject.org
List-Id: Xen developer discussion <xen-devel.lists.xenproject.org>
List-Unsubscribe: <https://lists.xenproject.org/mailman/options/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=unsubscribe>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Errors-To: xen-devel-bounces@lists.xenproject.org
Precedence: list
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>
X-Inumbo-ID: 1d2c178f-97e7-11ed-91b6-6bf2151ebd3b
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=BYqFeWdFfE9CkR9Y73vc+xoXjsk0Fwqi5VFS+HAFU0KLSBP+ICFjW/3UtZWJpu9LQF5d8jWYNgfWT2xJGVC8gVjoXP7iiEXyRJ/HEB5M/UQZzOLJd6y4Ck9V/Uowk9gzcBrMY+hLY4yZFlZHxuqLu3wPW2obK6NMn1XyeQLaiKcthIIPClrgcvJwt6F80bSH6OeZ5MhmS7Sh31fXGhw0hzFdaaHYsptpVVq+piWWmsQYfHbKLvarOgsU7nHX6+PqausjrMnMJD93VxkCac2M/zVnkT2M+3+MlypCq9KGBw8rVO66GPMcb18KYTSFonxlnW7/OvZiZ3X7YDJq6UNTGw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=jYpiYIbX/Y7DO5E2iQ+OsYPuSATLSttvJNKGLIObGSc=;
 b=cYaWG4oAOhQT78DoL8g2uMui4JtLOEoGXh2oehOyb9I5745i97EKyD0pozeGDHQFZMnkCbJreRNRPnsL+eHagkiCxEpNEyVZJokmLXpatnabN0IVYmnaayjvcOXRFabkcefuWQmtYKagY32vbdIparjcbpxgzzVSwklFoQ1EruWr6Ya5/Gt2qgKKBAwCFQLzZmtQ1PdqhE+cWPxiIwdbVj2SqKKOoKUcKvOuSdPNx6/ryArHGmMQyU3lsvTgtxuqyBH48niG3Va6Bd2u4e6yvVKK+MjJJrIbLyh0C57ZyNs0mT1RK+axtrgsdt0A0DZ85uzRDr+Xcr4JOKEl3KuP7w==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=suse.com; dmarc=pass action=none header.from=suse.com;
 dkim=pass header.d=suse.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=jYpiYIbX/Y7DO5E2iQ+OsYPuSATLSttvJNKGLIObGSc=;
 b=xjL+PV75AQBp7KZ4A1tHZkKVc79mGsvcSn3IqdiWheaYcGDpRVrTIQJ7q2NmJeqscguEXETysgt9e/gzHZkPohHDzn9C3VgC4T0gEMIUWjO8phwgzgHg56qxsh0x/FC7mO/FiCWxAjGjKU9ZiqW8UiSpmh4vyvxcyaRruNBwZHtlVVKxkN6c3y65deS3DX9nDh7yoXEs3H5ok+2Au1u89Dxpk27jwqv1IOMXfif/qFhRN9WpUxGC8yIuu0RTPCJj/gncHQ3021lwkrUGmpQzWdwDbDJBwQIV+P/kcef7Ejn2dzrO3+PigOOK80kx1US46B8jk0WlTL3N7zdpST2LKA==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=suse.com;
Message-ID: <6665ebac-6489-2d6a-0b9d-30342c1661d9@suse.com>
Date: Thu, 19 Jan 2023 11:50:36 +0100
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:102.0) Gecko/20100101
 Thunderbird/102.6.1
Subject: Re: [XEN PATCH v3 1/1] build: replace get-fields.sh by a python
 script
Content-Language: en-US
To: Anthony PERARD <anthony.perard@citrix.com>
Cc: "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>,
 George Dunlap <George.Dunlap@citrix.com>, Julien Grall <julien@xen.org>,
 Stefano Stabellini <sstabellini@kernel.org>, Wei Liu <wl@xen.org>,
 Andrew Cooper <Andrew.Cooper3@citrix.com>
References: <20230116181048.30704-1-anthony.perard@citrix.com>
 <20230116181048.30704-2-anthony.perard@citrix.com>
 <1ab3bc93-326a-172d-4f0f-f6c2ddc84105@citrix.com>
 <Y8g4pSOHvrkqmbTU@perard.uk.xensource.com>
From: Jan Beulich <jbeulich@suse.com>
In-Reply-To: <Y8g4pSOHvrkqmbTU@perard.uk.xensource.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: FR3P281CA0070.DEUP281.PROD.OUTLOOK.COM
 (2603:10a6:d10:4b::22) To VE1PR04MB6560.eurprd04.prod.outlook.com
 (2603:10a6:803:122::25)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: VE1PR04MB6560:EE_|AS4PR04MB9692:EE_
X-MS-Office365-Filtering-Correlation-Id: 7175e854-8499-4bb7-6411-08dafa0afff8
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	7SM7cLryX6ngnTb80raIo7l3m4GoOOx4RmSVlDTHxXrefMwC2m1Fe/pW4mMDbhocuuaMu/Zawzl5VcuJZU5iySzFtWntflbs31gefunEJsvaStDmPmCT3N7kgPAHrVMa+8X82ITzbRManVKxLI+IBTirb2dvwUwx6/jLRGLcX8Q/Cwx1jI3D2XIt5w7xe1rcdojEHABFptJovGA71UNeo747iCX+uhXjKvD3uLRgY9tEYr1k9Xqv4Rmu3dTq7bpwWbtJ+XzqPCMHPDLYK0EAWiQsZKzN1zgYV013eIhw1oss4cNp0dzYbUiKEiLlfbSFqUh9qvkNY5jRz4M4zqH9VBX03jjxffcPNJY8CaQZ2nzFIq8mcWnHMAv8Qy6lBv9KTA6MZrRwTEhEbtYZCyMBqPGU6jjBrSXHwv1wySolAJBbTJffwKCH9fhkJyQd0OFh3q9xo7PJHVdRyL9uvSZqX/trnSUT9Zm+iF0j9B58aebkGVYRvKTNzwqWSJ/ev0yS7GBEKUqx3MFUUaKFHyP8XPJIRHRCzxVs3ir1uKZ5iGKlL+ctxSPIu9e+83bU2wWVi9Vlgk+PP5QrGXkVR8kk9Lr67QAhHwkOsQj7htmQv+//d9B1hrmpGoQLV667+Ttn1fitdj1j823tsmoW8yNTU2tMkfifGf+YD93uHdpbolCS/RHZnz7/pzrpEHb1P+BbA5mMMnRx11qaZJagn1w1nO1pu+VfGYqSeWg5sfAvWe8=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:VE1PR04MB6560.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230022)(136003)(366004)(396003)(346002)(376002)(39860400002)(451199015)(31696002)(86362001)(66556008)(36756003)(66946007)(2616005)(6512007)(6916009)(8676002)(186003)(66476007)(26005)(4326008)(41300700001)(53546011)(54906003)(478600001)(6506007)(316002)(6486002)(2906002)(38100700002)(8936002)(5660300002)(31686004)(43740500002)(45980500001);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?THRTMDBoUDJlYTdaWlZuTHE0L3JCaS81YXF6Zno0NExmbTFRdVczSENIaGtE?=
 =?utf-8?B?Q2pGbmFYcEkrUUIxdXNUbU1sL0ZIekc0d1diZVNaSk9YUjhTaExTcGpGa1Ez?=
 =?utf-8?B?WmY2a1Vjei9wMXFITHhmS2pGMEZvWnZld3Bqa1ZWalQrMG9MKzhkM3docEV0?=
 =?utf-8?B?WUk0SHhUaFAralgxS1c3MUVtQzgyYVdoTmpNUGgrdDZlVFpqS3BRYkhScUJ2?=
 =?utf-8?B?anhQQnZiUU5SNVZNeWw5cEFqeGZSWTA1Wms1WVYrOTJiTEZYazFXcThrNlFt?=
 =?utf-8?B?WjVTRHlKS2hBNHRhVXU3bDR0Z3JscUlObzlnTThIT0dDWVU2NnNlbGVtUm9r?=
 =?utf-8?B?Y0ZMbm5zS3pmd3lXckx6UG1wZW1xbW1UV2FyUEc3TEwyV3JMcFhBdjJRNnAr?=
 =?utf-8?B?OEgrY1hjN3FpVUV2WnpvNmp4REpnM3ZIZTJ2Rk04SjZIOFlUMlROckhNV3NC?=
 =?utf-8?B?TVFnQmJYNnNvRXl5ekg2dWNoWU1jTWpQQ0VKNkJqTWJza2IyZTJ6bVVWL1RP?=
 =?utf-8?B?ZGE1dTdOVzlnbmpBOUFOOFJNVk00UC9HcUNUOVFETkl2ZzNoa0YzZUh1QUFw?=
 =?utf-8?B?dkk0cWpiRk9mTDVjNDQ2L1AxQkxHcUJNZnErT2pMY1hRRlEzNXRkTmpQKzh6?=
 =?utf-8?B?K0pqZ2lybEc0eWFXSW9sVkhjQ2VqTkJZRXV5UFd1Y3BkcVMrZ0VoeWVqSFJh?=
 =?utf-8?B?c0VEMkRUMDB0T3dxbjE1cXhJZXlmWVo0MGViK2h3Y3AyMWNiWnJ0ZVJYcW9K?=
 =?utf-8?B?aGtna3FJQnNVWng3N2pnZm5EazZoYnFwOW5JVzFxZ1d0MlVJaVEwc3krRmc0?=
 =?utf-8?B?RkFWTCtYVnZrdEtWOE1EUWJSaWcxbVhLRVd0c3JmTlJMaVAyd3g3WDJKN3kv?=
 =?utf-8?B?am9mNVM0aVdQR0VzeTFmMzBHOFRMWithLzFtcVRoM3ZtR292bmpVY0I3d2VL?=
 =?utf-8?B?dXJJcm1KOWswdDJ0ZlRuR1ZqTzNabDJNblZBdGJCYUM0WlJzaDFRc1RDMDVt?=
 =?utf-8?B?T0VDTmlSSmZQWi91Sm9lcGFsSm42eG9ENUcyLzRaT0h2UmM3Tlk2MGg1bFRy?=
 =?utf-8?B?dkFZOHorMmtHYmx3N2NGODJVQWlPQkpxR3ZkN1YrWVNHa0pFUXNXRk10aURa?=
 =?utf-8?B?QVpvSEpzbVNjam1tZFVRVE1WRUhQcDdUZlE1RVlDYUsrNnhiamcrN0g3VmlH?=
 =?utf-8?B?N2t6a2pkblN1K2k4cUttWHlCOHExRlFLcS9laEFTRmV4U2M2ZG1ib0FPWW85?=
 =?utf-8?B?aERsVjJVeEU1Q2twOHhYdjVpT2tPT1Q0ZWJYd0VRenR3OXdCeUE3eit3RXUz?=
 =?utf-8?B?REZsKzE4SmxFbnNkaUZ4QlZrVzhiK3hxcFU3bzU0bWtBcklxTzZKeEJvcUE3?=
 =?utf-8?B?dE9BNGFYR1NlZlFnR3RpdUJ6bTFmWTZvZk1UQy8wVWNKdjFzRFh1K3VuVjZS?=
 =?utf-8?B?TVNOUytQY3d6M2xDOWZSNXBqeWY5eFd2eGR0T2NieDlreFY1NFJDcnorb2xa?=
 =?utf-8?B?b1BCNWtqbmxaTlFZR2RHV2Mwd0pBNk9lc0ZoQytFYVloZVFkZXBHTEp4Ri9Q?=
 =?utf-8?B?Y2xsTExPUHNOb3dRQmJZNkpvcTdxT1JXNFpURDNHV2NDeEwyeUNabXlHT3Rs?=
 =?utf-8?B?b0ErU2h4a3VnN1VNMC8vblVWSGUrSW9NMnVkcXhuUXliYzVtd3FSVFlqc01V?=
 =?utf-8?B?UzJGNUtpcWhyajhxT25DMkpTSXJBZ1ptRkx4QXJNOEoycHFGOUdtSmNXNkxX?=
 =?utf-8?B?WWNiUm5ORUJhdTNINmZ2VUR1MFRkSElUSXNLSlcwUTBPSTdlWGpMZjZ3aXF4?=
 =?utf-8?B?dE4yVVFMUkRRbzJWQk1wRTRyMkMvdVF5M3gxajF5R25PVGFSNVN4VXh1SE1F?=
 =?utf-8?B?dTA3OVFrSlVuYnRMaks4eDRnTmlCMzlBY1E1bVo4bDhMSkZabC8zRnZ2b25S?=
 =?utf-8?B?ZUtVSkZHK1dZc2VyVjVuK01CbmhxcEQ1UmJhdjE1Vk5mbU9nTGg0WTdITExS?=
 =?utf-8?B?NzhnaS9Wd3Y4NTgyeFUwWTlhaU0ydnVVVWpEaHBqSlBUUjBoK2NlcU54R2ky?=
 =?utf-8?B?d2hsTE91MVUvWkFLd01Felc1VWtvQVlsc2JiTi9EZ3Y0by9OY25Eb09GOE9q?=
 =?utf-8?Q?adg39uLezDuweCbbKCrMhXfwo?=
X-OriginatorOrg: suse.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 7175e854-8499-4bb7-6411-08dafa0afff8
X-MS-Exchange-CrossTenant-AuthSource: VE1PR04MB6560.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 19 Jan 2023 10:50:37.9931
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: f7a17af6-1c5c-4a36-aa8b-f5be247aa4ba
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: RToU2VPRSMTjRbhhsAvJuRrbc7gteXwsrBZ0xwt2Ku1wqFWfZORw3nad5MJOVBl7ZD70SIBN1SIQiJXxqx2p7w==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AS4PR04MB9692

On 18.01.2023 19:21, Anthony PERARD wrote:
> On Tue, Jan 17, 2023 at 05:21:32PM +0000, Andrew Cooper wrote:
>> On 16/01/2023 6:10 pm, Anthony PERARD wrote:
>>> +def get_typedefs(tokens):
>>> +    level = 1
>>> +    state = 0
>>> +    typedefs = []
>>
>> I'm pretty sure typedefs actually wants to be a dict rather than a list
>> (will have better "id in typedefs" performance lower down), but that
>> wants matching with code changes elsewhere, and probably wants doing
>> separately.
> 
> I'm not sure that going to make a difference to have "id in ()" instead
> of "id in []". I just found out that `typedefs` is always empty...
> 
> I don't know what get_typedefs() is supposed to do, or at least if it
> works as expected, because it always returns "" or an empty list. (even
> the shell version)
> 
> So, it would actually be a bit faster to not call get_typedefs(), but I
> don't know if that's safe.

There's exactly one instance that this would take care of:

typedef XEN_GUEST_HANDLE(char) tmem_cli_va_t;

But tmem.h isn't being processed anymore, and hence right now the list
would always be empty. Are we going to be able to guarantee that going
forward?

Jan


Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id CCD2E47BEBA
	for <lists+xen-devel@lfdr.de>; Tue, 21 Dec 2021 12:16:32 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.250313.431170 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1mzd73-0006sY-S9; Tue, 21 Dec 2021 11:15:21 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 250313.431170; Tue, 21 Dec 2021 11:15:21 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1mzd73-0006qi-OM; Tue, 21 Dec 2021 11:15:21 +0000
Received: by outflank-mailman (input) for mailman id 250313;
 Tue, 21 Dec 2021 11:15:20 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=GYHQ=RG=suse.com=jbeulich@srs-se1.protection.inumbo.net>)
 id 1mzd72-0006qc-8t
 for xen-devel@lists.xenproject.org; Tue, 21 Dec 2021 11:15:20 +0000
Received: from de-smtp-delivery-102.mimecast.com
 (de-smtp-delivery-102.mimecast.com [194.104.109.102])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 474e9e61-624f-11ec-bb0b-79c175774b5d;
 Tue, 21 Dec 2021 12:15:19 +0100 (CET)
Received: from EUR03-VE1-obe.outbound.protection.outlook.com
 (mail-ve1eur03lp2052.outbound.protection.outlook.com [104.47.9.52]) by
 relay.mimecast.com with ESMTP with STARTTLS (version=TLSv1.2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 de-mta-27-LHq8Yo0KM3uGQ-WytTvr5Q-1; Tue, 21 Dec 2021 12:15:16 +0100
Received: from VI1PR04MB5600.eurprd04.prod.outlook.com (2603:10a6:803:e7::16)
 by VI1PR04MB4944.eurprd04.prod.outlook.com (2603:10a6:803:60::19)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4801.19; Tue, 21 Dec
 2021 11:15:16 +0000
Received: from VI1PR04MB5600.eurprd04.prod.outlook.com
 ([fe80::5951:a489:1cf0:19fe]) by VI1PR04MB5600.eurprd04.prod.outlook.com
 ([fe80::5951:a489:1cf0:19fe%6]) with mapi id 15.20.4801.022; Tue, 21 Dec 2021
 11:15:15 +0000
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
X-Inumbo-ID: 474e9e61-624f-11ec-bb0b-79c175774b5d
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=mimecast20200619;
	t=1640085317;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=c421I4jdQqcckOvvUsUkNt0MHyakGCRR5aIUBl3xD5c=;
	b=FrPmopc7qghE3nxII0RA44rzaTOzeKMswsn0y85LcroonM0+hQvDpr5y4Y6VQParry0153
	xLKFXWd3jPizS8iMBRNMK5AYDMrKORw7e2zkMxyhTC3ENuSU56of82InG3l4CMCbi5DEWt
	NkHC6GZ1Z7VoN6V6Yw+ZEMpmb0o2dv4=
X-MC-Unique: LHq8Yo0KM3uGQ-WytTvr5Q-1
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=Fd7/sB18GsoQvuQl703NeRSasL3EBrTQzGg4kP3KNSdfjktXjMoC14DLpoj8krw3yJ6pr3K0te0BE1fJ/poX0wINhKT3QsOxqZGrV/zgaiFJEtDHwyeYXIVBgPXZ8XUP2Ym/6RN2vF4sX5+hblBamNWVgU6mX9U56AX6tAUP+4/RQ72dOmHoGAHv8OYDLdJmu5SpLjtqgJgtfETf8WSu9bzULm8V86/wqyTMm6SgkB49bXjYMmHmZlTNJh6Y3T252Y+iOpz5Wi2Cc2daF55t0RQU4uUtq6DCmry0DPAP2eck2js9fZdxJjn85F34oJb/ZxPM+1Z4EDzEt5tDAQLeYA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=c421I4jdQqcckOvvUsUkNt0MHyakGCRR5aIUBl3xD5c=;
 b=SEDuEyaUcQ4jeGUt8dyq4mv3VDwkT48GjQhYLcmh5jn9oJ2Lr1bSb0EKnAIt5yxvZTIGHQNIl0cTI5I/JlGckIVaVmknKKLnbF1wdlFi0s8aMRJ6vAZUUut/2T2FbUGvaGSHt3bXwU1ft0YOQrft4IvkwOGClg9CcrFSK9Ol+NXWRjPs5RR5fEXZt6MMqmux/iiHpZw0zpZ1HjBVYlyWh4ze3zCIsF0jwQk43PoiEkiDM/MzwiWvvCh84My0RabXOYFkIbugRdNSxkAUFkXwMHtwS5NTzQPgOAOGRiwvl3GXog6RN3wpTZPRoG5KnOlXK8jUvOgIYV9RGNzAg5I8Tw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=suse.com; dmarc=pass action=none header.from=suse.com;
 dkim=pass header.d=suse.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=suse.com;
Message-ID: <af58fb00-39a2-314b-bbc2-6ca373707d49@suse.com>
Date: Tue, 21 Dec 2021 12:15:13 +0100
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:91.0) Gecko/20100101
 Thunderbird/91.4.0
Subject: Re: [PATCH 1/6] x86/prot-key: Enumeration for Protection Key
 Supervisor
Content-Language: en-US
To: Andrew Cooper <andrew.cooper3@citrix.com>
Cc: =?UTF-8?Q?Roger_Pau_Monn=c3=a9?= <roger.pau@citrix.com>,
 Wei Liu <wl@xen.org>, Xen-devel <xen-devel@lists.xenproject.org>
References: <20211216095421.12871-1-andrew.cooper3@citrix.com>
 <20211216095421.12871-2-andrew.cooper3@citrix.com>
From: Jan Beulich <jbeulich@suse.com>
In-Reply-To: <20211216095421.12871-2-andrew.cooper3@citrix.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: AS9PR06CA0242.eurprd06.prod.outlook.com
 (2603:10a6:20b:45f::10) To VI1PR04MB5600.eurprd04.prod.outlook.com
 (2603:10a6:803:e7::16)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 482641d2-dc8a-4637-f6c4-08d9c4732a17
X-MS-TrafficTypeDiagnostic: VI1PR04MB4944:EE_
X-Microsoft-Antispam-PRVS:
	<VI1PR04MB4944F1129F04C108A32BC5D9B37C9@VI1PR04MB4944.eurprd04.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:6108;
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	zsvF37DZWVeoCdC9uGfth4YuIU8GpZ8fMTMMfAPJFN4GEpfGlu4PRYSRrzwA9sf8n9GQ4Ac4JmXgZ9adqWORxFOb0QmqWlSSOQQSLKpfuh1GusxPi2+4/0UkKKGrEgSr4oMNzXO6Z8/4kaqtrG1JTo7yaJVxV5NBA7TzxK8HGbBWo+mR1yHhAamlAvMAGufbr43sKRLT5a3slzVJ3xK0o+QGRNljK63pJIYoGSr9j4Y/RctMWHdmZspSbSKt/l+6xXIDLmh4vnXDHXwPrzd45va9yyuilOpSmC6PLrYzCWq0vL3evhtXofx9+mCA45nHsTRCiZvloPnzCt7ecPvLeldPTvABW4Ey3ff2OExDo1eMwuTEKkzq7+TccF5BYIY77aw6WFGfQk2XZhvkPBGu1qmG5eZ940Fl413q1ErhPeuc2UHA67HlSwLQYHJ+zNAzUSuLa7KFKT89nuLIHX88uhqjvUfVEUpOUCVlrCY2DuJE5djXVG/0kVJAjJH/6iV38pP8SSNkLJh0HDSeFxu0hXmI28xJ4wDPqonTw2CB+wr4wlBufkt+UbYwTpQrSd9MOVh7VDeSzlXw2b44YVt7PPQQPDwIy6D8LCI/ZDVab4r2cgiCDIyGplCSMh8XH8rZexpqM+HnfUXKs9wxHAJcudcB/dRhim9vQdLajJ2pocb6fq9vQfNSDntYbO9bfxuBFr/5AzQwtGuL+/OePLF2HZ09cJXbGx4iIiArgt0Bwew=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:VI1PR04MB5600.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(366004)(8676002)(508600001)(6486002)(8936002)(36756003)(83380400001)(4326008)(54906003)(6916009)(6512007)(2906002)(86362001)(66946007)(66556008)(31696002)(316002)(31686004)(5660300002)(53546011)(186003)(2616005)(6506007)(26005)(66476007)(38100700002)(4744005)(45980500001)(43740500002);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?SEJkcE5BV29YSWhyakd1SWhkRTY1YXFEYnRQQUNPQlNkQ1c3NGtDMStFSkUy?=
 =?utf-8?B?eVNZR0ZJck9ZSENKUFJGZit4dWVhbzk0R1ovZ20rY0Z3dWxIaVBMYmg5KzV4?=
 =?utf-8?B?ZHdOVXlWRFp3M1JreGQvOHByUVdaNVdCQlhqdUxoemlNYjloYXZ2VW1MMlNG?=
 =?utf-8?B?VFRZVXNMelBLQjljeEplOVY1VmltaFI3NGUrQzhIYVZCZFJ6a1ZML09iT1NH?=
 =?utf-8?B?TlREOE9LN0FRVW1xa0puSjZRa3FqMDBHMTlQcDhyL0ZrSFEyZ2w0enppdExG?=
 =?utf-8?B?UGk0Y3pmMVlhbHdLVmxKeXJGNGNLSEx4SUh3WDBTY2dUa2Zkdk9uc1F1eFhZ?=
 =?utf-8?B?Y05jbTV3WGo1OUtVZTgwU0I4Q205RFdVTXhXZHhvQ204YjdscFBDWmhiV0hC?=
 =?utf-8?B?SEVHTitQSlI5WjQ4ZFR4MXpMTEFQY3lDYTBtSWxGOEZSdEwwcWhPR210VGtx?=
 =?utf-8?B?SmpKQTNUQ1pzdkl4Y2FlZ1lZRkJ0NnZqekV3SFhxREJoSGY4VGd5ZEpma0po?=
 =?utf-8?B?UjBJS1ovM1RwbGpLTURyRHJUUy9lUWJyd1o0MGxrTmR6Z2pHN3VmQ3BvYmxE?=
 =?utf-8?B?L0J2VlVSTS9Yby8yNTlneGVpNTBXZSt4TzRXT2VTZHArWmJkdDVSak9Geldq?=
 =?utf-8?B?UVZVK0VnVkZ3NXBXRFZjbW1VL0xNYXlBU1hUeHV6U1dTM0t2dEN1NzJXZmY5?=
 =?utf-8?B?VjI2bFFrdC81d1ZBZnlaYm94YTZBMGtWSFhsNXZRdEsvT2NGUTNTc29JNHps?=
 =?utf-8?B?VllOTDV6TTF5RU9iL0R5b0JoWGVZcVdDV29NN0Q2azdiNkNSRWpGdnA1UXNx?=
 =?utf-8?B?aXVZUVl0RE5kS29qdG8vcG5SdzB6U1U5dHNXK0VBUjQveW4xVEc5MXlYazhD?=
 =?utf-8?B?cEtoZ0VGWnRQb1BRcWFmWmpmbGNTMlZNVFIrT1RZWjBMdlFXTi9sYlJkV0k1?=
 =?utf-8?B?Qm9SQmViQTU2V0tBUDNPUG9RV0VUaWE2ckZ6bEtWN2Vybm05RjBVeEltMzJn?=
 =?utf-8?B?cHRvbWFpeHJtWGJ4MmF0QkpnNjFPYVF4ZGFQS2lQS21MblNyejRJa2xYaEs3?=
 =?utf-8?B?WmZKTi9yeExIUHAyNE1iZHdycDd1ZEh3S1dya3hXdVp1OVJPc3NwZEZHTjU0?=
 =?utf-8?B?bEF6d09aUDdsMEk0YjdSeVEvSzFVUXVRV2taWUNySnAzSjFQNEZKTG85elFn?=
 =?utf-8?B?eTBLeEI3VkZZbkgrV21JcExxZ0dtS2xtMHZWaW5oZWY0bzMyVEVnMTBJM2RV?=
 =?utf-8?B?MldWUEw3ZEtBZ0xoYml2eE1rcEhKZGE5WGQwRHFja2IxTWh1eUhrV0ZJc00v?=
 =?utf-8?B?SUdEdnRpM3JEVDJ1RThJRGlaaVZrMytkOGFlTS8vbVZIcEQ3UmF0dEJYYU5l?=
 =?utf-8?B?eXorNGtyNGhjemN4cmV3dVFMN0Ntek5sRDAwSGJSYXZIOWNKb0F1dkpQbi9Y?=
 =?utf-8?B?bHBHUVRjU3U4dXhvT3Z2VDJ2a1dJdUlDdHBzb3BkZHdCZTZnVjBnNEtTWDd5?=
 =?utf-8?B?SDhLbWp0WHJZRE5MY25lTXhxV1N4SGJZekZ3dzZSZENXOHE5SmQ3aWI2YVJP?=
 =?utf-8?B?VDlKaWRhMk5ZdVZ4a3o3ejYrM0MvZ05ENG41Z1ZWZzJacldMQzNOZXlpQ0I4?=
 =?utf-8?B?MEg0RDVJWG9BY2R0MmpXbllXZUpUK3d2V1FJUEFVbThEdW93ZG45ZjFFWDZB?=
 =?utf-8?B?SEhYY2hxWCtUWHZUa2k4WW5ZQ2NtYnN5RmtSRzgyWFNDMXBhWXVmcTBIMXVC?=
 =?utf-8?B?SnlhSEVuOW9TNEpFOXg3WE5GbWptQm9oem1Oay9xa25kcklTVGxCeDIrNUhB?=
 =?utf-8?B?NUNCdlU2K08wWGtvNnFFS0h6U0w4Sis1WHZFU1hnMEdiQlRSbDcrb0c5KzFp?=
 =?utf-8?B?SHNFYjRtcWYvcndOTDdlYUhlNEE5anFyRkZveUh6VFNmNFVuVWZxRi9EUDFt?=
 =?utf-8?B?djJZK0svWXM0TVBvM3V4S0xtSi9KeHRaR1NHb0xhbEc2MnMybnBFL3NIYjBr?=
 =?utf-8?B?THgvQVhJT3Z3NkorUDQ5Q1pJbEkrbUx2Mk5lZDc0QnlieWFVOVcrRC9Cc3VS?=
 =?utf-8?B?ajdKWk1ZUXdNTGd5TGFPZUV1bHBSUVJvYnljTjE3MjlUQW1MMEgzd3VxNnJy?=
 =?utf-8?B?TE1iWE5EOFJsL3c3SDdRT0pPVnpMQVcvWFc5TEk1SHkySU85aGRZVlFDenZ2?=
 =?utf-8?Q?OuyajxLXr4dCW6rj6F6kTLo=3D?=
X-OriginatorOrg: suse.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 482641d2-dc8a-4637-f6c4-08d9c4732a17
X-MS-Exchange-CrossTenant-AuthSource: VI1PR04MB5600.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 21 Dec 2021 11:15:15.8161
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: f7a17af6-1c5c-4a36-aa8b-f5be247aa4ba
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: RFcjKSpfsi6Bi+qPA4Rs0/dQd5fbhi9dKzxEiuMcf44WvtibeYrXBDbld9CY0WNPziVXEkLGgjHON96MXxYvSA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: VI1PR04MB4944

On 16.12.2021 10:54, Andrew Cooper wrote:
> Protection Key Supervisor works in a very similar way to Protection Key User,
> except that instead of a PKRU register used by the {RD,WR}PKRU instructions,
> the supervisor protection settings live in MSR_PKRS and is accessed using
> normal {RD,WR}MSR instructions.
> 
> PKS has the same problematic interactions with PV guests as PKU (more infact,
> given the guest kernel's CPL), so we'll only support this for HVM guests for
> now.
> 
> Signed-off-by: Andrew Cooper <andrew.cooper3@citrix.com>

Reviewed-by: Jan Beulich <jbeulich@suse.com>



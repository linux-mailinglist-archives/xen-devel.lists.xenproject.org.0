Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 52FDA6BD0E9
	for <lists+xen-devel@lfdr.de>; Thu, 16 Mar 2023 14:35:41 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.510606.788570 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1pcnlI-0008Rr-9l; Thu, 16 Mar 2023 13:35:20 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 510606.788570; Thu, 16 Mar 2023 13:35:20 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1pcnlI-0008PF-6J; Thu, 16 Mar 2023 13:35:20 +0000
Received: by outflank-mailman (input) for mailman id 510606;
 Thu, 16 Mar 2023 13:35:18 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=Ta6a=7I=suse.com=JBeulich@srs-se1.protection.inumbo.net>)
 id 1pcnlG-0008P2-B1
 for xen-devel@lists.xenproject.org; Thu, 16 Mar 2023 13:35:18 +0000
Received: from EUR04-VI1-obe.outbound.protection.outlook.com
 (mail-vi1eur04on0608.outbound.protection.outlook.com
 [2a01:111:f400:fe0e::608])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 62ee82c7-c3ff-11ed-87f5-c1b5be75604c;
 Thu, 16 Mar 2023 14:35:17 +0100 (CET)
Received: from VE1PR04MB6560.eurprd04.prod.outlook.com (2603:10a6:803:122::25)
 by AM7PR04MB7030.eurprd04.prod.outlook.com (2603:10a6:20b:114::15)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6178.29; Thu, 16 Mar
 2023 13:35:13 +0000
Received: from VE1PR04MB6560.eurprd04.prod.outlook.com
 ([fe80::154e:166d:ec25:531b]) by VE1PR04MB6560.eurprd04.prod.outlook.com
 ([fe80::154e:166d:ec25:531b%5]) with mapi id 15.20.6178.026; Thu, 16 Mar 2023
 13:35:13 +0000
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
X-Inumbo-ID: 62ee82c7-c3ff-11ed-87f5-c1b5be75604c
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=MG/2ytgrY1z0rz3XDa9pGV7xNTiuqvqqg1q49v2xt+eeFxSHhA/QPgBDYykEgrXLfWUKIx5PEBhtjxWgY+joYmNeY4X9LiV6u8mjV5huWa7d/TF1qhOJnnyRO4AhmhuH6dsea2Aq1EcLNaUUyvhO1fpikO/zo9HytUdfplUi4W0N6xAq1y1FbT2tgXWpGAOzNk6Duj7YOqDwL7oMS5dftLeW2/zNNEwjsV3jEArbyUhc9KiMQy7G+S2y4bB8VTzxLggANuugA3rAub0Hy/XsI3khwBzhPA/9JIWopZGWm5evaUDrEwXw8Xm7/BASOaac+cdaC4JeKZabxRxCBlYGFw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=w5lk2hv9qr7I8bVbRiQPTMXcQYyx+vBq6LdMC5slVcI=;
 b=jHVasOCBTy+BvsMVXAPeNRm/+zlr2pMFuLZeNEj1ZA5q6oQv0dEh8TocCj2vAKTEHfS/sIlwy4WLs3acuYX6BPKzUtrx6J0ffuYygU5LVLcWLItwc9ZJRkTt0uG+gaeKvQ7airw3ySMWJ8xU+QkrJEh/opqD2snP/0nNh7Rt3zh5cLNsm4VUFZ8bDLrCXM9ra+udSFVaZ3HrXEwkwMXJlJAk6XdMv/ktVQjYBNjx4Ah0a26eQXSMrj2CWL9P/rE/P374s2rxcEb/JvCNCC+ITmSKpNiX/G8m+HaUs8elPeMxV0WYI6d+cEAmVGYth2BnE9KVlfi61E1KfUZ9EORcvg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=suse.com; dmarc=pass action=none header.from=suse.com;
 dkim=pass header.d=suse.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=w5lk2hv9qr7I8bVbRiQPTMXcQYyx+vBq6LdMC5slVcI=;
 b=R7n+WJHVMw4q4kM7YM698hPXNN7fnR3CU0eTh8CiPtRBue8cobQ30JB5Q9G8sjYC02nA2mr7E1YvPdhYzm2XSq82h6fG1ESSBSBDlyBl5qNC7zqicq48h3Uo3z0GETmGkmoN5byYoRzZh3+BMAKd1OYMubK+coSRa+RkzYnVoOkS45xS5e4HzEJP2sNdFXQ3AT+lEqwnu5nQPsGQ5/rkBklRSVoixc+sgGOQrtT5uN29CXjZujFNPgHqpF3RktyaTlCOqxCb2HgRHbOUG7Pd9Aax3ejIi4UNiep6AZMBcf/D1JqCVBrrnAbciyDZhDaZmiVCcDnCb/orRWE0hij+9A==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=suse.com;
Message-ID: <550b161e-ed17-e331-d269-3f5b8aa4b4a1@suse.com>
Date: Thu, 16 Mar 2023 14:35:10 +0100
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:102.0) Gecko/20100101
 Thunderbird/102.8.0
Subject: Re: [PATCH v2 1/5] x86/paging: fold most HAP and shadow final
 teardown
Content-Language: en-US
To: =?UTF-8?Q?Roger_Pau_Monn=c3=a9?= <roger.pau@citrix.com>
Cc: "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>,
 Andrew Cooper <andrew.cooper3@citrix.com>, Wei Liu <wl@xen.org>,
 George Dunlap <george.dunlap@citrix.com>, Tim Deegan <tim@xen.org>
References: <882f700f-9d79-67d5-7e13-e42c3c79ba11@suse.com>
 <67b9378f-cf4a-f210-aa2d-85af51c51ab0@suse.com>
 <ZBMKhQWl1pZppgSj@Air-de-Roger>
 <91d3373a-2a50-f868-7471-08f9def8e6b8@suse.com>
 <ZBMZeXxqUsucQETt@Air-de-Roger>
From: Jan Beulich <jbeulich@suse.com>
In-Reply-To: <ZBMZeXxqUsucQETt@Air-de-Roger>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: FR3P281CA0103.DEUP281.PROD.OUTLOOK.COM
 (2603:10a6:d10:a1::19) To VE1PR04MB6560.eurprd04.prod.outlook.com
 (2603:10a6:803:122::25)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: VE1PR04MB6560:EE_|AM7PR04MB7030:EE_
X-MS-Office365-Filtering-Correlation-Id: 2a63d93e-9763-4632-92d6-08db2623450e
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	sev/O/4CMNuj7+dzI1fZ73wAEDndekkS0/3lVE/3XWrVejBT15JM48Z2BD5DlYRjjC8fIYMBV9WfmHrQDbJSqFaREWUx64kCDhEpbRinJA4P8TXKqviQ+5eZLk+4DnEocltH4fPXfBwU5GQZfvKXJi3M4yQ53tkh6tEc1//99ZgswfkKA5xrs3SqraaPwNTaZ2iduhKU92xD+TE+zABGL/xJTf0pEfkqy1ucMOA4CDg2RwNJtWIqk4GOg2zuav0cLd3+tHjr8WYC+5LvD37gW7jzrpS5EiGcme0ectOjHuPNEmgaIbGaI9YL2RXdCGGDn1Nn2nZvIXgJhex7nCGnkmG7Zv0ATF6dmZ+9jaVr7AktsrlID/2Vfid3WCVBFKAbJwCUzbTmca1G5wPbwn41AF8vQySFWsKtpRC+0URQ9i/rUz2TjQBnBja77akjQeCV3z05A9iaIQhFbMmLTlm2GsglQ4QlqjZkuzgTgTqqkr0omICPs8omCLNGGu6I3qOy59DhKmwIT7Xy+jYOwEvzNkA//daM7PNlIrLY7uEIvi0pw7N1Vc4Lora9gpEXMk2+xHhbKsax9kJdhfS2A7LI7e+ZgOD/aUkwpSqVwcxU6ULBLQ78DkOxAOHRMmgtOQTyrQop8Npp53Jor5dOmWlis6ekKL15qGajeLdykZG+YlPMumVn2lsDcyw/xwcRpNq0hQktkyFBsEqQkBR/ytRa//E1TyyXIHsIes1GjUWFqnk=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:VE1PR04MB6560.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230025)(39860400002)(396003)(366004)(376002)(346002)(136003)(451199018)(31686004)(41300700001)(8936002)(4744005)(2906002)(31696002)(38100700002)(86362001)(36756003)(5660300002)(8676002)(478600001)(6916009)(66556008)(6486002)(66946007)(66476007)(4326008)(54906003)(316002)(2616005)(186003)(26005)(53546011)(6506007)(6512007)(43740500002)(45980500001);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?Lzlpdmd4enVxb1RDVTcrcDdjeEFaTkhYNXJScWhXcFAyVGJJaVN0S051eFlZ?=
 =?utf-8?B?UzNtV2hNT1FwQXQ4bEc2ZG5TNThFWmhvVWRhdVFRSkk4aTVxcmV2WjdMOTZ2?=
 =?utf-8?B?RXJOaXNQb2NKU0R5WFN2SERGamZ4YUJ2Z3MwUDlxL05SeUZudkE1N2ZTaVRx?=
 =?utf-8?B?R2lzZE1sVGJGMXZ5SDJaUDIrWitiVzFCK2tMa0tWOWpFejd5ejVtS0lRbWVi?=
 =?utf-8?B?aWhocW1leE91RjMvTG1DdXcyWEFCYmFUZzkxSUpUTHl3ZUZjRzRub3k4L2lw?=
 =?utf-8?B?TCtMcHBaQUtCdTB2dUpDZmRpeWRybnBtLzkzdnpuV09SZW9Fd0dWNnZpLy9i?=
 =?utf-8?B?WWhZUUNENEJoTWpTWWxVZFlCbm1rYUdLVGMwWXVlWkN5N2RpZFI2S0hPei9G?=
 =?utf-8?B?eEhFYWRpUHhQeG0za3hoZVNtaW9rbHpIQW95WGZIQ2dxSEhPczhrYnJZMlQ4?=
 =?utf-8?B?V0ZzQU1QVmtIMjdKb0tuUGJRdDkzTHJzejc3d2lObUU4djhpN3ZoSWcrUUJD?=
 =?utf-8?B?YWJYWDZnRXRwcXFpT0ExUFROcmFJdVJ3OHQ2ZHdSS0tLOEJJaHpuVVZuTjEr?=
 =?utf-8?B?Z1JsbGtCZUdVcFZ4c2dsZmUxYW41UjNJajhia04zcElDekt5U3VpQmdSZ0sw?=
 =?utf-8?B?ZlN3dDdKSTNuaHRSczd0ZjdDRHQwNHIxaW93cytXU2FYTHpwVyt2Wllqc3M2?=
 =?utf-8?B?VS82bjZxTjVoNHlVUHl1OU50VmMyRTJxQ1hMUXpPTTdkK0orNHRHV2tsMVVZ?=
 =?utf-8?B?NXBUOEFoOGVmaUwwa0VjaklVZFZaL1YrZ1UzNmJzNFBHUDB1MDRabjdSRkRB?=
 =?utf-8?B?ekg4aG9lZERpQ1ZlZGtnNVFGZkQxZHIzK1Y0MG4xcVNLS0ZpWmVVNjV5RHBx?=
 =?utf-8?B?cEJySU1qY3ltSnBSZDBEZThPTlZYRlZCTnl6NnFRT2t5SERsQTgzTDRJbmJ3?=
 =?utf-8?B?Z0N0SDdCcXQvRERGZElPN0dxdmdDTjNZQ2UyOFVZRDVGM0plNGE4ZUtRaXdD?=
 =?utf-8?B?em1kbVJ5ZXRDRTUwNkx3U0V6eEUwVFNqKzBrWWRQdzF2cFU3cGR1VEp1U2lE?=
 =?utf-8?B?RHdIeVRTK0YxTTdVc3A2WHRtblM2UDhWYXF5Q0ZhZzFJZUJRcE4xYy8vQkw5?=
 =?utf-8?B?WW9mSDNEWWNKMm1mS1RpVmNHWlBWTGk1KzRoN1R4TWdFMkdxR0MxcHVHR3M3?=
 =?utf-8?B?Mnh4dURkUTlNUGpEQWRSd3d0ODlyVWZEYmkyd0tnblNqaE9EUE1COUsyY3M5?=
 =?utf-8?B?VmNROFlKS241a2M4ODNqVDFFbGxVZk0rSDJicWJOLzZIQzNCY2JNMytYNXVo?=
 =?utf-8?B?NVcrTWhsYXBmUk0xdnRTL2FZeGgra2Y2bTJqUktUOGFVR0RBOUM3TWRCMmJU?=
 =?utf-8?B?TXdEcksycUR3TXNTSG16aGhKd3lubEhxMHJkbGoyeEtqUUtBZ2lYMkdoUmtI?=
 =?utf-8?B?S1Q3U2RqbWJzWXd6NFNyQmNOZUlmTXc2VzhIWk93cDhGbi95ai90L3JMUEFj?=
 =?utf-8?B?VzR6L3VNMXFuUWovWTRBY1FwRlBWVWYvSk5saW5WQnA0V2p5NmM4aWFTN1Nw?=
 =?utf-8?B?QTJHTHppSVZMSTFkM0dVRWtUVkMxazMxcFRhaHpyODJMSll6MFp5a2FTWGRp?=
 =?utf-8?B?dkVFcWZLU2dLcU50ZDBXT3dYOTBLYzB5ODNiZVZBcm1mNzc5TC96UVBxYmtp?=
 =?utf-8?B?Rk5vZ2U0UkE1ZmRRNWk2SDUwM2hQaytQczNOS2tKRnNYZVdjVVJCL2dqZGF1?=
 =?utf-8?B?R2huUHJJRmZDSkc2RjYzSGRHSU9yai9mbXJGL0FSZlZReXhxUUxDRWpyWlpD?=
 =?utf-8?B?cDRTVlZVRWlycXNWam9wQ1hwcWppSThwcG5pMU9VNkxMLytRb0IrUXVCRDZv?=
 =?utf-8?B?Mmg5MjNrSVNxYmY1aU1FZDdSNDkrVW1XM2NKSVFkZnV1a0UwR2M4RUV3dEU5?=
 =?utf-8?B?ejdCNlVVeitRTVdRRGU5aC9tRXNJWWxJOE1vUzF6ZmQxUWU1czAzc2tQNnJw?=
 =?utf-8?B?dU1mNzZXUEthelh6NFlMMnY5ekZjdU1IS0FobFUwYU52QktiV0ovUFBXeTdP?=
 =?utf-8?B?OWkvY3ZEdE5GNVp3SldQQklFNTB6ZDYyeTdtcGJWUUI3M3FwSkdzSnJ1TEZj?=
 =?utf-8?Q?yldMbHDUNEQKW/KNVNDoiVpBv?=
X-OriginatorOrg: suse.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 2a63d93e-9763-4632-92d6-08db2623450e
X-MS-Exchange-CrossTenant-AuthSource: VE1PR04MB6560.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 16 Mar 2023 13:35:13.0788
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: f7a17af6-1c5c-4a36-aa8b-f5be247aa4ba
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: DS/xNLaNDkfLn0/AEDIYyItv/VLAMzEgOiIYiOZQutTx5jhRCGUxfm2T09b8a9c8JxMlY9mVM6rzU16Kn2FUwQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM7PR04MB7030

On 16.03.2023 14:28, Roger Pau Monné wrote:
> On Thu, Mar 16, 2023 at 01:57:45PM +0100, Jan Beulich wrote:
>> On 16.03.2023 13:24, Roger Pau Monné wrote:
>>> Maybe we want to pull that hap_teardown() out of hap_final_teardown()
>>
>> That's what I'm doing here.
> 
> Oh, sorry, I've missed that chunk.  Then:
> 
> Reviewed-by: Roger Pau Monné <roge.rpau@citrix.com>

Thanks. I'll take the liberty and swap '.' with 'r' ...

Jan



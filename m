Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id B46F06A17EC
	for <lists+xen-devel@lfdr.de>; Fri, 24 Feb 2023 09:26:57 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.500796.772291 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1pVTPb-0003Th-Ph; Fri, 24 Feb 2023 08:26:39 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 500796.772291; Fri, 24 Feb 2023 08:26:39 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1pVTPb-0003RB-Mx; Fri, 24 Feb 2023 08:26:39 +0000
Received: by outflank-mailman (input) for mailman id 500796;
 Fri, 24 Feb 2023 08:26:38 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=cKFb=6U=suse.com=JBeulich@srs-se1.protection.inumbo.net>)
 id 1pVTPa-0003R5-PX
 for xen-devel@lists.xenproject.org; Fri, 24 Feb 2023 08:26:38 +0000
Received: from EUR01-HE1-obe.outbound.protection.outlook.com
 (mail-he1eur01on2051.outbound.protection.outlook.com [40.107.13.51])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id f4a9ede4-b41c-11ed-88bb-e56d68cac8db;
 Fri, 24 Feb 2023 09:26:37 +0100 (CET)
Received: from VE1PR04MB6560.eurprd04.prod.outlook.com (2603:10a6:803:122::25)
 by PA4PR04MB7933.eurprd04.prod.outlook.com (2603:10a6:102:b9::13)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6134.19; Fri, 24 Feb
 2023 08:26:08 +0000
Received: from VE1PR04MB6560.eurprd04.prod.outlook.com
 ([fe80::154e:166d:ec25:531b]) by VE1PR04MB6560.eurprd04.prod.outlook.com
 ([fe80::154e:166d:ec25:531b%7]) with mapi id 15.20.6134.024; Fri, 24 Feb 2023
 08:26:08 +0000
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
X-Inumbo-ID: f4a9ede4-b41c-11ed-88bb-e56d68cac8db
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=X75NqRkQCOoV/8mtx99tT783WkOinHZe2j8s1ju6E8hrPvIoOKXJdKttV5e6QgGNIkhWJ8K3AHR668wSr+LjamJhP1IrXsgBRYy0TD10pNVhrGFL2+afPRNPgAQ/K5P5tOyt2hoDoWoktdqpOlOfbzFggwq+x5yv/dccO65UJChyq0rQ4eev7W7HDh4/MH+dn1PhhfKb+OZsdCb8KXtcjNGiRhWC3Yrkb7VtGzr2DR8ZBcHHpNQWnWGV9kgaaxDespd03ny52uN2yjIVouAJvpKIhgB3ODTtlyWfGJhMkc8z/CJrYJRIMrtjraiCBQhoVJiHNueqc/RXdAmwQTrO9w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=+gh2gpVz2UE9d5OfUzIzUtMYYVvshlXExR70wjICqxI=;
 b=hUoIccixWVp3Pn5M0rQBQ1AntvHahCx+CN7rEbtcXuyjgg6MuVfzIJKzZQzj7V32IlujD8FOlAhRDR/TFL5L06JOJ1+KaifRJAJl5B+ho/J7l9S9nKSwGtkvTEXba9qs+euXj5MeN3nBaSE0BoHeZWMYTQgSjgEkpB4NK9u9Zqxcyiep83qZ0QPVLRY+H7qFE1+YOP+JKA5hESjI6FW9v62/AbLODQ0d+Tn1iFxH3ABDEtjh4pa3g0/fiSIh64ENcx38OOPL7rsXYmM1AcTNw1K4kc5FPL3JzbhttWxt3D4DR3LlYU4/Yl7J82t+92AkqiD6/wPsGOP5aA+acwztdw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=suse.com; dmarc=pass action=none header.from=suse.com;
 dkim=pass header.d=suse.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=+gh2gpVz2UE9d5OfUzIzUtMYYVvshlXExR70wjICqxI=;
 b=Pso1BEuVHxu+tdsN4UfWfXI7au+XTYjTfpZZpn2L6Pb84BV8VWXU1zIs9zQTrrfztOUvTtF1a7jLG9pHPliEFYg4hCf/IptwR/yntqx/Z+DAUK9k+o1ZX7rMedyd8kUY8g5H+3GttWZ/PcwUxhrWe/Ad6qs0Wq0B35WX6/H02MGVn/g7e3toSAdFWDqSkmxF71Nn3KRMNzWjf9dUMnUtcNjC1VZolm/vmaKActQWiJMLZSXIVJvQkRuXitUu4nlXcVy0Uw+bK/TDYZ2ww7LO8lnsdOx1SouLRdVDSXylXMAu/POPZbfozn3AVMbzkbM/3XtAnyzkTl/9pK2A9Z/9CA==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=suse.com;
Message-ID: <f60aa775-32a8-991e-05d5-35ac47d649dd@suse.com>
Date: Fri, 24 Feb 2023 09:26:06 +0100
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:102.0) Gecko/20100101
 Thunderbird/102.8.0
Subject: Re: [PATCH v2 6/9] x86/vmx: move declations used only by vmx code
 from vmx.h to private header
Content-Language: en-US
To: Xenia Ragiadakou <burzalodowa@gmail.com>
Cc: Jun Nakajima <jun.nakajima@intel.com>, Kevin Tian <kevin.tian@intel.com>,
 =?UTF-8?Q?Roger_Pau_Monn=c3=a9?= <roger.pau@citrix.com>, Wei Liu
 <wl@xen.org>, xen-devel@lists.xenproject.org,
 Andrew Cooper <andrew.cooper3@citrix.com>
References: <20230222120023.3004624-1-burzalodowa@gmail.com>
 <20230222120023.3004624-7-burzalodowa@gmail.com>
 <0f169088-53bc-afe5-8f10-970c17f261b7@suse.com>
 <37e79367-70b6-f541-ccd8-7ce797082756@gmail.com>
From: Jan Beulich <jbeulich@suse.com>
In-Reply-To: <37e79367-70b6-f541-ccd8-7ce797082756@gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: FR3P281CA0021.DEUP281.PROD.OUTLOOK.COM
 (2603:10a6:d10:1c::11) To VE1PR04MB6560.eurprd04.prod.outlook.com
 (2603:10a6:803:122::25)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: VE1PR04MB6560:EE_|PA4PR04MB7933:EE_
X-MS-Office365-Filtering-Correlation-Id: a9ea8172-5327-42a4-795b-08db1640c771
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	/ybLQh6LadVl9BJtZXPgvJEW26kHvf/IeR54LAk6Nw/Q04W15ttMDE3phaKZ3/UJktaTSLcdHQjpqODr13bqh5pfzUnLadXkiL5hVD51r6pwy2oic82aUMunSCMkZjH7hwnfto6PuHjIQpa++oyVUa+5ap5uziqx3VhRNfk2NSh+W32r7BRo63Fo2mtzVT/oL5/NiZ8SnRPO21s+sYqithUIIGh6sBDzs6+lvVTFbsQcepX5XNp45V0HprrYl3Nu6kA2RN9Nl40zHXSYcrId6mwCOaJoeFtCIC7cB/KOlF57gVVIX8L/+J5VZcrkFhbR8CLx4FdtIXPYVuZzYwb7fk0mognzyhEpgri64CZz8OhzHpMgOyVD+Sh5uiwzaniorFzIu55LWjx6cgLDi64KLRYR+3AmIjKw9gs8LnD+NZJrpetb84CSpx8UdgAU6UJ/Uj8JKsWMgaLJwx/6Gt3V9hshnrm71DuySnuOQ6NO+ukRwcDXu6YE3aWfCbJ3gN/1f6gOPEIra44L6GVVFQcwu93wM3YsfrGn7+9CvSuHDK8yyEzg0LQLEafCT8INEXjpwIYTkZtnr6YTAyVesIqB5k4MOIKGrj5utXQcftWYlGQho37p0ZfTQtWjFPDxy0rc1gib+CyoyDkMKo+tSPAB2DW71eLLZHy6ukQenxjfXAsYKVQEGYC8JIbWy2XTeD5yuFqlT2U1bcVI6isKNbfyqo3IlNBTOFaDy2dX/5iGkUY=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:VE1PR04MB6560.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230025)(376002)(366004)(396003)(346002)(39860400002)(136003)(451199018)(6486002)(31686004)(186003)(26005)(53546011)(6916009)(8936002)(5660300002)(4326008)(66946007)(66476007)(66556008)(83380400001)(8676002)(2616005)(6512007)(6506007)(36756003)(478600001)(54906003)(316002)(41300700001)(31696002)(86362001)(38100700002)(2906002)(45980500001)(43740500002);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?ZHAwdG9ZMWIyelc0ajUyYmxleTFlRXA1MFJScHNjcERkanVnSi9qcWJjakpN?=
 =?utf-8?B?QU53OUswL2VmU0JKaitmbk1FRFdwdkowVm11a0Fmait4bDEvQXg5YkRQVTlw?=
 =?utf-8?B?VUREbEhQbHNWYVpPN3hQcnJmS1lRUENXZHBBL0VjYzBORkErZWthbVo1MEFv?=
 =?utf-8?B?NmkrWmhoY2J4KzM2Qnh6N2U4dDRQZDBZUFQ4TTJpSzNwUnVXZ0xGcnkwdUhm?=
 =?utf-8?B?SWNLKytycDFHVzN1QkRmeUlxQU1FYlhVTy9MTHkwK0Vwc1FPVUFDVy9sVCtk?=
 =?utf-8?B?WXlOL0tGOHdUL2E5ckRkRWdmdFN5dlNpb1ZZQ0FPOFZLUS9KTkVDVEQrcEZY?=
 =?utf-8?B?bUlFZ28xMlFGVjdpZjJJZUV1SFhlbEdiUWxMLzc5Qm53Yjg1QjhKWStKRXFt?=
 =?utf-8?B?WFVYaXFrYUZDd0lMenlnUTAwY3pFaUh0NUxXZ1dMa3pVZ0FjNGgzc2pEOWJ1?=
 =?utf-8?B?WGEyeDhnTkRoVk1qZDE1N0tDRDhsMlBhTDN4VWJFb09aVk9RU2YyYkNOcmRP?=
 =?utf-8?B?S3RnVVFGbnI1V1o2WWpBOStNcE02TmJ4OEVPK25ON3YyL1dCRUpWdEowQzBY?=
 =?utf-8?B?cFp0M3UrYmJ0STNkY05ieW9mVU5yRFdCT0RBdzN1WVpha1BsQkJiRVQxKysx?=
 =?utf-8?B?T25xVC9YeXkzRVNrbSswVitkYlBDMHgrckFFQ0dRc0hITmVLbGQ0T0Z5Z3VF?=
 =?utf-8?B?Rk5lb2YwTmFXaFcxTFBseFVuaTN2bkZYci9pWkgxcGZPOUFtVVozK3ZiZGxF?=
 =?utf-8?B?NElUWitxWDJmREhPSjRHRzJLekxodVJXV250aUxzU1hKN3VwV2NRUGtWL3M1?=
 =?utf-8?B?czFqeFpGb1dQRU11aWFHNC9Oa3BtSFlWRVdNS3UxYzRsUVpRQUlFTWx3RjFj?=
 =?utf-8?B?ek1FTVAwdk1WSlBQUTRuUEw2WUlkWEdKYjJqcTE0WTJFUG9pYzJnQmhuUU5H?=
 =?utf-8?B?TVJleFZEc2pmdWV2Ykp0VGVoNkdBNEc0MDQ4V21XRnZPRDVoQzRNOFd6UUdB?=
 =?utf-8?B?aXhBNmV1N2RiRVJqRWptMW9yemlBZXFGWUh3UW1ya0FtRCtzZkdMS1p5cFcy?=
 =?utf-8?B?cWhvVTczTmdYYTN1ZGZWTE5jUlhVY2ZBSmI1MFl3a0J0WkFZMkhvdXRsSlRj?=
 =?utf-8?B?MkFCd1FiMUZNbUJhT0tydXI0ZUVsM2NxSk8vaXV0UmdzNGlHWTNWZXkwdENW?=
 =?utf-8?B?OGhQRTBuSFhYdmQ0eGt6ZXh4VmxlU3NyTHZ3cVVTZksyTVFIOXB5OTliWVRa?=
 =?utf-8?B?R3JlSGFacHlZUU5OTXhWNWVzRzVGUm5HR2RHS3IrUW56MWVYWHBDdFZtemE5?=
 =?utf-8?B?akw0a0xoOXBsdXZiSnJlMExBdVdvd0tvMXd4OVhnSG9uMDRQUDlrRG5kK05Y?=
 =?utf-8?B?ekVRY2dJOGFwQTdyMGord1BPbkg4eTk3RjF1blJ2RnptdElJekZhcUkvZnRB?=
 =?utf-8?B?THZ5ZzE4VTgyWlBEbXN4ZFlZeUVBZ3FhOXlVZ2V2WHJoTkRJS1FySWREQUFD?=
 =?utf-8?B?WG56TnZnZUNmdmdQMHRIZjcwb09qbGc1SmxSWmw0UGs5c0NoK2c3N3NCWVJW?=
 =?utf-8?B?WVBIVU9WMEZ3OWZLRHdsN0tUa1A0eXpCRWJzdjB6NzdPRHUwMnJOUWtNeS8w?=
 =?utf-8?B?Qk5jUmVJOW56Umw0anB6OHRxckJ3THJyRkl5NlpyelJTZ1ZmU3pmdGJOOFZu?=
 =?utf-8?B?eEw3dGpuVUJKKzlwTi9xaVJwRW5OZ3c4bHY4dnpkYU5KanRMa244R0RZVVFQ?=
 =?utf-8?B?V3BINC9XcUtPTUpzU200MU1qVncvSEdWN1hSOWtJZTVLcnBPaEs2cGFTMzhL?=
 =?utf-8?B?bG03U05wUGR0Mis1WWVkZEhvam1rb0VOZUdueGhZRDFVMVZxTERJUWM0d2cr?=
 =?utf-8?B?Qmt3SGltRWlYNlgrT2lzNzNsMmtadGFQQjd1eUY0THlpRm5VeVBNWHJuNTg2?=
 =?utf-8?B?dEQwbENPbmVzRUdQQXZJbnY1Y0FkanlVRWs0N1llOWh2cGYvanArWGtkY2p4?=
 =?utf-8?B?SHZoK25lSVBTOHNKWThPcWUrdGJORUlNS3dtZENKK1puU2Y0N010bTNVSURL?=
 =?utf-8?B?YS9kYzI0YldEc09venA3VlZsTGF6Tk1McGxzeXk1VWh5SGNlWUpJY3lZSkhN?=
 =?utf-8?Q?HoxU0C5kU+CWIU/WJYA8VlBl4?=
X-OriginatorOrg: suse.com
X-MS-Exchange-CrossTenant-Network-Message-Id: a9ea8172-5327-42a4-795b-08db1640c771
X-MS-Exchange-CrossTenant-AuthSource: VE1PR04MB6560.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 24 Feb 2023 08:26:08.4127
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: f7a17af6-1c5c-4a36-aa8b-f5be247aa4ba
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: tLI2S+6cytFbGquOT3rJUrvfzqpanmPFizfqs72d6LCkkOqagn6RG4+e0vawtVaYWcbalVfCR1GLsJt30Ma8UQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PA4PR04MB7933

On 24.02.2023 08:49, Xenia Ragiadakou wrote:
> On 2/23/23 12:47, Jan Beulich wrote:
>> One file wide remark: I assume you've put things here in the order they
>> were in originally. I think it would be nice if some re-arrangement was
>> done, e.g. all structures first (unless there's a reason speaking
>> against doing so, and of course not including any which are local to
>> specific inline functions), then all variable decalarations, all function
>> delarations, and finally all inline functions.
> 
> Yes I put everything as it was. Thanks for the review I will address all 
> your comments above in v3.
> 
> I have a question regarding the rearrangement, where are the definitions 
> placed (if there is not a semantic relation with some other part)?

If there really are any which aren't associated with other items (struct
fields first of all), then I'd say near the top. But I'm less concerned
there; putting struct-s ahead of function decls is mainly because the
latter may use (some of) the former. Similarly var decls before or after
func ones is pretty benign (sometimes it may even be more logical to
intermix them to keep related things together).

One other general request: Please trim replies. I had to scroll through
the entire 500-line mail just to find a single remark at the end, which
clearly didn't require all the context to be kept.

Jan


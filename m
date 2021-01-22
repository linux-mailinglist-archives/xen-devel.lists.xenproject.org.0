Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id CD1F4300419
	for <lists+xen-devel@lfdr.de>; Fri, 22 Jan 2021 14:26:39 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.72773.131088 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1l2wS2-0004W1-HQ; Fri, 22 Jan 2021 13:26:10 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 72773.131088; Fri, 22 Jan 2021 13:26:10 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1l2wS2-0004Vc-E4; Fri, 22 Jan 2021 13:26:10 +0000
Received: by outflank-mailman (input) for mailman id 72773;
 Fri, 22 Jan 2021 13:26:09 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=wVda=GZ=citrix.com=andrew.cooper3@srs-us1.protection.inumbo.net>)
 id 1l2wS1-0004VX-2p
 for xen-devel@lists.xenproject.org; Fri, 22 Jan 2021 13:26:09 +0000
Received: from esa6.hc3370-68.iphmx.com (unknown [216.71.155.175])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id bd824cc1-c4ec-4238-a6d5-a54219b126b2;
 Fri, 22 Jan 2021 13:26:06 +0000 (UTC)
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
X-Inumbo-ID: bd824cc1-c4ec-4238-a6d5-a54219b126b2
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=citrix.com; s=securemail; t=1611321966;
  h=subject:to:references:from:message-id:date:in-reply-to:
   content-transfer-encoding:mime-version;
  bh=idZfD5FKYgYLyc3sa8GjeL28RVWd159kexyowPfte2I=;
  b=Vnq3kSYzBcR8J4DqWoMrXEzi6/tNuKwTU+yA54lmXPia6TzFLGfFJB01
   TEchsxjS//kE0QDBi30l0pMNgwTEd2XPPJzDO4NrRic9gyadb63EK9XGf
   9olSRgN2vM/irJL710DqmJDgAwrRHw2vZCnlvbx6Teod+2FiXDrXOtvjP
   E=;
Authentication-Results: esa6.hc3370-68.iphmx.com; dkim=pass (signature verified) header.i=@citrix.onmicrosoft.com
IronPort-SDR: PLircvBKzmbJFx1E4FzpB2GEfm+89/KN/pqHg9B5Rt5hDv6vwZk2gi0eETtv/TP2BbISxeT47G
 YZuQN36PF1ViDDbG41Iqfw7FRvowAloajcZgTdC64VElIBoO4/VpYI1EViqp2vnPzgaHvA110J
 1OGjrnCz0o90fZEnSt3FcohsS7ecLnl5dPoXmOjlpAmn5RJjBWpyVzZls6W0pOzM+VHKmN9c9q
 Cgx7uxaoVkDLnlFX2PX01GO9uTUcZqfb3isHy+6Cjb6erfVoH2R30YSdNVkHO2AwkeekCBcaGv
 HOA=
X-SBRS: 5.2
X-MesageID: 35866139
X-Ironport-Server: esa6.hc3370-68.iphmx.com
X-Remote-IP: 162.221.156.83
X-Policy: $RELAYED
X-IronPort-AV: E=Sophos;i="5.79,366,1602561600"; 
   d="scan'208";a="35866139"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=GrVZqLXKorg7PS6UPbnuXlyA5iMcHy9mR5/Twl/TXTnyLRD2GYDUg1inqBIQCQxABV8J1x83TcR4mFEUB/01sBJiWg3gi/leo577nxtXyg3dp9OCNuxcfQJtDlMbB7O3w68XvD3LMuWL8zhCBUfmMeVFgZ71FOSVxTratQocl4QDe/JWNP80TQ4Y33un/76Qg2E28tvwxnr5KrpE9ES01ft8GaQtXYOvfQnMFNwf94Khm0ozqUZfkV4RTwJOtfQ8Ozs2FNOc+ehRzkmaa+Lgo0lpGcWOUBYXTDTJf+ty6RGnLW+1ubYH/LkHwyVQrxSnTSK7on0KUGYVH0JuGmZ7dw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=YTKCD9Sl6noBKxs3M5+kG1C/F6iEkr+E3DKmBucsXOA=;
 b=Jr06wRXxtbnK8o1E3Mo89I/aMvwsgu/deFMQ4ZnEDGo09IVEypXGOSzugXzylKDOS0YwW++GJpa3FgU8JrLfWm0bQBD4LcMLkhosZFJo64OjzRZXwUaNw8WcXREHGNQAdX5anx4u73cqOX9c/G8Wr76yaQ+IaS8guB2OInu6IHn1jnwEiAOKzLBN91lagiZwnKiYTY2VLPHSdRvmWFBaklzlfyzSSc5fHgXQoz0SFyNKPbhQO08NsfCwUkFSGPc605yuOX9eJ9EcE29RZiVdbTe2mIVf2tIlXi01DqnpOzrWlImMvpM41L+4VC8VutG54ugVNj4510cTMQ3SAflYBg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=citrix.com; dmarc=pass action=none header.from=citrix.com;
 dkim=pass header.d=citrix.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=citrix.onmicrosoft.com; s=selector2-citrix-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=YTKCD9Sl6noBKxs3M5+kG1C/F6iEkr+E3DKmBucsXOA=;
 b=ldgZuvqZNxCEHs7ZgIbdq2K9u0e10Gu6eKkL8mE6DJVlHQRitMQV6PHrIJh8Lmu9Ip37UwsqUC+L6qKdVAWnbNOTt8+NDnA9DRnggPjplpbWAsqyhsoOryjvQaOMA1ff7YIrofk35e622nelTJJ55ardOO4OzzCqXNvji25jPZY=
Subject: Re: infinite loop in xenstat_qmp.c
To: "Reiser, Hans" <hr@sec.uni-passau.de>, "xen-devel@lists.xenproject.org"
	<xen-devel@lists.xenproject.org>
References: <9E9AC979-4A93-4527-B36C-BA96EEF190D1@sec.uni-passau.de>
From: Andrew Cooper <andrew.cooper3@citrix.com>
Message-ID: <b338b60d-85e7-90c8-262c-ab123aefa662@citrix.com>
Date: Fri, 22 Jan 2021 13:25:56 +0000
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.6.1
In-Reply-To: <9E9AC979-4A93-4527-B36C-BA96EEF190D1@sec.uni-passau.de>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 8bit
Content-Language: en-GB
X-ClientProxiedBy: LO4P123CA0291.GBRP123.PROD.OUTLOOK.COM
 (2603:10a6:600:196::8) To BYAPR03MB4728.namprd03.prod.outlook.com
 (2603:10b6:a03:13a::24)
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: e2660e18-6fea-4a8a-ca4e-08d8bed94340
X-MS-TrafficTypeDiagnostic: BYAPR03MB3685:
X-Microsoft-Antispam-PRVS: <BYAPR03MB3685F5D70F218F9354B1032CBAA09@BYAPR03MB3685.namprd03.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:8273;
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: LrfrFVnvoMA/jOf+K1bjC1Ty6vwdvzAorujb2c/tOjBotLo78HYU1gPHxR0RtvMBgugh/EbQ703nC5oWjMyQLag/Zn52hH45xkBvZy+iIw31vdNKWSgHdLegE7ALTUANoWN7RsuXweENNCQPyZx8Fk1SD5NTvJvl7kk2LW/xWVTgfeAM/hgt+C9f4hNQyLxVnnas5GfBMJwc5UoI7AJ3lG9XQ/GM+jk/9/j7NzaSVjTH4bFkzbDsvVf0eDYKOZ8giGxOI+7CyO1KBzFdUzImPOdMX47I4ImDKgow1GAtwtyKW6WFGhKWP33iMMmyei7xc8P+EAEE91Av7c4CNuCNX2Ueb6ajLKF4hCN7R6erAeHdO/m9Ftq+I9FMLFsFDIdKU57MfKDWwu0y3M1YswQHMZ/kZaugXK7Tsf0WOMZPlisFUIA177cvq00YeghGs0pmV6jPOAOwBVV1kXIgr9dmeF7ZKkwtxYsJBSOpGauVn/A2zvbQKCivLGPZxPp8cv7qkVrXn56/DqhyQAwVUqkYPvW4SHFgqJeQcC1vOKVxeynURI1+EKx9Qug24yZeFwHF
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:BYAPR03MB4728.namprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(4636009)(366004)(346002)(136003)(396003)(39860400002)(376002)(956004)(8676002)(66946007)(8936002)(2616005)(26005)(83380400001)(86362001)(66476007)(66556008)(31686004)(31696002)(53546011)(110136005)(16526019)(186003)(316002)(36756003)(16576012)(966005)(5660300002)(6666004)(2906002)(478600001)(6486002)(43740500002)(45980500001);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData: =?utf-8?B?N0s4dm5RbHZSeVNtcTk2emZFVm5FNVJLRDlFOWs4NHI5ZmZDZW9CZzdDYUtx?=
 =?utf-8?B?SXY1V2dSNVlFRVY1ZGowOFZZWThCRE13aDhqTUkwVXpxQ1djeG1zeGVjUjdy?=
 =?utf-8?B?dWhHd2x0bEN3VnRlZVVVcFBIc0JESWFNdzArUEo0N3UxL05nUjJyamlPZitU?=
 =?utf-8?B?bS9ZK2tXbEI1L3h1OGYxZEkxdGNDZ3p1cWszWXd0WCtNckZ5SHllMzNXaS9m?=
 =?utf-8?B?ZGg2b3RhNlJVbzVpcmkrOXpEMXB3RXU0eWxZVDNRQUlla2RmY2Y5REh5YXBX?=
 =?utf-8?B?SXpQV01zSVlJR3U2YzlUckFBekQ5OUw2ekcrcmpqQjdLQ1BqOVhhQ2F5dm9D?=
 =?utf-8?B?SGJmZjZQWExYNnA3THNidWFoZUNTRTZsNElKZnlZNWw0NW5HOVZZWU9HMjJj?=
 =?utf-8?B?VFBZbWpmZUp5SWpPdnBLQURZc3hNK0tMNkJySFpnUUFxK0hZVm90dlI2Y0gy?=
 =?utf-8?B?SW9UcFNrZ0JlMXpES3ltSW9VNnVmK2pzVURsa2pMenpWaWM0VjY0VDBnWkpL?=
 =?utf-8?B?MkJnM0RaeWhZYk1KeUhrT1lFc09sZ3V0eDNCMFRySHc4QXloOHhISVAzbGlC?=
 =?utf-8?B?UkVUYlE5dDRvZVg5TlFZZjNtTDM0eUlZMzFCN0NNNEsvcVc1M0psTm10Q1Qz?=
 =?utf-8?B?UFM5ZTJzcmJ5NE9HMjRSUEhtS21XMUQzNExXenpZQ1dPcWRqR2UyaXhGNEVH?=
 =?utf-8?B?UEpKeDdCajM0K045aE9paTRkOUx5b21tQkZjekI3ZktMdC9iN1ZKQTV3ejEr?=
 =?utf-8?B?cXRQblhuWGFZNVZVcG8vblZlYmNlT2ZrV3dzUVlvWTN5b2hjc2twbjZyUnov?=
 =?utf-8?B?ejhOaGkyZ1BxQXRRRzMwQy93UVJZZTZEWjcvK05qaG9qUGF2U2JNZEhSZ3Jp?=
 =?utf-8?B?L1UySC9lL0lrYXVoSlBtYStxQ3RXbVRlMUNTbnlZaG1ONHg3dkhnMDlaQ2Nq?=
 =?utf-8?B?bXh0eWxKNFNyQ1Nra283WFBYOUFYM1ZjOWxMbEZvazBIaDdrZFljWWRiclJn?=
 =?utf-8?B?UnprQndSaG5kU2VKcUowQmhxSkI5aGNNMnF5cGlMVDV6RlM1eTJ4aXRtSHVj?=
 =?utf-8?B?bmlxWit6Y2VDNUh3cmFneDNxUUtKYnRpQ2Z3ZU83aEZTOFBKLzhkL251Mzl0?=
 =?utf-8?B?TXk1YUFLbEhVZzJPZnQ0RDN1NytIUWRHNks1dFh0eXZEUlBNWDNWNXJCN0Rj?=
 =?utf-8?B?WG9EcVpCUTk4dTVJeGVRU2NyNDM1YXV4VUg5bTgxMnk0a0FjdGRYMWtVdWUz?=
 =?utf-8?B?VDFUaU4yUzVSN1ZZLzFlTVN2S2dUMTNOem12bFJ4N3FEYW9SeFJYVnBtS1g2?=
 =?utf-8?Q?ijsty6C7myWCw4C3RSqmzpItbhdzUNVjAh?=
X-MS-Exchange-CrossTenant-Network-Message-Id: e2660e18-6fea-4a8a-ca4e-08d8bed94340
X-MS-Exchange-CrossTenant-AuthSource: BYAPR03MB4728.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 22 Jan 2021 13:26:02.1483
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 335836de-42ef-43a2-b145-348c2ee9ca5b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: z1J+qdj0vyt14OXlakJqPJq8SVMNMkb+J8LRlV4w+H2Q7w+YHIzV/BYRBkFYsCqKjO8vfP9dnU/5y3UNOAdBbQHL2olDmVp31f+9FDgJREk=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BYAPR03MB3685
X-OriginatorOrg: citrix.com

On 09/11/2020 14:36, Reiser, Hans wrote:
> Hi,
>
> I have seen several occasions with "dead" xentop processes consuming 100% CPU time, and tracked this down
> to the following problem:
>
> When the QEMU process the qmp_read function is communicating with terminates, qmp_read may enter an
> infinite loop:  poll signals EOF (POLLIN and POLLHUP set), the subsequent read() call returns 0, and then the
> function calls poll again, which still sees the EOF condition and will return again immediately with POLLIN and
> POLLHUP set, repeating ad infinitum.
>
> A simple fix is to terminate the loop when read returns 0 (under "normal" instances, poll will return with POLLIN
> set only if there is data to read, so read will always read >0 bytes, except if the socket has been closed).
>
> Cheers, Hans

Hi - this appears to have slipped through the cracks.

Thanks for the bugfix, but we require code submissions to conform to the
DCO[1] and have a Signed-off-by line.

If you're happy to agree to that, I can fix up the patch and get it
sorted.  We've moved this library in the time since you submitted the
bugfix.

Thanks, and sorry for the delay.

~Andrew

[1]
https://wiki.xenproject.org/wiki/Submitting_Xen_Project_Patches#Signed-off-by

>
> diff --git a/tools/xenstat/libxenstat/src/xenstat_qmp.c b/tools/xenstat/libxenstat/src/xenstat_qmp.c
> index 19b236e7b6..0c5748ba68 100644
> --- a/tools/xenstat/libxenstat/src/xenstat_qmp.c
> +++ b/tools/xenstat/libxenstat/src/xenstat_qmp.c
> @@ -298,7 +298,7 @@ static int qmp_read(int qfd, unsigned char **qstats)
>         pfd[0].events = POLLIN;
>         while ((n = poll(pfd, 1, 10)) > 0) {
>                 if (pfd[0].revents & POLLIN) {
> -                       if ((n = read(qfd, buf, sizeof(buf))) < 0) {
> +                       if ((n = read(qfd, buf, sizeof(buf))) <= 0) {
>                                 free(*qstats);
>                                 return 0;
>                         }
>
>



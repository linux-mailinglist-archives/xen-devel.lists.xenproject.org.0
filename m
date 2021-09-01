Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 9E02A3FE381
	for <lists+xen-devel@lfdr.de>; Wed,  1 Sep 2021 22:03:17 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.176663.321508 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1mLWRL-0002NZ-3k; Wed, 01 Sep 2021 20:02:31 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 176663.321508; Wed, 01 Sep 2021 20:02:31 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1mLWRL-0002LC-0L; Wed, 01 Sep 2021 20:02:31 +0000
Received: by outflank-mailman (input) for mailman id 176663;
 Wed, 01 Sep 2021 20:02:30 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=rqR/=NX=citrix.com=Andrew.Cooper3@srs-us1.protection.inumbo.net>)
 id 1mLWRK-0002L6-3F
 for xen-devel@lists.xenproject.org; Wed, 01 Sep 2021 20:02:30 +0000
Received: from esa4.hc3370-68.iphmx.com (unknown [216.71.155.144])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id 60c7c1e6-1de6-4860-9bd0-4cb4b60bdd2b;
 Wed, 01 Sep 2021 20:02:29 +0000 (UTC)
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
X-Inumbo-ID: 60c7c1e6-1de6-4860-9bd0-4cb4b60bdd2b
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=citrix.com; s=securemail; t=1630526548;
  h=to:cc:references:from:subject:message-id:date:
   in-reply-to:content-transfer-encoding:mime-version;
  bh=EmmyNtx9gJnqTuQ1T0C4F0cNpIZQvuM75YDFAWagy74=;
  b=Si3uCYNbLsJIGNACwi/8aOVJ29ocU+luRPuncqpSYgdwdzucxmdZj/sK
   mYfpIVhIKTWiKe4S8wwx3u4FGYmWnapbvgSUglJLFHuQfkB63J6RgiB2t
   syHTm0MYIjxuA4eo0d5JN9uBSuzmXCpPhCJnpkoyvlqDfVzp1kep5vKSH
   4=;
Authentication-Results: esa4.hc3370-68.iphmx.com; dkim=pass (signature verified) header.i=@citrix.onmicrosoft.com
IronPort-SDR: YrbDmm78MqY8HkOXyNnxTm+XUC472m1zU8p0jm4KvCFkX1zPUjZeThCktDYOs/C+ml7jLgQR1A
 7yQpHbEhU5Yp9kF7fRJ87eQT3Xph+ClSDmH4Tz9kiZLf3eG4mSzIoOoWgc4w2YYyzpMJ3VPIkw
 bHki+XWuna1xmI6SkNUINki52x1lTnlHoCO/OS2xl1AVh0PSLdPXp9fOb3CYwhUPlGJUtil/wL
 Q2RrilOEq4EwW20IP7FwxC5tB0fVCBV60mGGhP4B4/NzrCX9CViUp5QjOeYG4zR5FFVkgE7cRc
 FxoG8OhLoShTmGIwmvPRQ3wM
X-SBRS: 5.1
X-MesageID: 53580309
X-Ironport-Server: esa4.hc3370-68.iphmx.com
X-Remote-IP: 162.221.156.83
X-Policy: $RELAYED
IronPort-HdrOrdr: A9a23:BTEvT6Ah5Vrc5grlHegisceALOsnbusQ8zAXPh9KJiC9I/b1qy
 nxppkmPH/P6Qr4WBkb6LW90dq7MAzhHPlOkPUs1NaZLXTbUQ6TQr2KgrGSuwEIdxeOkdK1kJ
 0QCZSWa+eAfWSS7/yKmTVQeuxIqLLskNHK9JXjJjVWPGVXgslbnnZE422gYytLrWd9dPgE/d
 anl7F6T23KQwVoUi33PAhLY8Hz4/nw0L72ax8PABAqrCGIkDOT8bb/VzyVxA0XXT9jyaortT
 GtqX252oyT99WAjjPM3W7a6Jpb3PPn19t4HcSJzuwYMC/lhAqEbJloH5eCoDc2iuey70tCqq
 iDnz4Qe+BIr1/BdGC8phXgnyHmzTYV8nfnjWSVhHPyyPaJDg4SOo5kv8Z0YxHZ400vsJVXy6
 RQxV+UsJJREFfpgDn9z8KgbWApqmOE5V4Z1cIDhX1WVoUTLJVLq5YEwU9TGJAcWArn9YEcFv
 V0Bs203ocUTbqjVQGcgoBT+q3qYpxqdS32BHTq+/blkwS+pUoJinfxn6ck7y49HPtXceg22w
 zGWp4Y342mAPVmNZ6UqY86ML2K41f2MGbx2VSpUBza/ZE8SgfwQqHMkcIIDcGRCdE1JcgJ6d
 j8uG0xjx96R6upM7zU4KF2
X-IronPort-AV: E=Sophos;i="5.84,370,1620705600"; 
   d="scan'208";a="53580309"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=GjRT/FjPZS6CbnMueP2+d7fUFHy52bNwYgpVFML6OfLwlQkXDKtgJRNdq7KD9esG41lTSrySb87zFwgkPV1NhBvnKMssh4cZtBAgvUJnl1/DKyjOq+w/p/ubwU6tjVleRuWROxpaxYaxWwfvGsNliWhFfYS8vhEYyjEDcFDZ59ycasUEw3lVeuZ3bTtGSqCsWR+Upm1dGz62uukCwxSs9tnYphrkzRENyS0ufqzY+L3aRde0vIpkdzE7kSD08kMShi0zxoT11qIPWEoqWKHS3todBuJddZDtbztDezCsvFyMoubRy8n3u5RKxMz9NVU+HBwtX7DOuH4rGayZDhP01g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=EmmyNtx9gJnqTuQ1T0C4F0cNpIZQvuM75YDFAWagy74=;
 b=aD2Sg7++GJQTZwTsM4iC9gsTOzwApxlxHZbZ1Yl5I0yq/11bGYSBr2M44A2QtAlAvX5AZLO5REcSK6PL+f/lC5CEGiiwuElc3i2elI2Bg0qXVkN/OrujecZJlxMSvksqxnenhyxeTDxNruDahkkXfKsWW9mTrpDKqCfkf+D80Z0DOVcjb96XaKylRnQ1Ko+hvyvRXeMzo0xebY0y6VBvZBlCLL0JxteU3nlL3CWienjDj8Mo8hhonQLUAQUUQgCrFq1KsXZjTq8ohKp7Ed+X2LjVtTRFZf6IK/D9wr7as3Lff2vWrI3Oo6tLydH5bWecjPPhuNpvLag7wZJd732mig==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=citrix.com; dmarc=pass action=none header.from=citrix.com;
 dkim=pass header.d=citrix.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=citrix.onmicrosoft.com; s=selector2-citrix-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=EmmyNtx9gJnqTuQ1T0C4F0cNpIZQvuM75YDFAWagy74=;
 b=Bn8Tk0RD/41282DH7wnfZcMQ+GxVzjHOUet/4u8X9GpiABoYNE8MvQ0uS16L58cUTICfJ9F38BIPWVwlwf78pD3Y0OpGmGJ1ZBsZuK7WBKY6IElC+qD2bogyLZvDSbr1BI0F5ek7wcdkh7jkA0H0QB1frXRc8OaZn/jNEEryCG4=
To: Jan Beulich <jbeulich@suse.com>, "xen-devel@lists.xenproject.org"
	<xen-devel@lists.xenproject.org>
CC: George Dunlap <george.dunlap@citrix.com>, Ian Jackson
	<iwj@xenproject.org>, Julien Grall <julien@xen.org>, Stefano Stabellini
	<sstabellini@kernel.org>, Wei Liu <wl@xen.org>,
	=?UTF-8?Q?Roger_Pau_Monn=c3=a9?= <roger.pau@citrix.com>
References: <ea5d1c22-967c-b11c-bc6f-9a8cac9a9823@suse.com>
From: Andrew Cooper <andrew.cooper3@citrix.com>
Subject: Re: [PATCH] common: guest_physmap_add_page()'s return value needs
 checking
Message-ID: <601d46e2-5c08-3948-85bc-1e027358700b@citrix.com>
Date: Wed, 1 Sep 2021 21:02:16 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.13.0
In-Reply-To: <ea5d1c22-967c-b11c-bc6f-9a8cac9a9823@suse.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Content-Language: en-GB
X-ClientProxiedBy: LO2P123CA0083.GBRP123.PROD.OUTLOOK.COM
 (2603:10a6:600:138::16) To BYAPR03MB3623.namprd03.prod.outlook.com
 (2603:10b6:a02:aa::12)
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 2fd9dd0f-a1c7-4afd-5bb3-08d96d836989
X-MS-TrafficTypeDiagnostic: BYAPR03MB3560:
X-MS-Exchange-Transport-Forked: True
X-Microsoft-Antispam-PRVS: <BYAPR03MB3560E9A541B255AF7FDAC1E1BACD9@BYAPR03MB3560.namprd03.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:10000;
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: MexvoXncCsIbznvqnfacMJ7V6q0akAtzYRoZ0TBJpARbps1x31yYA4hVOrP69lktsPTp5UiVj8SjAoRN2zzf1pfVXyybObhjFLiueKYaQiFKYjlWo8kSTfTC0ItNxizV2P7N+SBc++x2IDc2pkrdX2mVwPK15bmL9SOuaD5eHXUZCYT1r4YWDZ18SX2vamR4wbm36cUJWpZEgTOe5QxYQGZFXHsxIDVTD9l2xDABHQVmu58ZRNLBt/QlI0tyq3WVrm9U6RTskGSj+qQrHsPErLc+dK6zCyPQzt+I+8PkFO3ty8pTI+DL9EuKMx0ajGWQYRX80Q2YDH41boobE/Z9cWsbAAwsYcXemMhcfxB7LRDMomP4KyMwq7CMeWnQ0ddXf9ZSf1L0EExxJVpkiGmfq/s7EabyQsXhoGKGoLiCC4Ze4Sp5Qf7OT/xJyi1pFLnDqsN2yLOqBydc+YW44EzVHnE4ZHqDBI1Sro7tUYImZkbAFRPrcuFNctmtc/xAWsSoaRyqRn853zjfazBuTxtR/OKhZvmz0c+f90Yv4VrNv07ahlLFXjpvoVpGZJx7Qihn/KVgYz3Ge8K4ZKFCq54TqYM8nf0el/S6kNIXs5mqCzZKfhK5OZO5WVnzmipucuNmewC3BcfwSF9MxyCQms+Gz4fJayJ2XX9xnJwo+eohgODrTJ0fr3up3aXeve3Qys8tqD6TvKlaEd0ulzyn4Auuw9YZDy23sJUrTCti7wtTWfg=
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:BYAPR03MB3623.namprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(4636009)(396003)(376002)(346002)(39860400002)(366004)(136003)(4326008)(55236004)(38100700002)(16576012)(54906003)(53546011)(316002)(8676002)(186003)(6666004)(86362001)(6486002)(2616005)(36756003)(2906002)(26005)(110136005)(107886003)(66946007)(31686004)(8936002)(31696002)(5660300002)(66476007)(66556008)(956004)(478600001)(43740500002)(45980500001);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?RElSajFKZHF6cERuWDAyTlF5QndWbFRKNWdoV2VoaXdOa0pWOGRJTmpEZGRD?=
 =?utf-8?B?MUNBVitpTWdHeXplM3c5TmhiRjVQNUU4ak04STFaMDRhN0pGa2JqaERYUlRB?=
 =?utf-8?B?MnN6UmxwVzhKU3BXdzZhRStsSzZOZmdORmQvaVl6TmFHTWVaanFWM2tWOWx1?=
 =?utf-8?B?em9kWTc1akpKYndrNjE2NkNwN1hsQjhXM0hJdGg0d2dZSWRMWUtadzBjWUNK?=
 =?utf-8?B?cVc5d3FETldOeVo5U2JFc3NYYTVOdW16a3U0T1Jzc0pHOURsVEtsOHJJeXRv?=
 =?utf-8?B?aUpLUEJlaERMa204L0NxWXdaeWs5WUdCRDhXbHRzSGsxeWhGZHRpMWV4VmJx?=
 =?utf-8?B?QXdLejBBZEhmOHZDR0s5czR0SjY1ZGRSOXVjamUzZXptdzhTZlFOblpOU3c2?=
 =?utf-8?B?RzdWYSs5TlBReWNEWGZscEt4eTFSN1JtRXNHQlo0SCtrQmdIQ0JscDQ2VmpJ?=
 =?utf-8?B?Z2dxYTdoRUVNaGxwenMrbUpia2pzN2pWOGtHRElkWStXWmpXMmNPbU5ZSnNa?=
 =?utf-8?B?THNGcHlJSVlMdFlJVFNLU3FSZDJPbDdrQXFXZWgwUmpEdGJOTEtNRTJiWjRq?=
 =?utf-8?B?UGl6a3FmbE5raEppZFEvTzMzZ0MweDZiOVdQWjgzUVhORUsybVFiazVwcTJK?=
 =?utf-8?B?bzM0WTBCNitYNkFWdDlQZ0pmNk9rVWxxajBrdlNlNWRnb2xrTjJpeVdkbUFV?=
 =?utf-8?B?eWp3bFNRdnp5RVFZVWJQeWZuMUhqWlM4cEh5VDJ3SDRxcnd2M2FIUG91bnF1?=
 =?utf-8?B?TkxENlM3TEt5SmRVTWRHdGZFcSs0cHhNd1B0aFc3ZmJCR01Bb3lEenYzYXNj?=
 =?utf-8?B?bk5tR2lxYy9IVUdUTFRBS0pQbkZ6MlRLMlBIT0hZa2xzUnVDdGo3UkkrWGdm?=
 =?utf-8?B?UFk5aFFHMkJMNmg2ZUZvSitDWnVjNUN6OWV1d3phSExaK3JtUmlVY3JVUEhl?=
 =?utf-8?B?YTRZRnQzRjhpc0FuNGtyZXFGemF5U1RiUVV3OTVSYm9GRmhCOUpJb2owT1FR?=
 =?utf-8?B?NS9xS2lqQkljVk9ZVS91NFNjTjR6VFRiblpSNUdwSEpSVVppTjhiaktDZksw?=
 =?utf-8?B?ckN3RFFscXpwMjFSSjltOWhTL2pqS3NVdGo1V0pXSHRBMzFGakxWcnpjWG1n?=
 =?utf-8?B?dHpUWGY4Ujh2SWFlWm1heVloL0VLY2JYSGtJbFAvaThQTnA5SUhMT1l2RHFX?=
 =?utf-8?B?SDlnZXpwemJseXV0bjNhcWVXUGM4VkJoVTZUeHJ5YnhhZUtNSnhjQTUxM0lS?=
 =?utf-8?B?amQ2cy9KUkFVbmR1dmJ3djVBS09xZVhIa0FQSm1sTWFvNlM0b2NHanZVUFRS?=
 =?utf-8?B?NGdlRVA2MVg2cTBMVG9ZWGNueU8razM0bE1yK2VaQ1c3NXhPL2hBdXB4NXdv?=
 =?utf-8?B?WDRpbTBkUDZVbTVuUllUQS82Z2NTTWJTOFduSXVlakN0THN5Q3VKeHRPOFhm?=
 =?utf-8?B?SjdPQUxHb29vWjhOOExyTDE2QWFsUUJqaldOdjVTazRVLzlTSDltbnFoL3dK?=
 =?utf-8?B?SFVJR0dxUlVzT00zYkJObWsxbXIzR1Bqb05BZCtYUGNxSHdxbzlOb01zTUkx?=
 =?utf-8?B?Y0UydjNZbjRuNlY0TnAzOWJ0eVBMMDU5MlVCWlJlU1lGVlQ4L3VBWFFLY21E?=
 =?utf-8?B?ZU5wTE5zYUNWaFFsRHdidkpnZGhWTnVGL2hPNWFWQ21HREg2WWcxLzZvRmV2?=
 =?utf-8?B?MmFtalhNZjNFMkRZUnJVUktYSTdQMzBicFpPOXA0dHh5VGlYM1hkM0xiQWhS?=
 =?utf-8?Q?QpHJh98xseG0YFX84jRkBuuEue3pW2CBFyrHzuE?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 2fd9dd0f-a1c7-4afd-5bb3-08d96d836989
X-MS-Exchange-CrossTenant-AuthSource: BYAPR03MB3623.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 01 Sep 2021 20:02:23.1017
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 335836de-42ef-43a2-b145-348c2ee9ca5b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: Tm+4ouc25JYwTS+wF78Pk4NeRlK+veLwaKi2VH+tTQXoS6vJ4KR1nvYbssoElopkLryFSnf8CWq5zVjJBquw7DhbEVlkrSewzgjZzgy/qhM=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BYAPR03MB3560
X-OriginatorOrg: citrix.com

On 01/09/2021 17:06, Jan Beulich wrote:
> The function may fail; it is not correct to indicate "success" in this
> case up the call stack. Mark the function must-check to prove all
> cases have been caught (and no new ones will get introduced).
>
> Signed-off-by: Jan Beulich <jbeulich@suse.com>
> ---
> In the grant-transfer case it is not really clear to me whether we can
> stick to setting GTF_transfer_completed in the error case. Since a guest
> may spin-wait for the flag to become set, simply not setting the flag is
> not an option either. I was wondering whether we may want to slightly
> alter (extend) the ABI and allow for a GTF_transfer_committed ->
> GTF_transfer_completed transition (i.e. clearing GTF_transfer_committed
> at the same time as setting GTF_transfer_completed).

Considering there are no production users of gnttab_transfer(), we can
do what we want.=C2=A0 It was introduced for (IIRC) netlink2 and never got
into production, and then we clobbered it almost entirely in an XSA
several years ago by restricting steal_page() to PV guests only.

As a consequence, we can do anything which seems sensible, and does not
necessarily need to be bound by a guest spinning on the bit.

The concept of gnttab_transfer() alone is crazy from an in-guest memory
management point of view.=C2=A0 We could alternatively save our future selv=
es
more trouble by just Kconfig'ing it out now, deleting it in several
releases time, and fogetting about the problem as nothing will break in
practice.

~Andrew



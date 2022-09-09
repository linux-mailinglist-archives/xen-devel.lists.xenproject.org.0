Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 1A9485B2F20
	for <lists+xen-devel@lfdr.de>; Fri,  9 Sep 2022 08:38:51 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.403820.646061 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1oWXeK-0001eG-83; Fri, 09 Sep 2022 06:38:00 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 403820.646061; Fri, 09 Sep 2022 06:38:00 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1oWXeK-0001bd-4l; Fri, 09 Sep 2022 06:38:00 +0000
Received: by outflank-mailman (input) for mailman id 403820;
 Fri, 09 Sep 2022 06:37:58 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=Oy8C=ZM=suse.com=JBeulich@srs-se1.protection.inumbo.net>)
 id 1oWXeI-0001bX-4B
 for xen-devel@lists.xenproject.org; Fri, 09 Sep 2022 06:37:58 +0000
Received: from EUR05-VI1-obe.outbound.protection.outlook.com
 (mail-vi1eur05on2047.outbound.protection.outlook.com [40.107.21.47])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id efafe3ad-3009-11ed-9760-273f2230c3a0;
 Fri, 09 Sep 2022 08:37:55 +0200 (CEST)
Received: from VE1PR04MB6560.eurprd04.prod.outlook.com (2603:10a6:803:122::25)
 by AM0PR04MB4290.eurprd04.prod.outlook.com (2603:10a6:208:59::20)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5588.17; Fri, 9 Sep
 2022 06:37:40 +0000
Received: from VE1PR04MB6560.eurprd04.prod.outlook.com
 ([fe80::59bc:901a:98a7:76d4]) by VE1PR04MB6560.eurprd04.prod.outlook.com
 ([fe80::59bc:901a:98a7:76d4%5]) with mapi id 15.20.5612.019; Fri, 9 Sep 2022
 06:37:40 +0000
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
X-Inumbo-ID: efafe3ad-3009-11ed-9760-273f2230c3a0
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=lfex6C6CiA5kCuhi0VGYZzF/yiwYuIIxPzmv1UDnp43ytGVAwHWTb6pSe13lYVwzWTQdUqTTCtjoAZdOm2aWWsb8Ay9Eb59+aAAhLXxMgAwFhYV6EPcx9ata9KMLLJElAiUIM+7QvLriCWu4zZt80ELoqo6hGOoEhKFKJgz52TD8hiKxpU9wTfyWKaOHzWF+WWpOFyH1/bxiKH9k7dJh1M2Dzp57jth9UEQ5DNUG8FKWZtPtH8E/aPFKmbV4nkaicBbYBv/b2+jn+fYWk9t0dCLZK49YtSoNgxOI0OXcTT4HOum8kzj7Mk2FCRtMd1kEksy3CJTP9yCeju6fxMupzg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=25JcyLpzCBNQsdPGwv+P11c8g8K4FbBjsdktf1Zfi0o=;
 b=cFZWMsOIIvqiCZxgNAllMn3dvMr3uAz9DP+Qch0m8WV+H5cxqtxf/uVSCa4/dJYzRFM+/k+FX1Uugvt40k5FQRS6hkIv4LvAIeiAH3+3cBz4RdNys9RU+vNKdvOyb9mGCBTyPQqfyb13NjU6G1LOmasFLk60Tmh9Q+yVfFUz6yAnhh4QBnikKTF+z6VuzIi1RpI9rP8fgAZbVhaXMuSmiFB+Yb4mAA3pLu0inzZ5MW/MRwMmcTC/Iv1MFa07wHWfRbBFc4zi+jvUk1TksNR+cmcjtjJZZxTtNCtjaEt313LWcrA1fPDSRKRXrjvgRCohswD4lZyZnLO6k1Mo0bNg6w==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=suse.com; dmarc=pass action=none header.from=suse.com;
 dkim=pass header.d=suse.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=25JcyLpzCBNQsdPGwv+P11c8g8K4FbBjsdktf1Zfi0o=;
 b=V6cgH0skBuWw1ueUH1sNuUhq5qZXyTQuFoQWyE1Qqk9hO6QUWPmbkI6rPFjsIrFUo7hkw8zrMusxJRgRCzVq5kKD4E9U0Jwywx+XxP80/xnM6LJzfNs2KQgDEnbRykdQdztbXzu0Y+BB6BjzW7O3pn/MdAytH6Zgh10fzQEDYwOHw7Oin5mYFUv1qSzxuis0TeSjFBNeB7WncmiUY7x/g6qpCtLfXUdrOuumcxfKJlS7AIpArfDiO1mesKleY7dbq0wunkMPgyWC4DNys4oQIpW5EtmjP7O7alYIBU49d5sBPS18BzKQwmMU5p9aLengRNssm3NmhckrBvz7Y9iwXg==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=suse.com;
Message-ID: <b579c977-fb03-2e4b-2b40-3af6e269fba0@suse.com>
Date: Fri, 9 Sep 2022 08:37:38 +0200
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:102.0) Gecko/20100101
 Thunderbird/102.2.1
Subject: Re: Gitlab breakage: [PATCH] Config.mk: correct PIE-related option(s)
 in EMBEDDED_EXTRA_CFLAGS
Content-Language: en-US
To: Stefano Stabellini <sstabellini@kernel.org>
Cc: "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>,
 Andrew Cooper <andrew.cooper3@citrix.com>,
 George Dunlap <george.dunlap@citrix.com>, Julien Grall <julien@xen.org>,
 Wei Liu <wl@xen.org>, =?UTF-8?Q?Roger_Pau_Monn=c3=a9?=
 <roger.pau@citrix.com>, Anthony Perard <anthony.perard@citrix.com>,
 Bertrand Marquis <bertrand.marquis@arm.com>, Henry.Wang@arm.com
References: <68173fe3-b3dc-224b-c30f-719efa48fcdf@suse.com>
 <alpine.DEB.2.22.394.2209081633430.157835@ubuntu-linux-20-04-desktop>
From: Jan Beulich <jbeulich@suse.com>
In-Reply-To: <alpine.DEB.2.22.394.2209081633430.157835@ubuntu-linux-20-04-desktop>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: FR3P281CA0174.DEUP281.PROD.OUTLOOK.COM
 (2603:10a6:d10:a0::17) To VE1PR04MB6560.eurprd04.prod.outlook.com
 (2603:10a6:803:122::25)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: VE1PR04MB6560:EE_|AM0PR04MB4290:EE_
X-MS-Office365-Filtering-Correlation-Id: 63a9a79b-e879-454f-595c-08da922dcac3
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	WzQR00LkrhyieUbLyt3aMijsYwCIMqYLfA2v9zPtMpECtD8sCBJtROaHjwJyNwlFSrP6SN8BoOLqt3Bcv8/HHVnMzKBWBMizCHU5PRvUTdha+ze6P14UdU6gBhPTNZc2tUkZTseHgFhb9muP4aAm+OCJyZFV8l3F/XAxfJzWtdfnNxUe5lMrscEDzVrQT5mdF+H+PmXZ8iVjt/xzdY4Y6nOQCo/CP6FZ9XoOciA/464RvAD/fMQPmch+geIP85iT97GsKy+vxKUpVNIHxX3K4dGwlhFzI2Htz4DWrJUR+jV6H9NA1lu00g3WkWgHX1407rJtnRqqLGLFdj38DnfbSmYErV4rvVT6stU7dRVCdWej7jpgLm6SX95leHKJhyTDEfoJeXAj4FDjUUlPu7GTC7bNDzidQrJXiQKtdX/yk/TBXfbzvrnF/auOIDSOd7+x1m/flNom6w86CxEV/TRztnfvayQuXLNPfTZkKpAF9Rk3Ikn75EdiefV/5/0zEZoxReUzzJuQ0dgzjOHtiWxqIpPBfRj8XeSgnpp6/I+9rNvG6JbozMbQw99aYbgXMCSWDgLKDM3JeEqbB30EIzO1CRPUp+IpvDkpNwyUZGWAikPMC5P5MInZHfTYhLiomh9j3LmxH/zoAOYyJvw94A4eOEx2yka0M0oI3Ydh02Px93gIsXxkGTI/Flwzw72XEhDltwcCyMjoq4HuC8lYPmO8zZQqv0cAtS6xW6uSGCwzcgtHPlau4uU005k1Yi/CwrO5+bXxorZ/7ocdnA10mZNXKW8/YOkK616w+7nDp99s3PggQyX/VnrFO5T1r/NBiAGl9q4/qRNDehIy2bTlB0ixIPvVjWU1sJLPNb3wOLFzz1E=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:VE1PR04MB6560.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230016)(366004)(346002)(376002)(136003)(39860400002)(396003)(2906002)(316002)(6916009)(66946007)(4326008)(54906003)(66556008)(66476007)(8676002)(38100700002)(2616005)(5660300002)(8936002)(7416002)(36756003)(83380400001)(6512007)(41300700001)(26005)(53546011)(6506007)(186003)(966005)(478600001)(6486002)(31696002)(86362001)(31686004)(45980500001)(43740500002);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?RmFLT1NQRm01Z04ranJ1U3ZwdVdxYzVPTjFQek44a3c3YUxkV3ZLSHJYV1Fv?=
 =?utf-8?B?UDgxbExITUxKZkVGVi9JSDNwQ1NVVmxDWW1ZQlJaZFlla0doTUVyWG1lVDE4?=
 =?utf-8?B?UHdZakNFSnlzMGRNV0VlT3JsMnNWTHJndSttUkdldjNrQnN3VHJna0Z1NGtY?=
 =?utf-8?B?VjIrSk1jOFpzNUdwZE8rQ2FyZ1A5YnBCZTRuMDJmU0VEenRCYXlsNjB1UlJW?=
 =?utf-8?B?NTR4blRJclBJcDRWZ2Z4Tm0xNVN3SDNFTyt5WGxoWU90aitjY09SUGt4L3JJ?=
 =?utf-8?B?Z2VMY3hhbUI2eDh5VWsvT09hSUJFVU1LUmJlSjkrc3VQbGxmWkF3MzlKcGtx?=
 =?utf-8?B?NW9RTGp6N0V1T2d1djJJOGd2cmFsc0JGRUlMVTRBTUc1SjI1VjRtUlFhRlVS?=
 =?utf-8?B?MEtLc0ZIVTdzVk1pUTh5N0xsRkJjL1hUTWs3b2Z5d0FTby9aeG14d3BhOW9q?=
 =?utf-8?B?UWk0UmRWT2Z0c1ozTVByNmZvRWVpM0kxUjIycW1zUGhkcDNoVXFXSGREL21z?=
 =?utf-8?B?Y3YxMVZVbXdoazI4eGJQRmh4bVNIU1ExK1dXWnlrWHpGRXhXd0U5MlNaVmtJ?=
 =?utf-8?B?MkdRUmRUZE96eVdXVi93TEJyOUx0ajVPcFNYSFllRDZ0eFRtZ1kwamFNaXpp?=
 =?utf-8?B?ZFlwcE5BR0p5SmNXSlJKNitpNm9wcCs0eHJLcytvVlc4SVJxdUVoeHNramVS?=
 =?utf-8?B?RG41MXNia044YnVGVnAzMVBCRjF6SHA0ejlKdkp3Y20ycmtCZVlsVGkyTUVm?=
 =?utf-8?B?RWl1cnhwcU5JYkpSUktOcENjU2xtY2hsR2dvRHZDYUZOM2NQZEZYbkFMc052?=
 =?utf-8?B?SmN6dWpiMlU1U0gyQjRhanVLVVd0Z2p0cDFYZlFlZHR0Ulc5bSsrRXduN3NG?=
 =?utf-8?B?M3MvYjVIN2FiNlowZlF4NTk2K0N4Qm9IUHg0TTlGTlUzRVMrRFllWVI1cTVt?=
 =?utf-8?B?ZWF1dXUyRnNBVGN2VzMzQUYraWFWL2ZBTWdYQlNqUHpna0hKdm1tbmRYVzNq?=
 =?utf-8?B?SWptblpCdHU5dnBodkNrcmlDVGhydUV3bXM5b3UzMlhwMzlSSXBNQjJoQjBG?=
 =?utf-8?B?eTZQc0EyeVJieVZRRmlOSGRUbTROVm5wRUJVc2p5VTNvd1FkNGxkRk9RYVkw?=
 =?utf-8?B?QVhtK1RLK1VTRlp4U0pITFFqc2Q5dHVhRjZ2QmU4N3ViejFhdVdrOWwySVd1?=
 =?utf-8?B?bDF6Ry9tcFdDL3ViWC8vSjRwRzhZUHVmZU9obTFWcGYvaVNUMGd5QldQbmdm?=
 =?utf-8?B?MjFCSEZ1VHZDTks2UmNYR3N2MGpqemZpZ0ZIV2lVUzdVN2RnNWRPbUwzVFVF?=
 =?utf-8?B?NHkyTnZTbDRUaGZkQnBOT2FQdVNoMVpla2pIb012U1RWOGJmdzAxb0Z0VWZu?=
 =?utf-8?B?WHVJcE5FZDJ4cWZrN2ZlODBXYjZDVkhrNXdrS0E5TmZXSWRsQW5ORGNKbmYz?=
 =?utf-8?B?UnUzYzFzSTFMNDNlSHZUNW82bDJQREVpNHd0bnZ2WGxjRmc3cW44STFMU2hZ?=
 =?utf-8?B?RXBqYzIwM1hTM3k2NW9aZmRENUMvMm9MOGF5NUROYm5kcXFIbzg2MFpaWURz?=
 =?utf-8?B?QjY4R1JTcUtJaTdZWmFHdzV0aXR5YXFMMzVEUUxtTzdML1JKZXorZUZKQzVv?=
 =?utf-8?B?NEFvMTZzSGNMLzd6UmYwRHMrOENnNTRuQkJFU0RnNGY3dkRCaXlFZmYzd2k2?=
 =?utf-8?B?M3RoTWxYRVF4R0p0eFFTeUlGS3JzQXRTWmUyckZwQ2ZIWVZRV01EdU1YRk1W?=
 =?utf-8?B?Si9SalQ2RXRRZWptREVzNlprZDYzd3JsUEZ2QjZ6bjJlb3ZRNDcyU2Zia0pG?=
 =?utf-8?B?V3V5T0h3a0pkWWUvY0QzZzNmY0FmSS9MZEd5VVBOdGMzK1RLbGxEY0JOZmVQ?=
 =?utf-8?B?SXgySWtQZmFCZDFuWEx2cWZHOVk1d3RFVHZvZWlLVlRScFpuZ1dUd0JKRklF?=
 =?utf-8?B?dlNZcVpOUTBqUHYrZkgxSmhDZU1Sblltb3ZYWUpvNE5rMTdIU0J4ZU9ERjEr?=
 =?utf-8?B?THVTdUZ3OEhCMmlMeWs5RDIybnpzWW1yaWVtMnRyR1FvL2dqc0lGUmRHdGhv?=
 =?utf-8?B?d2tjRzVlZjRocHpHOVkxUWppMjBYZUVYMDRNd3RhaWozeUxmVGhEOE5UMS8r?=
 =?utf-8?Q?bRF8yHk9Ka9pc4lXfbFK308AQ?=
X-OriginatorOrg: suse.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 63a9a79b-e879-454f-595c-08da922dcac3
X-MS-Exchange-CrossTenant-AuthSource: VE1PR04MB6560.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 09 Sep 2022 06:37:40.4329
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: f7a17af6-1c5c-4a36-aa8b-f5be247aa4ba
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: EfLZHxkIshczw95JjoqAQVOWrby89j4xftzPYxOEWN5v4Qfc6E6GHNpwRovIuIHCq34Qhlf8j9KWi1c/KfCn9A==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM0PR04MB4290

On 09.09.2022 01:34, Stefano Stabellini wrote:
> This patch breaks the gitlab-ci pipeline, specifically it breaks the
> hvmloader build with clang:
> 
> 
> https://gitlab.com/xen-project/xen/-/pipelines/634274727
> https://gitlab.com/xen-project/xen/-/jobs/2996114313
> 
> make[7]: Entering directory '/builds/xen-project/xen/tools/firmware/hvmloader'
> clang   -m32 -march=i686 -DBUILD_ID -fno-strict-aliasing -std=gnu99 -Wall -Wstrict-prototypes -Wdeclaration-after-statement -Wno-unused-local-typedefs   -O2 -fomit-frame-pointer -D__XEN_INTERFACE_VERSION__=__XEN_LATEST_INTERFACE_VERSION__ -MMD -MP -MF .hvmloader.o.d -D_FILE_OFFSET_BITS=64 -D_LARGEFILE_SOURCE -D_LARGEFILE64_SOURCE -mno-tls-direct-seg-refs  -DNDEBUG -Werror -fno-pie -no-pie -fno-stack-protector -fno-exceptions -fno-asynchronous-unwind-tables -fcf-protection=none -ffreestanding -msoft-float -nostdinc -I/builds/xen-project/xen/tools/firmware/hvmloader/../../../tools/firmware/include -I/builds/xen-project/xen/tools/firmware/hvmloader/../../../tools/include -D__XEN_INTERFACE_VERSION__=__XEN_LATEST_INTERFACE_VERSION__ -I../../libacpi  -c -o hvmloader.o hvmloader.c 
> clang: error: argument unused during compilation: '-nopie' [-Werror,-Wunused-command-line-argument]

First of all I'm puzzled by the error message: Now that we don't (try to)
use -nopie anymore, it complains about this option? We're clearly passing
-no-pie now as the command line shows.

But then - yes, I was actually expecting a similar diagnostic from gcc,
and I was surprised that there was none. Yet I have to admit I should
have tried a clang build of the hypervisor, where the issue also surfaces.

What's important though here - it's not really clear to me what the best
course of action is: We could filter out -no-pie everywhere that CFLAGS
has EMBEDDED_EXTRA_CFLAGS folded in, but isn't used for linking, but
that's odd to have in multiple places. We could also simply drop -no-pie
on the assumption that it's LDFLAGS which is supposed to be used for
linking, not CFLAGS. But that would be wrong for cases where compilation
and linking is done all in one go. Looks like we do such only with
HOSTCC / HOSTCFLAGS right now, but relying on this appears fragile.

I'll see if using the former approach promises to address the issue,
but I'll be happy to take suggestions towards better ways of dealing
with this.

Jan


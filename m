Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 3613A3879BF
	for <lists+xen-devel@lfdr.de>; Tue, 18 May 2021 15:20:42 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.129194.242537 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1lizdy-0001gA-G8; Tue, 18 May 2021 13:20:18 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 129194.242537; Tue, 18 May 2021 13:20:18 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1lizdy-0001e7-CV; Tue, 18 May 2021 13:20:18 +0000
Received: by outflank-mailman (input) for mailman id 129194;
 Tue, 18 May 2021 13:20:16 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=9UfV=KN=citrix.com=roger.pau@srs-us1.protection.inumbo.net>)
 id 1lizdw-0001dl-JG
 for xen-devel@lists.xenproject.org; Tue, 18 May 2021 13:20:16 +0000
Received: from esa4.hc3370-68.iphmx.com (unknown [216.71.155.144])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id 90d936fb-ddbc-456d-a3fd-9d1c5735fcd0;
 Tue, 18 May 2021 13:20:15 +0000 (UTC)
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
X-Inumbo-ID: 90d936fb-ddbc-456d-a3fd-9d1c5735fcd0
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=citrix.com; s=securemail; t=1621344015;
  h=date:from:to:cc:subject:message-id:references:
   in-reply-to:mime-version;
  bh=tkr509xDl2ml6KFuF5tfkfOoC8mwnSycDFcQN+B7JHU=;
  b=AuqrxVKu849fBhgyfZm7YZQrzK6mfRNYXwcf3mczxw9JhUqeNEbHkZfJ
   UocxWBwaMr3bIPKlVKx3C5tP8AeTe0MUlatmtPz9CeRzVuvOfUHtmooog
   SQD19YXD87KePM/6X3z2XO7QF+Sr0AArXrGN+O56KypYlPM6k382h8fsP
   k=;
Authentication-Results: esa4.hc3370-68.iphmx.com; dkim=pass (signature verified) header.i=@citrix.onmicrosoft.com
IronPort-SDR: +OrUdvr3a+yVlnLCPLOtGjZZ06ij6/hPUNoHgPo6fzm6oqtoKnW3vdmynCu8ppIV6KzLTgUX2X
 Z75bwTm+8MbAVJaW/2dtC+2YwTjwaXVAcvJL6xQNgZqZWcLf7w7ryIt0hRFWQfShnChtUShJ45
 O8kli5Zat40Kaqhlmrfs0ByOCY7iT+mZpZ1Iz3BuRDAxnTdLuTBRKXnMp0org5G0Yw2xov6nhQ
 fQPHmrTJ1/Y7R86ebg0NIj6mwEMPcLeXQMgvpaVpsoRUQHUXfVaeDMrcEGhbmst/k7QNobzIBL
 LMA=
X-SBRS: 5.1
X-MesageID: 45580777
X-Ironport-Server: esa4.hc3370-68.iphmx.com
X-Remote-IP: 162.221.158.21
X-Policy: $RELAYED
IronPort-HdrOrdr: A9a23:VUYRO6riVf07sgGZaQOuyV0aV5trL9V00zEX/kB9WHVpm5Sj5r
 mTdYcgpGfJYVcqKQ0dcLW7UpVoLkmskKKdjbN+AV7mZniBhILKFvAc0WKB+UyFJ8SWzIc0vs
 oNHJSWSueAamSS5vyb3ODMKadD/DDxytHKuQ6x9RZQpEpRGtpdBk9Ce3ymO3wzYAxIQbcCON
 6i6tFcpzymEE5nEPiTNz0gWueGi9rVmJfheBJDKAUg7GC1/ECVwY+/Nx2WmjIfWT9J27tKyx
 mxryXJooGnvLWB1hrRzSvt449NmN3no+EzdfCku4wwLzqpsAKhf5lnV6DHgzwvuuGo7z8R4a
 nxiiZlG8F9r0/XfnmorTvhsjOQpAoG2jvHzFDdvnf5u8z+Q1sBerh8bKxiA2bk13Y=
X-IronPort-AV: E=Sophos;i="5.82,310,1613451600"; 
   d="scan'208";a="45580777"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=fawffb896T402Ww8IceMFxLi23FMxpbNrPQio+Lotwt4k3FGnNL/IcnyjwUQTxrwww5flblWcIbGuk+8LC6+bbG0FUpdyfniegJ69+wj37pDiF7bmmwndk9r7XO57ycneTTMoxiQTz+mnKSIlkOslez2GCvx/pzcvg8K2LePGclW16wCqj9vAvV2jKZi5AAjrvZlHlWcf6AK8JZKZKP9XuA9bhKm8EB86ok8DL0mnWOWBNIXau2W0k4HVd//jmXqE9nlyd1WJcHg3SuGu8ByKYvDW2yKrRbuMI6kFDkpP27HBE8ty+yYjvMgnQm0sHiC/N42IkcMFfrt/mDmWyJRhg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=Rok4PL/LVmbq0cbbPKzEQbQJ5uwA90o6l02yW9rgrIY=;
 b=lZ/nCKXQCZ4vKBgswhdetYKUgS/pV4GfPXO3nYK/GjnDMTVp+Hi9x8iLNe0baIPYIzpoop6/22VEYDykRm0LsK2MqsOfcf2mRZX3BJnxhdO75qCPjKU01YOAY3hLT9wzE4IkvTL6r5w0cOHjb0qoiyY2/JtgdtBbiG4dfIN5rSQYHZm3pGnGi1geLWME+DLUIRAPM8kFywqXqNvaPBiZNuvgBDdYXMfAhx80bGo2jyP+u/nxgLitaSQcmO6VpGIWGvfOzL2kQKpq4pg9pt5sRqJSL9QUYwkj6A8yYUuRimdl/oJe/l00+i6piYOHDiYVU+KdiUZnvCHrpX7vJSKYzA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=citrix.com; dmarc=pass action=none header.from=citrix.com;
 dkim=pass header.d=citrix.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=citrix.onmicrosoft.com; s=selector2-citrix-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=Rok4PL/LVmbq0cbbPKzEQbQJ5uwA90o6l02yW9rgrIY=;
 b=Md4tihh8ialx4Bb5kgVKzlBfL5puNPX5pzNuVHuB5lzXe3kWRK3KX/wfzQ2E8IFNuXtkZWGhPT3GNqV4gHWtRp/LOl/PwgKCNXtqaayVIJfW+7M6RLbYVRNDd/ga2rcdF33J5MqZUYHWjee/MiEAkDnBLOwF5nJT3LRNBIgmJyI=
Date: Tue, 18 May 2021 15:20:05 +0200
From: Roger Pau =?utf-8?B?TW9ubsOp?= <roger.pau@citrix.com>
To: Dario Faggioli <dfaggioli@suse.com>
CC: <xen-devel@lists.xenproject.org>, Doug Goldstein <cardoe@cardoe.com>,
	Andrew Cooper <andrew.cooper3@citrix.com>
Subject: Re: [PATCH 2/2] automation: fix dependencies on openSUSE Tumbleweed
 containers
Message-ID: <YKO/BcUAtjSgc2pV@Air-de-Roger>
References: <162133919718.25010.4197057069904956422.stgit@Wayrath>
 <162133945335.25010.4601866854997664898.stgit@Wayrath>
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <162133945335.25010.4601866854997664898.stgit@Wayrath>
X-ClientProxiedBy: MRXP264CA0045.FRAP264.PROD.OUTLOOK.COM
 (2603:10a6:500:14::33) To DS7PR03MB5608.namprd03.prod.outlook.com
 (2603:10b6:5:2c9::18)
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 51a228fe-bb66-48d8-bcdd-08d919ffaa68
X-MS-TrafficTypeDiagnostic: DM5PR03MB3211:
X-MS-Exchange-Transport-Forked: True
X-Microsoft-Antispam-PRVS: <DM5PR03MB321134B019DB10031D0BDB968F2C9@DM5PR03MB3211.namprd03.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:7691;
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: FpPWNATWE9kTWGqbK5YdwoNgIJbRHUtmHXxiy2cAXyej7wPKicvBXVXpsrv3YAExCXIb5PfltQ9JRBR5uNM4yKFxHM4OSmF68uTfUlo0GFEJsDdeDKOBgFGvCtL1ufjSe8W4gN4Haub47MKhOn1DbgbpZ1kTFI12dVrEk09stKwPQvWBw8JkhSs94lN+jAJxHfCy26i9XXW2hh4UhLJV2GBMdpkYQNGuJ/cpffukrEi5RGJ2fN9sZr6Z+vdOHZseJpmsiAnzRyDI+3uUj5/pkXcSkYOx2pcD5pI0uDvElBsCc8mdaZoyVXjiS4YxcRZWvDsDEG46HJa/uv1RMT+bR9cunTGIZF/G7NFCc3sxiE3pYpPY0Nx70HnYYe54yTAX8juzLyzPrHqopMJymAoDf2dTopmp0BGNC7cYR6ffc94y5jwQyHPc8j+fRG+pBjzZMmY/ZyVWwiF6co4QARGcPc/0Xlq0luSb8zA6xLLAmh50exzLtHGIRJzFP85g77GIZ3nh4+t+MSeWo3MWIMurOJtwAEuzqwENGivgF+MG8a+TBtt0z3Y8ZM8If5Wzr26aRLyoN6C3AH/Av134n68Pqfi87IEZG0yi3mVx5kaAtTs=
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DS7PR03MB5608.namprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(4636009)(7916004)(136003)(366004)(346002)(376002)(396003)(39850400004)(66556008)(16526019)(38100700002)(2906002)(66476007)(478600001)(6666004)(66946007)(85182001)(8936002)(26005)(33716001)(54906003)(186003)(5660300002)(316002)(6496006)(4326008)(9686003)(8676002)(107886003)(6486002)(956004)(86362001)(83380400001)(6916009);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData: =?utf-8?B?b0RtQzBEbjJhWFV6dVBkbGkzcitkK3RkU1dCU2VSL3FPRVhuRms4YmpGTXN6?=
 =?utf-8?B?SEpMSDRWUG1NNi9mZXVvTHBSNXpWRHBkU1VtbjhKYmZXU29Ma2tFdnhmQlVN?=
 =?utf-8?B?Z1haeGZRak5pSTF5WXowZms3c2k3c2lhT1lLTGJNdjNnTmZYMlp1Z3VNcGRU?=
 =?utf-8?B?RXVJK09SNDQzNXgvSDVobVpyVlFJSmRqRFBaRjR2VXpMSXZxOS9haE9PTmJk?=
 =?utf-8?B?bzRtMmFuUmhPenVrKzBkYWlXNVNZUmtmMDU5UXVoSW5SZ1lSQUhKSHhSSFZl?=
 =?utf-8?B?bXZxZXVZOVNUMUdPbzQ0RURieDNmSEkwR3pBeG51STcyM3llRitKVFFxMGk2?=
 =?utf-8?B?ZmlNQmlZWVcwdjR2cVk4eHhSV2t5WXM2cUFieVM1YVV5bFRuRlpZSW5pU2pm?=
 =?utf-8?B?akR0Y3d6bnJQVVdURm9KN09SVnIrZlNHakprM3h6Umo1ZkZ5Nyt0bFUzZ1J2?=
 =?utf-8?B?Z0ZLM2Qxd2pkeWl5b0dKRHZzZERyZ3M2eEtYY1pHQy9CWUM0Y1k4VUl0SnRp?=
 =?utf-8?B?c005TXhOdUR0YXhJZUpTU044Y3ppdlVKMzFKalVCNmxvTlhmSnU4S1RVZVFZ?=
 =?utf-8?B?UU1mWE5hMDFGZjVKRzNMNWU2bEJCWkdVSzVhdGlWMlF3MmYxRjBTWUllZkpY?=
 =?utf-8?B?clQwMXZxNS9QWjlsYUFyekJJR0VhRTVIdFpxc2FNTzZXak1idTBNd0p0aDFT?=
 =?utf-8?B?N3hoNmxEY1poVk4yRFNaRGhjTUt6cjZCTkU1cEpnaUROR3RhUWE3Vkc4RFFs?=
 =?utf-8?B?RGZ6TUc2N3NTVEMvaG81VFg1NzdkVWdCMHFONitPckh6SDMyY29KWmFGUVMx?=
 =?utf-8?B?WHpMRUlRSFN2aTBGY2FsTEtCTi9RdUdiYStSYjZkR2NPT2NRSGZ1R05rUXl2?=
 =?utf-8?B?K1VpWG9kcThzZ0NSeHE5ZW0wYnBBZ2pCcXVtVnJDc2kzMVZuUGVEL21Gb3hu?=
 =?utf-8?B?RlprS0dDTEwyVU9GZzNQRVEweHJ4MlRzSWRPaSs1Nmo3ZC9WakVDY2xhbWVm?=
 =?utf-8?B?TGxSRzc0VDVLTlcyL09iLzZnNmxLNXl4bk16b3VSK2o4SHNrQy9JaHVmTS9W?=
 =?utf-8?B?MDg4T2NxaFBnNE9EU1VyRVVoVmQwWFdUbHY4OWhrUnVnOTBGNEpTQWtFQ1Vv?=
 =?utf-8?B?eTBrY1BTRk9pdnlpNVlRRjdOd1E0dzh3RDFLVTh6YTNFY2FzLzZwQmxlYWFi?=
 =?utf-8?B?RHJGZjF0bGY4S0hRWGMrSFRPZlkzaHk5dkl4V3Y1MklmZUsvT2Mxci9YNkpO?=
 =?utf-8?B?RXF1R2ltcFpoRFA0SkJVcmVQSXZaaGkrOGx0UU5zSFQzd1N1T3BPcUdOZUgw?=
 =?utf-8?B?YkgzVXU0OUVrcnlUUEh6T2tvcVQxRm5Za2gxU1V1UURGYjF2R0hHWU1ZRnJz?=
 =?utf-8?B?andFU09nNDUwa0FUUFJydWNDZjhkaCtmbGM3TUZqUGxpTm54WUZtYlVqWnha?=
 =?utf-8?B?dEJaYUkzK2QxZzF3U3h5ckNxbkMrZmNBblMrYW9pZlpaQXVJY2RldENiMFFT?=
 =?utf-8?B?QWlsdDhraEYvZUU1QnRKUXl3eHZZMjNlSUFlM21DTVUzQTQ3aEppLzZvNFRL?=
 =?utf-8?B?cnd2N0U2dDBZUHJoVmJhME0wRys2enNZY0lhMUhOTHI1RkJYZ2V1d1RRdEhW?=
 =?utf-8?B?SVVYVS80akp4RWVnSHMrUk80bjRCUFgzSzliSHNWeWRGUkxxbmZ6cXJMeVA5?=
 =?utf-8?B?NklTMWx0T3hnTjBrYlRFYU05b0w5V3M3MW9oQUt4TE9nSlVTdVdQVDhrWFpx?=
 =?utf-8?Q?rL4MhJN/bqM9zTMEQR1i9Atc8X2/48tfOpId3gu?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 51a228fe-bb66-48d8-bcdd-08d919ffaa68
X-MS-Exchange-CrossTenant-AuthSource: DS7PR03MB5608.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 18 May 2021 13:20:11.9067
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 335836de-42ef-43a2-b145-348c2ee9ca5b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: fm2x3vX6sfgpcY9T6i5z79XIJrlIadn2uvm9t5JsOviUmsdQf503NGH265BD1tSGXbo+n3rA+VsyDop/3/vTyg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM5PR03MB3211
X-OriginatorOrg: citrix.com

On Tue, May 18, 2021 at 02:04:13PM +0200, Dario Faggioli wrote:
> From: Dario Faggioli <dario@Solace.fritz.box>
> 
> Fix the build inside our openSUSE Tumbleweed container by using
> the proper python development packages (and adding zstd headers).
> 
> Signed-off-by: Dario Faggioli <dfaggioli@suse.com>
> ---
> Cc: Doug Goldstein <cardoe@cardoe.com>
> Cc: Roger Pau Monne <roger.pau@citrix.com>
> Cc: Andrew Cooper <andrew.cooper3@citrix.com>
> ---
>  .../build/suse/opensuse-tumbleweed.dockerfile      |    5 ++---
>  1 file changed, 2 insertions(+), 3 deletions(-)
> 
> diff --git a/automation/build/suse/opensuse-tumbleweed.dockerfile b/automation/build/suse/opensuse-tumbleweed.dockerfile
> index 8ff7b9b5ce..5b99cb8a53 100644
> --- a/automation/build/suse/opensuse-tumbleweed.dockerfile
> +++ b/automation/build/suse/opensuse-tumbleweed.dockerfile
> @@ -45,6 +45,7 @@ RUN zypper install -y --no-recommends \
>          libtasn1-devel \
>          libuuid-devel \
>          libyajl-devel \
> +        libzstd-devel \
>          lzo-devel \
>          make \
>          nasm \
> @@ -56,10 +57,8 @@ RUN zypper install -y --no-recommends \
>          pandoc \
>          patch \
>          pkg-config \
> -        python \
>          python-devel \
> -        python3 \
> -        python3-devel \
> +        python38-devel \

When I tested python3-devel was translated into python38-devel, which
I think is better as we don't need to modify the docker file for every
new Python version?

Thanks, Roger.


Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 1ABA7388791
	for <lists+xen-devel@lfdr.de>; Wed, 19 May 2021 08:32:15 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.129875.243556 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1ljFjy-0004RZ-SX; Wed, 19 May 2021 06:31:34 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 129875.243556; Wed, 19 May 2021 06:31:34 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1ljFjy-0004Pi-PD; Wed, 19 May 2021 06:31:34 +0000
Received: by outflank-mailman (input) for mailman id 129875;
 Wed, 19 May 2021 06:31:33 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=xObs=KO=citrix.com=roger.pau@srs-us1.protection.inumbo.net>)
 id 1ljFjw-0004Pa-SZ
 for xen-devel@lists.xenproject.org; Wed, 19 May 2021 06:31:33 +0000
Received: from esa2.hc3370-68.iphmx.com (unknown [216.71.145.153])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id c9101ca6-fbf5-489b-ba66-296d49a5f86a;
 Wed, 19 May 2021 06:31:31 +0000 (UTC)
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
X-Inumbo-ID: c9101ca6-fbf5-489b-ba66-296d49a5f86a
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=citrix.com; s=securemail; t=1621405891;
  h=date:from:to:cc:subject:message-id:references:
   content-transfer-encoding:in-reply-to:mime-version;
  bh=FZ6+xoS8uThBtECknO4vRFgPzMMZeVCDhkbUuV3RH4Q=;
  b=c6f53r8OQm2nWt3tTZuFRIOmCeZeibcjaBk/jXa/VzUPwDQ8J0IL5ONj
   LmKU67Bq/OmU8c4c84NmDUlD8GV52q/SO2KArLs1DxDK3RAS81dCx+ZbB
   nP2j1AIvdtvdriGAl2GzlJr8jJsONFXQZR49SkBWs8ZzkeqcTKJb+2JjG
   s=;
Authentication-Results: esa2.hc3370-68.iphmx.com; dkim=pass (signature verified) header.i=@citrix.onmicrosoft.com
IronPort-SDR: 8zE8lz1tGO7MBnWzpEN1+cZm3iw/UHVV49mGC+Pw4YnpVZXaqx8TIPHgcnhaQWk6BcUzsgO4VF
 wdhKU3tc4iJH/jFj2PndUyruG8gRIAQFHpNqlJsfSROLLv7SCDaGpW6VuyIpqnTcdkqXhemGTx
 CISWOabYAU9RfpS+JxYizrTDu2ZgtFvKKMSgVs+Iq4424ljhABaeUuYsL+TmP7ke1eXtCgjL7R
 0hQpqI6WhJXaKr+3nXLwsqDOS9Fxo4I3wpOVkEUfuVagn/iIq6gK+61C8/HOS4gRvK1UEL2WWq
 Z90=
X-SBRS: 5.1
X-MesageID: 44095803
X-Ironport-Server: esa2.hc3370-68.iphmx.com
X-Remote-IP: 162.221.158.21
X-Policy: $RELAYED
IronPort-HdrOrdr: A9a23:0mxoJ6HUDNZ54AcdpLqF0JHXdLJyesId70hD6qkvc3Jom52j+P
 xGws526faVslYssHFJo6HnBEClewKgyXcT2/hsAV7CZnidhILMFuBfBOTZsljd8kHFh4pgPO
 JbAtdD4b7LfCtHZKTBkXGF+r8bqbHtms3Y5pa9vgJQpENRGtpdBm9Ce3am+yZNNXB77PQCZf
 2hDp0tnUvQRZ1bVLX1OpFrNNKz6eHjpdbDW1orFhQn4A6BgXeD87jhCSWV2R8YTndm3aoi2X
 KtqX272oyT99WAjjPM3W7a6Jpb3PH7zMFYOcCKgs8Jbh3xlweTYph7UbHqhkF0nAiW0idurD
 DwmWZlAywqgEmhOV1d4CGdmjUI6QxeqUMLkjSj8D3eSaWTfkNJNyJD7bgpOCcxpXBQ5e2Vfc
 pwriukXqFsfGT9dRLGlpP1viFR5z6JSEUZ4JguZlxkIMYjgexq3MAiFH08KuZJIMus0vFYLA
 ApNrCF2Mpr
X-IronPort-AV: E=Sophos;i="5.82,312,1613451600"; 
   d="scan'208";a="44095803"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=HtFeiNlhP7Bb6TSiyJr/0ROqe87MfuHlGGK7K65ocmeDg99+BCiHuc/6dIjNbKhVKSyece1Y0VtEepjXBJ6ZX5KbxpzZTCL2EFmMgVzwTgP4oMQ+8XiobxDG4j2GWinEtRaD9dacqosG5hcBGBaUFLvIy3NefuQZKIv5CbhcC59yop0ESnMCgN+XogSBqW4uhOuT5iq0K0O/KYv0ZF9AOIdTd0nu0E8/PfGYm/376PtHA9BAGWOuybPFV/NHKPeTEgiOd17EaLoe46AVqdz3ITPVdxMV00T2SCiRkx2jHkSQLzCqV2Q7R+ND/BxYN898zyGX2YADxJmPWSzWLIPy3g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=ISQhvIx7mV5WsPnv++Xg0eaJ16OM11/+z5eJsHkoCRc=;
 b=cOR2aneSrzxpbHrzmS3HKOy5pkWlNKyNhBecZJHciimxAYpied1BD0DYktg3vMdGHT7BME+K2DN6VThc6Kisujtf6cENZgxH/nw3YoKXV4ixRVl0rCFT8wHI6tYF7aOr39GMfetZnr9rSA3eBTeJNxLjSNknYl5KMAiYCaGzmoQhCS8TriiSQxv+rQwwQ5InFizYrWRIyNbpSxDxJNnqU6qqrAtW5ghCAcdYTXHUNvkuAN64a0eTnMwZpMRAGTZi/hIWgLTfCzxnS/W7sC02hg83TKFNzR+u1CDvV/3wRdT9rEfbs+sqJFyoOUw6Owd6go8avlPiSgZcjABQGhLWQg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=citrix.com; dmarc=pass action=none header.from=citrix.com;
 dkim=pass header.d=citrix.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=citrix.onmicrosoft.com; s=selector2-citrix-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=ISQhvIx7mV5WsPnv++Xg0eaJ16OM11/+z5eJsHkoCRc=;
 b=tMK459cxYhc0m6IULOs4cijqb4aDw3jGgaKTG88sdq2y9NLoviWsoBkrhXSPeVJ0o7BzrhJShDkKJzfB1ZPo3agFxLSK+8I9wi455k4lMlVn5INIMJ8N+rFyK3oa+5HKmK5B646exYzHC6ehrLAIWlVPsInNHJ42xWDnHx5E6Pc=
Date: Wed, 19 May 2021 08:28:12 +0200
From: Roger Pau =?utf-8?B?TW9ubsOp?= <roger.pau@citrix.com>
To: Dario Faggioli <dfaggioli@suse.com>
CC: <xen-devel@lists.xenproject.org>, Doug Goldstein <cardoe@cardoe.com>,
	Andrew Cooper <andrew.cooper3@citrix.com>
Subject: Re: [PATCH v2 2/2] automation: fix dependencies on openSUSE
 Tumbleweed containers
Message-ID: <YKSv/BGxuy+OCn3t@Air-de-Roger>
References: <162135593827.20014.14959979363028895972.stgit@Wayrath>
 <162135616513.20014.6303562342690753615.stgit@Wayrath>
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <162135616513.20014.6303562342690753615.stgit@Wayrath>
X-ClientProxiedBy: PR0P264CA0053.FRAP264.PROD.OUTLOOK.COM
 (2603:10a6:100:1d::17) To DS7PR03MB5608.namprd03.prod.outlook.com
 (2603:10b6:5:2c9::18)
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 2508ad14-5e0b-4618-03c6-08d91a8f49be
X-MS-TrafficTypeDiagnostic: DM5PR03MB2971:
X-MS-Exchange-Transport-Forked: True
X-Microsoft-Antispam-PRVS: <DM5PR03MB2971AEC4A1D806B00BEA44468F2B9@DM5PR03MB2971.namprd03.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:6430;
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: NBfXBDKk8G7xzwlDNPIbw2060Sg1emeseKqamemgil5hcoql9SVAaHPke6Q1JbuF+gZYoKzQJaTIN9PUSF2OXuD5qNVb+TxURS56ccg3Mo3zl6CgMKYsqHDnMuRFMZ+q1zBdShzsRK+N5RMD+tqdHAG8T4fIUse4yfr7HsP1sAgwzNYImZj79vcTATZjLP2laIplULUKWQtL79Ka3lzTsuBKHntRtfhsc8IL5o7i4GbRdE+T+DOD3KLp7zL9S6svtLCQDfeLSnPX2vRzMFCtyNYNHCWa3niUERrPHlDuMIt+xHcsmLC4YlNzBYEUl4lfoo0lyW5ELRitE/+K4lFQmByeQI5OW44K/MFiMgOLOXB+DEgK8IQoKbnwD9DoM4SZjBampqQ3sLrGFPeyobexLSupuTwhTfSd8wBZlXzwBVbnw3KSxaN0V/l09p1HXMl6g7QASI2Z0zmC9Ez/6G/GG/8fJ9wrt+zrKEJpM2DUMGaOGMojRfW+4IQtg0V5v1SQzM4INDyE+J7wivCdK2X+cW1HAS5YPUz70kHbwMyyeGkF6sb+NEJrhAMk2ALcye6tKuJfJFjk9PTJCpyRbRQDMCAaF4SslaSR0guzrn22S60=
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DS7PR03MB5608.namprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(7916004)(4636009)(346002)(376002)(136003)(396003)(39850400004)(366004)(8936002)(8676002)(33716001)(66476007)(66556008)(66946007)(478600001)(956004)(54906003)(6666004)(186003)(4744005)(85182001)(6486002)(6496006)(4326008)(316002)(16526019)(38100700002)(5660300002)(107886003)(6916009)(86362001)(26005)(83380400001)(2906002)(9686003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData: =?utf-8?B?d3JyaGJoODNNVFJiWSs4NUtQSFdXTVJWUzJhak9qR3RhWFEyVVRwNWI5TGNt?=
 =?utf-8?B?YWJleDdJYnl1ZzFaa0lpUkE2cnBMWk1SS1lraUZWMmxsSEhNR2w0ZTE5Z3BQ?=
 =?utf-8?B?NTAzUEo0VktnMTZUSmF3dWkxczM2UHhFSVY3cFIrK0xSWEw3dUFlQ1ZNTW1w?=
 =?utf-8?B?RFlRWUJIbWwvNHlkaGhUMjNkTm5nQi9rMnY3UXZIaHhMZGNLRExsOFJjdlBn?=
 =?utf-8?B?aWhMZE11SG5LSzdCcUd1YWIvMC9MaHEzcEtKTHlnd2ljYjBCRFZIaU1qZlU2?=
 =?utf-8?B?WkhrR29yTmZOWWtCWDQydStnM1g1QTZSQy9tb1hDc2hTQUNDWkkzaVZQZTlY?=
 =?utf-8?B?V1h3VisyUk1OdXJUMmQvV3RzVXd2MC82SU5hZllFb3FPSDl2RGJQaVNwUlNK?=
 =?utf-8?B?bTh2VnEraFg3MXFOc0E5aWlEeXQ0S2ZzZFV5L21ieis1QTgrZ2xHa0Z2Tktm?=
 =?utf-8?B?czE0ZU44b3ZnUllKNXZzN0FoYUJpOFlFdWxQZGFzWHFEdUtEWWVzOFVYTjds?=
 =?utf-8?B?WXRSVDBwNU9qU2NVVmlFUWthc2pINEpGS3lrL0VKWmwrdFNDOWRwOVZlcXp1?=
 =?utf-8?B?WDBRRm5sQVpTQmdBdnFsWkZURDdBNURvb2tJNnRMWjBCdHhMVEJwYi91YlFz?=
 =?utf-8?B?TDhUT3JDeWszay8yZVNUUjFUUG1lWm1uN05aV0xRTXFYTjNiNHdaeDY4V2U3?=
 =?utf-8?B?Zmhid3Jpc1hZUHhJQUEwNVRyTG1zbGs5THNKY052NU9JazBuQnVRRW55L0gx?=
 =?utf-8?B?SlhRdHgwVUR6Z3VFSGhrMnVBZkdqNUhyQ0JqbmVTMDVKMFNJeUlMTGozMktt?=
 =?utf-8?B?Y0txbUJEeWdOYjNmZndiQzFBTHQ3U3d0a2cweHNXRXpGUDAyczlZSEpxMThl?=
 =?utf-8?B?M2dkbWpnT0JmRVpMMDFZeHg4anNCOC95MTc0K3BQelNmYWNBZ2JwamlPL0x0?=
 =?utf-8?B?c2E5U1l3THZUWjlWVmtMQnF5UlByRURaZENDYnFuSGNZQzlvVkg1V3p3cVpr?=
 =?utf-8?B?eEc2UFRMNXlOK1g4TkRpVndTaCtyTnFoUVNhTTkySTRFNlFSNXp2bkJ4WkxE?=
 =?utf-8?B?YW9rTVpUWlFsUmF4WHpBckplYmk3VmRGR2l3UXd5ZnFBbFdmS29ZMWhIY1dL?=
 =?utf-8?B?VzlNZ1E1cmhndXdOd2w1SHVOWDRGZmZiMVNaZk5YcGJENWt4RDhESVIvekpG?=
 =?utf-8?B?S0RDMnZoR3ZFbkN1TVgvVTI5cmVMakdIdW1FcTh3bk9vdEFDYjk2MzliT3RY?=
 =?utf-8?B?dG1KRVZBUlQ5RjVydy9hNWM0QjlqYTJucnpYWTFndU85RlZ3cUt2aHJKeURu?=
 =?utf-8?B?MGI2ak9VQUpNWkw3VjM5a0FMMStiWlM4Nmd3UzFVZE9rdmN2R3cvaTZtemV1?=
 =?utf-8?B?KzlLOUVrZkh5eVZMUlpGcXNCWVpsVENGb0hmRTFDUXhBcVZBbk1EWGFsU1lq?=
 =?utf-8?B?cVpyS0dNVDR1Yk05ejlmWS9JRVZJV2QxNDhlTzR6aWZ4YVcvbFphc2JCelh5?=
 =?utf-8?B?SlltdkhNSFRGd1VHVmlZR1RVUXNsSllveXd3ZktuK2dVWjFqMXdocXFEMWZU?=
 =?utf-8?B?cys3WjBjVkJYTytIcWpYVERndlcwYm9VVmU0cW5WUit2MDFxZk04cXVOUzYx?=
 =?utf-8?B?OHNzWWMzVzI4UTdnV0lhRVVaWU9PWWQvdTZUVCtjZ24rNXlZTzlST0tEUHJ1?=
 =?utf-8?B?UEErTFdtcGxNQ0hyTWp4c2ZuVE5qY2xjbTBYa2JUd3NnQXl4cVdJZGoveG1w?=
 =?utf-8?Q?s7xkIflm6zAVObtwb2h09NnQGp3TrGnkWB9+1Ce?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 2508ad14-5e0b-4618-03c6-08d91a8f49be
X-MS-Exchange-CrossTenant-AuthSource: DS7PR03MB5608.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 19 May 2021 06:28:17.0715
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 335836de-42ef-43a2-b145-348c2ee9ca5b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: wY5wreM47g4GD6BO3NUUgQyjJVOVOFcCYwLnVWiFt8hWIQ79uB9LCLUhjkBBW3RUyxqKZS+xBfTUjtB9uVCFmw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM5PR03MB2971
X-OriginatorOrg: citrix.com

On Tue, May 18, 2021 at 06:42:45PM +0200, Dario Faggioli wrote:
> Fix the build inside our openSUSE Tumbleweed container by using
> adding libzstd headers. While there, remove the explicit dependency
> for python and python3 as the respective -devel packages will pull
> them in anyway.
> 
> Signed-off-by: Dario Faggioli <dfaggioli@suse.com>

Acked-by: Roger Pau Monné <roger.pau@citrix.com>

Can you try to push an updated container to the registry?

Thanks!


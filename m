Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 1CA2EAEC789
	for <lists+xen-devel@lfdr.de>; Sat, 28 Jun 2025 16:05:23 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.1028321.1402351 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1uVWB2-0004zy-Of; Sat, 28 Jun 2025 14:05:08 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1028321.1402351; Sat, 28 Jun 2025 14:05:08 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1uVWB2-0004xe-Kq; Sat, 28 Jun 2025 14:05:08 +0000
Received: by outflank-mailman (input) for mailman id 1028321;
 Sat, 28 Jun 2025 14:05:07 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=XT7f=ZL=valinux.co.jp=den@srs-se1.protection.inumbo.net>)
 id 1uVWB0-0004xW-JH
 for xen-devel@lists.xenproject.org; Sat, 28 Jun 2025 14:05:07 +0000
Received: from TYVP286CU001.outbound.protection.outlook.com
 (mail-japaneastazlp170110002.outbound.protection.outlook.com
 [2a01:111:f403:c405::2])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id e36b58e1-5428-11f0-a310-13f23c93f187;
 Sat, 28 Jun 2025 16:05:05 +0200 (CEST)
Received: from OS3P286MB0979.JPNP286.PROD.OUTLOOK.COM (2603:1096:604:10d::7)
 by TYCP286MB3800.JPNP286.PROD.OUTLOOK.COM (2603:1096:400:37b::7) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8901.13; Sat, 28 Jun
 2025 14:04:59 +0000
Received: from OS3P286MB0979.JPNP286.PROD.OUTLOOK.COM
 ([fe80::80f1:db56:4a11:3f7a]) by OS3P286MB0979.JPNP286.PROD.OUTLOOK.COM
 ([fe80::80f1:db56:4a11:3f7a%5]) with mapi id 15.20.8901.012; Sat, 28 Jun 2025
 14:04:59 +0000
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
X-Inumbo-ID: e36b58e1-5428-11f0-a310-13f23c93f187
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=Ja7KSw81FiaqQrHV+V+nQwoB750oRusGVlpVfHgZ0V5Dp+Utmj2J/tTiRJGp5y9VSCZS1LQGR3KmqpdpoY1PA7rz7i5V1llL6Rotg2mOV+Zn/WwSeSWSEvwP/beseuD3MvmWDPsplZFZsEI/QIxUZd11DZFiiPDapvuT02WAyDoSZgoOhOFuZ5J4I7CdYsuSezo0CETweIT0J5uMog05pusZ4mk9S/Bra6iVAvzpoVK8Swi64lKIMWcQi3WB12OUD8eXJrfGmAW4k7rlLVFRbd+Rc5Aci1+Ed/+IyQWV8RzzKzRf0My9vKdFlNHnj66ZT3qme9guRgbJuYrXHHcEnA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=UQueM2AfpMJ51YOzXPCOaQjsYe47pS0bjfj4ttYAIYA=;
 b=eJdqyJTx6esGvpJGL9ugeU+iVP+VihAPW3yVtsvqi9P0uSOqJJFlf5Q2aUM2S8gy5fnfYm0Y/uxY9HmRfVBp634UZl8zRc5o3bq4waY8+p//Bh39PvHzqs5kIvO8u162j9SeStdYvb+D7iYkhcB/o8Nsm4Ba0ZfYJYwzhwFaBN3JSlgHhbHDmzSxpjdoCeA5ken9bcaqxWg8r4CT9CG0oGbIjGtzkH6uintv+r6GwaNY1W2s3OuCdRCq7Ro5zq4dIr3EweJnTlnU1kxYuX0Ga49yWHe4ja85X21zrPa8RTvDgsqYp5aCycSZBRJQCzPsiUw3/ZtHdO+NePHog5LjmQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=valinux.co.jp; dmarc=pass action=none
 header.from=valinux.co.jp; dkim=pass header.d=valinux.co.jp; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=valinux.co.jp;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=UQueM2AfpMJ51YOzXPCOaQjsYe47pS0bjfj4ttYAIYA=;
 b=CDAGTOS+yTI9C4ey6m01Yn4AcYjFHHU9SBu+ooaGHp5sutKJDYFXQEMjYW7n5dH83V0fQF0YeEYvAH2CGgVZE+n+kiiM6xv2gpZbno4LOhOA21N7cLCIsEnRyDKuB7xOEn52+L8XGA5izVviDAUkrGlif1jbnOxkSJHntCB5ckQ=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=valinux.co.jp;
Date: Sat, 28 Jun 2025 23:04:58 +0900
From: Koichiro Den <den@valinux.co.jp>
To: "Orzel, Michal" <michal.orzel@amd.com>
Cc: xen-devel@lists.xenproject.org, 
	Stefano Stabellini <sstabellini@kernel.org>, Julien Grall <julien@xen.org>, 
	Bertrand Marquis <bertrand.marquis@arm.com>, Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>
Subject: Re: [RFC PATCH 1/4] xen/arm: Add wrapper find_unused_regions
Message-ID: <osi57laodv7d4nox6qowuiq227mt777ypwecwoyhz76xrdlou4@nyssh5425tyq>
References: <20250621151201.896719-1-den@valinux.co.jp>
 <20250621151201.896719-2-den@valinux.co.jp>
 <e0187198-de00-439a-bd80-caf8faac6f5f@amd.com>
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <e0187198-de00-439a-bd80-caf8faac6f5f@amd.com>
X-ClientProxiedBy: TYCP286CA0278.JPNP286.PROD.OUTLOOK.COM
 (2603:1096:400:3c9::19) To OS3P286MB0979.JPNP286.PROD.OUTLOOK.COM
 (2603:1096:604:10d::7)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: OS3P286MB0979:EE_|TYCP286MB3800:EE_
X-MS-Office365-Filtering-Correlation-Id: 8230f3f0-d2ab-4234-77fd-08ddb64cc4f8
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|10070799003|366016|1800799024|376014;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?+4bYNgpkjcjTfjQfZpYIbKaoHCL1wUXM2xkm8/AYNHBrQismvDb7NU/Gd5GX?=
 =?us-ascii?Q?dJ8EJYyCXEIrimqxFTnPzizm+X+JyZpereCWVlLx6siiuhI2+Te1e3TnvrbS?=
 =?us-ascii?Q?ipEbnjBTs8/idtELCPn1X816ihtiJ5iMFxNdQfG4ov8pnTzvxvvVzHcUCfnW?=
 =?us-ascii?Q?VhJifOoGiZEhyFITXk1l5OhVcbZ+qJMNLGmXoIeySzSa/Txm+IqEPZYerIks?=
 =?us-ascii?Q?jMcx8PDfT/v2w2ICa91L/aK3H0vWLqf0YfPJ5iB89LknIi+4BWPp+ex8MH9L?=
 =?us-ascii?Q?Buh6v1CcxddEtxs7ttbkQC/UEuGufbHhRP1PqDV0vUrNAJ25GurxVe/hGafd?=
 =?us-ascii?Q?tvRQ301VesrXhTe6aSNNEMSoAtqZsJse3PPocpwW0bzEf502jfIQephtNEKK?=
 =?us-ascii?Q?/+x6l+9AxlbGKz0bLfhqEB/BfOa2RewGg2EQtNRk98LeT1G9rzvNqSR1Vh6n?=
 =?us-ascii?Q?vKbse8jBaFhlOitVic0Nd2iJ1m3a4ycSWpVLWwlRdtFZL8LiTR9DUWADc51B?=
 =?us-ascii?Q?MPhFJcPE503qt8TifcCU2Tbj8pak0KKfb5lpkqPezbCnjgKWUxBHy4rb5pl2?=
 =?us-ascii?Q?/qmV2wPm8Pc7SGFVma8HXKmEtRGkfbi8zyGp/i2UNEygLWGuVz2HD9PxMFAz?=
 =?us-ascii?Q?e4+BgvL3y0V5kpOJJji9+WRx7j2HTWjNO2UcwllFU7RlMChhDlnZS1aLFrHJ?=
 =?us-ascii?Q?BHu7pzC6XHhgAuh0WtLoZCssgNY/GwtHbSU78ZVPHzVGTbPmt2wni9UoQPMS?=
 =?us-ascii?Q?5zjxcTuLNen16uZF9uDe2U1nNsOXKbtzP8U6xEcWVJzfMqypQbtJp/DoYyG6?=
 =?us-ascii?Q?SHu51lvMiqjtMcDg+yEE6KLtrOvJn/ng9CbyxSfvvjMxtwMt8ZBzehwToIte?=
 =?us-ascii?Q?A3M9dHYZ2LbmDgPKvbNNNkDQNom5HpzYuh2SVCtqjJYehf4e94eOfROoPRou?=
 =?us-ascii?Q?FHDA9J1gfxdtqGlT9rnnHPwvZbGW/tFDiZ8rKyWCKQ3uUr/kmzJTw7qjETZj?=
 =?us-ascii?Q?pzNZidVlwlS8yBcHuvvPPcO1wIK8BVGSSJCPLgB67qyaDelwu57SKkZJoqNj?=
 =?us-ascii?Q?Ix4imxGofDAf7X3XQnNX2HESal3ck5ByT6kyhNRPmcH2J2USSRY4a7Z95tnz?=
 =?us-ascii?Q?snSJsKeZR9F4Wn2TL+wZ3K+2nVbJjg/14EiJufcSgZSrJwldMRH0IyGyDwwu?=
 =?us-ascii?Q?ZUNBg4pAxlVPMryGogUuNe3rSUysYW31EvGfC6uPzkPchELY6rTSJ7KuAEbX?=
 =?us-ascii?Q?youNToaL6h+7Yxdad8ZxnnFfEV3QoDTS7Pnq48GXBc/A82jyGRSSnhol1Nu6?=
 =?us-ascii?Q?Vveqv774LXWzqpyMIlhjnLNoFYvk+jqutJWHoUXUqRbeETvvaRH43d6rCFvY?=
 =?us-ascii?Q?G2vTGUFGE79G9aOkDPwkzpUuXRRQSsNEYA3enSTHu9Ghnnmd0TznGxpACvgP?=
 =?us-ascii?Q?bS7Te34/h0g=3D?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:OS3P286MB0979.JPNP286.PROD.OUTLOOK.COM;PTR:;CAT:NONE;SFS:(13230040)(10070799003)(366016)(1800799024)(376014);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?3yuyJl679xoQAqLAmqTnRlpki/RgT6xSLF1h9XP++Wy26i6v91XaLSK5XJmP?=
 =?us-ascii?Q?Bh8n2S8BcpTAsJgFVXmHEqg3VlK7rzANxoNDePyhADhKk8oseGsTcnHzPlFl?=
 =?us-ascii?Q?o1zWWc8tvpQpZV1GSoWU3Yit/VYJCfTME+0UM0OOl0GMD0iZZQndApPJZsxa?=
 =?us-ascii?Q?GDXZvic6HvA148Y+k6gT1a+Svtjj/6MrQKHSgjGcpL/66VqjOTPRh0bU5LRu?=
 =?us-ascii?Q?ioP/zlR2c3tw9Szdm8VthAJtx3qj+YAV0gopWdRk+bHU9+PuhPL1YYrdWb0A?=
 =?us-ascii?Q?Oi2OZdsIvVONcu+X1qCEkCAWuL6gjAYOv1CVS02LnCic2KmWcwHJ+RTZWIv4?=
 =?us-ascii?Q?PGF4M0FHNrdcj5p0jPK3ohpcX8AXO9cgNTbv7vEdfBEtbjQSZWMunYALFR4u?=
 =?us-ascii?Q?xk8nYevRKI1kJqwBCp3Ru8q96ZplEu9uehmbEm9IgsNq+6JaScBw/uz0qZM7?=
 =?us-ascii?Q?TalC/bALjrlONSwDQtzOqPAoFoQIU9InxqxAQ8pL7s+XjIx81qZiaDUarWPa?=
 =?us-ascii?Q?9FOPuhZCFSPLBz+f+pY62jGiEpNdVDJMZnAxu9ur8KhgEGn7r36jZfmOh9Ig?=
 =?us-ascii?Q?c3zJsv+ln9sgl5rXeDcBpGY9H9eKI8Owrxy5hj45nmIKv4sGVOwDZOOPw9t2?=
 =?us-ascii?Q?7OMS3CyysyIoOljK2M8qr1FMUXm+TxmxIEFxoXwM5ruM0NQ/Dr7c6waxVoCu?=
 =?us-ascii?Q?XFsHLzO6oJBsZTU6bEfKvuMjQzSCof+gHFHG/p5ASsHw04yX6AnFyUO2diU6?=
 =?us-ascii?Q?Mt8VUoj87s7QSqT8rQw0n+qHYUWTl3a47DPj1XF6LE/ymVXLGh//tejr0P6U?=
 =?us-ascii?Q?b4ATOQG0+hgyVKloAd9hkXPiQ5g/IK/Mx/yi+0lqCv9IfZLixGt8DC7SnATg?=
 =?us-ascii?Q?yyriZJ9CaXCEKBrzUMwTyqVycB+A1G4ifmsokFHL1F0+Md1S5NfmGS5sgsBd?=
 =?us-ascii?Q?Uk7e7yk5h378KdWYZRlL13s1gqcSpsURu46GfLE8xHG15xsElVXrsht8qOz+?=
 =?us-ascii?Q?7nYM8AIestsLxYQGX58lxJ/FPd/2zj0GHuZzROBXbLRixbXAhjdvLxwkvOFv?=
 =?us-ascii?Q?ByU/HLCQ9mJCcCCG7CkbzepU059LWGEzGd6SW+oeCpbRCwIf+ENocWbVVucV?=
 =?us-ascii?Q?eHMGLk6QdbELoAeOsiDDXWiIKAhXo+Yfslpyr9RIWw0mWN6GSk56sF5AIpEE?=
 =?us-ascii?Q?9BNOXS4oZgZuu/NP4/0HERcq+D1G2E7BXp/WpW9FL83fyrfIoBqrzERerGIV?=
 =?us-ascii?Q?yxjWycPQmL1OCIDETpgKDt9eM3P9i+KwiY5wBKMGnHkcGOReoKfTb5Y3BHSE?=
 =?us-ascii?Q?WTICbCCK1iUq7Kw2yjby52uI9FBuFO5PfBDQbAuFf71NYzdxtpjRsr5hcNcn?=
 =?us-ascii?Q?jjEGZbgsHWuPy84iqiujb98RmGx5P3aLZ2IkbDZqXe1FtSov7kw27PU9Wksu?=
 =?us-ascii?Q?w2vkZk5jILg9pbrG6vkQBprY7kgWx1kCC9sej8iyq6BNt1yB62dNng0+OWPV?=
 =?us-ascii?Q?DHWyvZ+1iHAyHraS1CuRSR7lCr0H9YuWzMA9jqMvHM6j2U96dW+Vp5TG1vX3?=
 =?us-ascii?Q?15fmx1Yu6NsFYUI11XTvRsQcehB07dXRWOSFRObTP4wNBOEvW39Dl0+XrKbz?=
 =?us-ascii?Q?4hrtehY7WqNbGRsTSpjl75w=3D?=
X-OriginatorOrg: valinux.co.jp
X-MS-Exchange-CrossTenant-Network-Message-Id: 8230f3f0-d2ab-4234-77fd-08ddb64cc4f8
X-MS-Exchange-CrossTenant-AuthSource: OS3P286MB0979.JPNP286.PROD.OUTLOOK.COM
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 28 Jun 2025 14:04:59.5873
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 7a57bee8-f73d-4c5f-a4f7-d72c91c8c111
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 5eNZdSiZ1Fp0Ky/KitquTu/wmfWUbRnJThP5Joi/T8j4b9MYGLBkZdHaliANgmTwXvw7BS/NfB3kM+OADkOCaA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: TYCP286MB3800

On Mon, Jun 23, 2025 at 03:33:55PM +0200, Orzel, Michal wrote:
> 

Thank you for the review + apologies for my delayed response.

> 
> On 21/06/2025 17:11, Koichiro Den wrote:
> > This is preparatory work for the upcoming commits that implement the
> > standard PV time interface (ARM DEN 0057A).
> I personally don't find such messages useful. If at all, reasoning should be
> given first and then this message could appear.

Right, I'll rewrite the commit message.

> 
> > 
> > No functional changes intended.
> > 
> > Signed-off-by: Koichiro Den <den@valinux.co.jp>
> > ---
> >  xen/arch/arm/domain_build.c | 29 ++++++++++++++++++-----------
> >  1 file changed, 18 insertions(+), 11 deletions(-)
> > 
> > diff --git a/xen/arch/arm/domain_build.c b/xen/arch/arm/domain_build.c
> > index 4ff161887ec3..9d44b6fa9470 100644
> > --- a/xen/arch/arm/domain_build.c
> > +++ b/xen/arch/arm/domain_build.c
> > @@ -1070,6 +1070,23 @@ static int __init find_host_extended_regions(const struct kernel_info *kinfo,
> >      return res;
> >  }
> >  
> > +static int __init find_unused_regions(struct domain *d,
> > +                                      const struct kernel_info *kinfo,
> Let's not propagate unjustified (IMO) behavior of passing both domain and kinfo
> pointers. The latter contains the domain member and therefore is sufficient as
> argument.

Thanks for pointing that out, I'll do so in the next take.

> 
> > +                                      struct membanks *ext_regions)
> > +{
> > +    if ( domain_use_host_layout(d) )
> > +    {
> > +        if ( !is_iommu_enabled(d) )
> > +            return find_host_extended_regions(kinfo, ext_regions);
> > +        else
> > +            return find_memory_holes(kinfo, ext_regions);
> > +    }
> > +    else
> > +    {
> You can take opportunity to drop unneeded braces

Will update this part in v2. Thank you!

> 
> Otherwise, LGTM.
> 
> ~Michal
> 


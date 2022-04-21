Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id AE5BC50A1CD
	for <lists+xen-devel@lfdr.de>; Thu, 21 Apr 2022 16:12:19 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.310236.526944 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1nhXXV-0008M7-Jv; Thu, 21 Apr 2022 14:12:09 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 310236.526944; Thu, 21 Apr 2022 14:12:09 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1nhXXV-0008JU-Fe; Thu, 21 Apr 2022 14:12:09 +0000
Received: by outflank-mailman (input) for mailman id 310236;
 Thu, 21 Apr 2022 14:12:08 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=lloE=U7=suse.com=jbeulich@srs-se1.protection.inumbo.net>)
 id 1nhXXU-0008JM-Eh
 for xen-devel@lists.xenproject.org; Thu, 21 Apr 2022 14:12:08 +0000
Received: from de-smtp-delivery-102.mimecast.com
 (de-smtp-delivery-102.mimecast.com [194.104.109.102])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 06ca049c-c17d-11ec-a405-831a346695d4;
 Thu, 21 Apr 2022 16:12:07 +0200 (CEST)
Received: from EUR04-VI1-obe.outbound.protection.outlook.com
 (mail-vi1eur04lp2056.outbound.protection.outlook.com [104.47.14.56]) by
 relay.mimecast.com with ESMTP with STARTTLS (version=TLSv1.2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 de-mta-17-AffPjT4fNx6u0geZCt_A5g-1; Thu, 21 Apr 2022 16:12:05 +0200
Received: from DU2PR04MB8616.eurprd04.prod.outlook.com (2603:10a6:10:2db::16)
 by AM0PR04MB4497.eurprd04.prod.outlook.com (2603:10a6:208:6a::28)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5186.14; Thu, 21 Apr
 2022 14:12:04 +0000
Received: from DU2PR04MB8616.eurprd04.prod.outlook.com
 ([fe80::5cb0:5195:4203:7c2f]) by DU2PR04MB8616.eurprd04.prod.outlook.com
 ([fe80::5cb0:5195:4203:7c2f%7]) with mapi id 15.20.5186.015; Thu, 21 Apr 2022
 14:12:03 +0000
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
X-Inumbo-ID: 06ca049c-c17d-11ec-a405-831a346695d4
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=mimecast20200619;
	t=1650550327;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=D3rLLPwGQb6X5D7LmfRjyLc5HrRUq6dttUpO0EEHTsE=;
	b=dY0gTlBO3RjeviiVIIY5VeA9Sha3TSTfHGcxUrZ9oNAJecapPhrJu3WeVhBnMpafsY/21+
	+PUTUmVrpvE8WPHdn0qaJ+XGTjyde5KgiUoOLd1uISshLYvfEpeRu7QXU0d3Z8QCnVGtjq
	ajhAF1Jq5TmYNPLWoxxAXgeUlY7TIvw=
X-MC-Unique: AffPjT4fNx6u0geZCt_A5g-1
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=WAwRJTLOw2E1a9XMRYLx6uAX12CBX9kUd/YKdGGGhKwrLSUpp5ceOhOZNb9HtlgZViDcDp0TW617vB2ZhxgPrSnfLnp4UQuoxii0TYAGfHlPWajgGpwfojP+QGcs+HwB2A+vigNjK8QLFZF1Hs94Ox9/jcRdGlMms76BYRDsofA3d/Fq75jsGrbzDtusU/phePMWJAN78N7hBZsNmmjNJmCiPIskhNoZIF4M5Qw/pUOIn680V6rP6obgVeMt+gbS15wchYedPVs73k1F1QnAsx1PtUIWzU3M+9vGBKupctj5trpTKk1TDayeeuGzSDDK/HDcPC6zRt4PzztlJVwkow==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=vXo0w0CYODB9ALcu+zQYRCzxY1GbV6wdvC3xednxnSs=;
 b=SHnT6Y8ke/NT3jM90q3y0eTfyDIsJ5M+7HZRfXlJl0qCzeB5CcvE9FocEFFfD2nc0y9ekw9+RW2gFDP/D8q05tJ+vnpWLFwab7+5gbqzmnim4oX+SAa5lmd1hgUCoHB7NC1KDciny/H/r3milM7jUaPvpLrQ7iU8CjS4Fi1JLLnchGsgaw3Z8eiM4ap8gnsXubTsQ6LsZZEgD7EhQ5BNsmjgTQrbN2rLa5Ljv0Uv55kWoeRfpGleieEJhuTVybX0IEQPSACu6RGVOzeHXXRMHn3rFiDfuEBkRn7He3KGeh/1pue3q3a+D3y+89MItNJHTWN1fAaRW0T1aodiZWO4pg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=suse.com; dmarc=pass action=none header.from=suse.com;
 dkim=pass header.d=suse.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=suse.com;
Message-ID: <a2792176-88e7-0da2-582c-157620fa62fe@suse.com>
Date: Thu, 21 Apr 2022 16:12:01 +0200
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:91.0) Gecko/20100101
 Thunderbird/91.8.0
Subject: Re: Ranconfig failure between VT-d and HVM
Content-Language: en-US
To: Andrew Cooper <Andrew.Cooper3@citrix.com>
CC: xen-devel <xen-devel@lists.xenproject.org>
References: <9537f2bf-981c-d4ac-d41d-ab59f7d7ab2c@citrix.com>
 <4095a567-86aa-8311-ed92-730348ab43d3@citrix.com>
From: Jan Beulich <jbeulich@suse.com>
In-Reply-To: <4095a567-86aa-8311-ed92-730348ab43d3@citrix.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable
X-ClientProxiedBy: AM5PR1001CA0064.EURPRD10.PROD.OUTLOOK.COM
 (2603:10a6:206:15::41) To DU2PR04MB8616.eurprd04.prod.outlook.com
 (2603:10a6:10:2db::16)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 5752ca27-8c2f-400c-bb4e-08da23a0e8a3
X-MS-TrafficTypeDiagnostic: AM0PR04MB4497:EE_
X-Microsoft-Antispam-PRVS:
	<AM0PR04MB4497C31FD1DF2480551A80A8B3F49@AM0PR04MB4497.eurprd04.prod.outlook.com>
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	7ujCGmVf9Y/d3G54WRlxHUjQtXSv6CV+FFD0FgjY3ZNb5sLV/CBQfLltprXLBnpSDdPjrOsE4G2cDxlkon4opfimWsRK26lGWJnunFoH+YaZcxCr0yGT+UmAg4gD4CuoiFP5I7M0SIMetcIZac412Xk1dWQPbqNPQ8XGtmCaj90r6LCfVA1JrRlkuHfFIkoHN0eN/zC8i1ybZfcSc9054QBjBd5hBqqCE565Zg9MkcQuPYCM1/iHax6whViLV1rlwN6VCslGYlbM60psDOR42YeUTKwqiMxXuEWOGmM4yTcGIrIH4Te1bExEc8pUuBfMUM6+OKvqBUYvaWTogAC1ikhB48JEFfljXs/aMbHEzjH4Qtb2zXnG1iM8F7GabR4P7rnKwz4IUP6HlrNszOhIBlPbonfD8YxI6zL+fpDPPsQ5lCC3fzf1+dXHASt9kI3v4C01VCdRtx9gfgbO10tXV6xkCR2tqt+W99H6bTm+q7IpF/+0tpI9F0BtArjlo+Nytvd2HxD+t7S9GxxeXHE7SrIZbBbdHn/cHDHIRuI5E/cDCPKHKvDZ3bkoUKa5Q9J9hoZPIbXzx38VMZ86ZT2zSbTfTBBj5hr6mOm2qQ1dvXPWSFChKczqdDDU3vGLY/RBosTAD6toZ8wpXYDPat/Y7IhiJVz98gOT3pVFmAPJRAVcBR4MmYeWBHxyXyrMK/oQcGSS+sqA7uepazn+L28jeOzrKJh47GYBPIeqvKtWMJydlW5VvtTCcKu4wRL6m4x3sX7ugWAGUMzjBeOvSdwtElX4H0zOl9JzxrqNK0baTuPQLylNJLRGtlUJXqG7eQep
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DU2PR04MB8616.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230001)(366004)(31696002)(86362001)(6916009)(5660300002)(6506007)(66556008)(36756003)(31686004)(186003)(316002)(966005)(6486002)(508600001)(8936002)(8676002)(26005)(2616005)(66476007)(66946007)(4326008)(2906002)(53546011)(6512007)(38100700002)(45980500001)(43740500002);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?8VS2dPpRUFw7FlV7R4fWsRRZtczcKh+wU27xXYlfKoR1nz7HfM0MOnXXlBYL?=
 =?us-ascii?Q?Z17XTxqEqeHisZGAcK2o9hix/4Wz+u6zRvoQDReEz45gkUGODxe+PWt5Xi95?=
 =?us-ascii?Q?TLsfGuBqTAt4+DeFk+qlCfwzm4m5rnPUmhiVW7q4FYdjs/vXOXEhIHiEvqke?=
 =?us-ascii?Q?/g+WE+TELSghmko0ZoggE4qRrrE8dO5nijyez8Hv/wdkncqQOgZaVCOstQHt?=
 =?us-ascii?Q?PF8DYZZRJljDzNLA31/+zsG5gjIy8R7ghXuwNuWLGrHZ3x/HLh2XRndVX9Pu?=
 =?us-ascii?Q?ZUljJe42tmSHYMKeoOFKxJo5ArK6UNy8OpBbwUT6MbRF4+4VDQhNHbKco+U/?=
 =?us-ascii?Q?hB2WH/P1738xOe2+iCvb/EALsvfMdo9/D6ho35GckzJ25aP66bpAkMqKEuBk?=
 =?us-ascii?Q?HH0QrfFxfNrw4NTBGSJYmzvYIfUYxsDxTLjQq/U7R1C7S7diFvKxsM8Ir30k?=
 =?us-ascii?Q?HP6C21aGpRzLeQJys10/VNsr6GS1pTi8mLp8dPP96wbk+7sJ4Brc/4R6W1Oc?=
 =?us-ascii?Q?aK9HDQ5yX9SS9/bOxR2LH3vOp7m3E0VCBt2chYJ9hf4zZF8n5mJlYnXla81p?=
 =?us-ascii?Q?hhRXk6AVfMmWknmIszTQd7llKviaGO5sbwKNIH4Yv8QyubzOoh6DMEGalGaE?=
 =?us-ascii?Q?3YWhdQO2FAbUDqkDi98lbUnLQ1dQWx9/4UAkZu7b4FS6lCO+l0vs3VJO0omF?=
 =?us-ascii?Q?G+R43FNXy3cXkQ8IyMeVy4aIaamxVBUOg0JfEvnDa1Yw6mrpQI7eN6VvSAx9?=
 =?us-ascii?Q?aDeg/CU6PSpqnZiaaoQlN9Xtm5ga2pfsY7ooZqb0Ki+GxhZqkAxOoRBD4VNk?=
 =?us-ascii?Q?KLkOflVK200fqaQGxEvuKyNmOgWQCQBrvrRxSqFZK5PUzN8ouUYuMEQ+T4XO?=
 =?us-ascii?Q?p/8JU4S0Nu8AQXzqIBejTl2YOh9vKdi8EN4jaRm6SCsjKcCfXFyo0DA/5j18?=
 =?us-ascii?Q?H6jsDQxNk6jTTClTIvIWtaZt4HsZhVXInlSgXauUT9S2gA968SQYzCQpIqqC?=
 =?us-ascii?Q?DNZgeTcroEFP1vJKQFkGZlfKDFYqR+DxgyeUhW0YD8pujGBpJ1nBTJQ8at89?=
 =?us-ascii?Q?ED5z9i4VYxr929pjOsDad4kny3qWkRiSgWO+WTMqFM5pl6obNPKWvvSwxOnu?=
 =?us-ascii?Q?EZQDNyJRQZ4kJ7diQS91MO2uePZhdACrwlVKWqvWMhV+k4PNVPcQSZM8Fy4P?=
 =?us-ascii?Q?iOc3f0jPgfPiSvQawfXQ7rvY7vJ3sRcWwyxUfMXIwB1A/F8rfUqZudz8XFGJ?=
 =?us-ascii?Q?ykNb2OPnrcNCKboq2ULUVP0vR/nsgRiPmntoJUCFsLBS4acxTpGgOweC9Pyv?=
 =?us-ascii?Q?vqZ4FP+7UnOZRV0Pr85/iI/a5vz+/yBcUQ+abQ+21utV6pZOQ4qHiWN3iwjf?=
 =?us-ascii?Q?kKhvMINyhwAfn00FD1R3Vl+Bgr0Qs/fRJ5EDXMnFfZ62Y5WyWcZw2c8aA5/n?=
 =?us-ascii?Q?KdOCnyYlakhSm3sH5uTSEr9NHiWjKsDC0tjWCKkfC8Hjw2EUkSnlqNAat5mO?=
 =?us-ascii?Q?MioVuxKyZryh4kTn+hXHDnzX8pImi3ATrWgA2E9TmUNrse2/FN1j4woTHvUm?=
 =?us-ascii?Q?4nc3ovnLNPKnmBJhQmZPVjJ94K/U/YuW8SCI3u0ttfUwz/+UZ7WlgOSDYxN+?=
 =?us-ascii?Q?F9dbJworv3bDXT7PzmHXfNVm8Hk+NU8yN7b0IFOzQtqSy1jD0Vi5BJQIDwUi?=
 =?us-ascii?Q?nZrMno5VS7nY5i+L1SuNGc765zimeod+nJ1JeKoIxUZ5dCs3izvNf/M9H4Y0?=
 =?us-ascii?Q?MhTjLJ6oaQ=3D=3D?=
X-OriginatorOrg: suse.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 5752ca27-8c2f-400c-bb4e-08da23a0e8a3
X-MS-Exchange-CrossTenant-AuthSource: DU2PR04MB8616.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 21 Apr 2022 14:12:03.3786
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: f7a17af6-1c5c-4a36-aa8b-f5be247aa4ba
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 5vMjp6z60QgPvJmPNxE3u4VaECUKUZL6Dd5AziA/QRwd+W8jISDvjmvfHY1/rneRXCIJLcSCjZVrYN4f595Rew==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM0PR04MB4497

On 20.04.2022 20:01, Andrew Cooper wrote:
> On 20/04/2022 18:49, Andrew Cooper wrote:
>> https://gitlab.com/xen-project/people/andyhhp/xen/-/jobs/2355562119
>>
>> ld: prelink.o: in function `vtd_setup':
>> drivers/passthrough/vtd/iommu.c:(.init.text+0x219f6): undefined
>> reference to `opt_hap_2mb'
>> drivers/passthrough/vtd/iommu.c:(.init.text+0x219f6): relocation
>> truncated to fit: R_X86_64_PC32 against undefined symbol `opt_hap_2mb'
>> ld: drivers/passthrough/vtd/iommu.c:(.init.text+0x21a23): undefined
>> reference to `opt_hap_1gb'
>> drivers/passthrough/vtd/iommu.c:(.init.text+0x21a23): relocation
>> truncated to fit: R_X86_64_PC32 against undefined symbol `opt_hap_1gb'
>> ld: ./.xen-syms.0: hidden symbol `opt_hap_2mb' isn't defined
>> ld: final link failed: bad value
>> make[3]: *** [arch/x86/Makefile:137: xen-syms] Error 1
>>
>> It's really not clear why this has first show up now.=C2=A0 There has be=
en a
>> huge quantity of noise in Gitlab CI for the past 3 weeks with ARM being
>> offline, but I can't see anything relevant in the large number of IOMMU
>> changes in that period.
>>
>> Anyway, the issue is simple.=C2=A0 It's vtd_ept_page_compatible() in a
>> !CONFIG_HVM build.
>=20
> And just after sending, I realised it's not an IOMMU change.
>=20
> commit c479415610f0448bb07d39185e72ef36e08ebec0
> Author: Jan Beulich <jbeulich@suse.com>
> Date:=C2=A0=C2=A0 Fri Apr 8 13:50:29 2022
>=20
> =C2=A0=C2=A0=C2=A0 x86/P2M: p2m.c is HVM-only
>=20
>=20
> CI disputes the claim.

Just as an intermediate result: In my !HVM build (with gcc11) this

        if ( !vtd_ept_page_compatible(iommu) )
            clear_iommu_hap_pt_share();

simply compiles to nothing, which I assume is the result of
clear_iommu_hap_pt_share() doing nothing in that case. Hence no
reference to opt_hap_{2mb,1gb}.

Jan



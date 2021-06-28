Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 25F473B5A07
	for <lists+xen-devel@lfdr.de>; Mon, 28 Jun 2021 09:49:48 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.147734.272616 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1lxm0P-0004sh-PT; Mon, 28 Jun 2021 07:48:33 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 147734.272616; Mon, 28 Jun 2021 07:48:33 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1lxm0P-0004q2-LJ; Mon, 28 Jun 2021 07:48:33 +0000
Received: by outflank-mailman (input) for mailman id 147734;
 Mon, 28 Jun 2021 07:48:31 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=T4Tg=LW=suse.com=jbeulich@srs-us1.protection.inumbo.net>)
 id 1lxm0N-0004pw-Pk
 for xen-devel@lists.xenproject.org; Mon, 28 Jun 2021 07:48:31 +0000
Received: from de-smtp-delivery-102.mimecast.com (unknown [194.104.111.102])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id 61ca2de9-dcb7-425e-aa82-3bd4e6908611;
 Mon, 28 Jun 2021 07:48:30 +0000 (UTC)
Received: from EUR03-AM5-obe.outbound.protection.outlook.com
 (mail-am5eur03lp2050.outbound.protection.outlook.com [104.47.8.50]) (Using
 TLS) by relay.mimecast.com with ESMTP id de-mta-8-Lk29B_fGMNWHRcmOgjm4MA-1;
 Mon, 28 Jun 2021 09:48:27 +0200
Received: from VI1PR04MB5600.eurprd04.prod.outlook.com (2603:10a6:803:e7::16)
 by VI1PR04MB6864.eurprd04.prod.outlook.com (2603:10a6:803:138::20)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4242.19; Mon, 28 Jun
 2021 07:48:27 +0000
Received: from VI1PR04MB5600.eurprd04.prod.outlook.com
 ([fe80::99d3:99cd:8adf:3eea]) by VI1PR04MB5600.eurprd04.prod.outlook.com
 ([fe80::99d3:99cd:8adf:3eea%5]) with mapi id 15.20.4264.026; Mon, 28 Jun 2021
 07:48:26 +0000
Received: from [10.156.60.236] (37.24.206.209) by
 PR0P264CA0231.FRAP264.PROD.OUTLOOK.COM (2603:10a6:100:1e::27) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.4264.18 via Frontend Transport; Mon, 28 Jun 2021 07:48:26 +0000
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
X-Inumbo-ID: 61ca2de9-dcb7-425e-aa82-3bd4e6908611
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=mimecast20200619;
	t=1624866509;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=SepR3EtBTO1KSFKVfte0PAqJwsJ9K5Rytq5s+ceOquQ=;
	b=GH+mgPl4gIBQaoV7EXmp4aSvgsVRL4oPQYP4rS7rm1Z6uJpf6Gl6cEP9ooq9lNqRFwg6Cv
	wkpxxjuJiCo4fbFIMoQWFmvxRRFU/GAee2ezqObYtOn/G6cxJrRS0CXQe4SLl9sL+xAM6r
	SYC8upA5Z6yUoDatUKgv1Rr2mOj1Iuo=
X-MC-Unique: Lk29B_fGMNWHRcmOgjm4MA-1
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=lsARovnZdJfdKdoCvU4rQyncucokSaoX80W2RndV0IRHMja/gTdv//eTnOXQdkOMBGxC+eDhGYC7aDHxwuZtf2PvwDu7JqdZsjdsngxqhlB0V5rZVKq/1vaihV6Bs4J27mG3jNBtXevoXCykzhpwdf4pviJX7OKKYMTFPZyPD/BWdZ/BCtge+sr7wBaPnSOX6hWu3ITgww2O3oACRTDES3cl6OF7zi68NUzUJMV8JGNq0SEn3r5xEMPIgMkEcGTDsuQzEBZ0SheSh9QRRzKpWg8ad6oG2d2G7eG4/TxlMabopocFCp9kcK62X8SJBozMVcZxdW1L9w5EnQ89nQw4Zw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=/u3sp1G1hFNEfwlHUsmH5TEQyR13zTTE4f0w2duRqhw=;
 b=HJiSX/JTW+HhLBhiAb/UtLSBaoW2wawa3Q5U0DPC5z2u8Rj2odpQrINmi2rkMFEwhKXFXYFQc1DkG15I59RdOQk/nrttLuRvjjwQtTsBJSfcp+SJLs/l7t29U5LuoR6RN/pBu/ynK1JWo5FtrOdX0AQa/aMDWdwWSggAuBgM5/MuzkR/8HwwD05ziW+4faIr1eRVpHIxV6A6Xq+dilyJEwxqFktHp8SLQSieD4bv/vAceR3y2ku4w76Ej/UuG5ZCJhxXpa9jFJBgV5HdMbwIzVwOj203VW9VPh9bWcN/gFngIPc+C1HyPMekfT/7CY2tK1VpOCkVuXQM15ueuxgluA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=suse.com; dmarc=pass action=none header.from=suse.com;
 dkim=pass header.d=suse.com; arc=none
Authentication-Results: lists.xenproject.org; dkim=none (message not signed)
 header.d=none;lists.xenproject.org; dmarc=none action=none
 header.from=suse.com;
Subject: Re: [PATCH 02/12] libxenguest: deal with log-dirty op stats overflow
To: Andrew Cooper <andrew.cooper3@citrix.com>
CC: Wei Liu <wl@xen.org>, =?UTF-8?Q?Roger_Pau_Monn=c3=a9?=
 <roger.pau@citrix.com>, Juergen Gross <jgross@suse.com>,
 George Dunlap <george.dunlap@citrix.com>, Ian Jackson <iwj@xenproject.org>,
 "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>
References: <912fa390-f9e9-198a-9aee-39fdb9a28fcc@suse.com>
 <46831816-a5f2-2eb4-bb91-aba345448feb@suse.com>
 <5e725a42-953a-c96f-3e72-f0c741b0ce16@citrix.com>
From: Jan Beulich <jbeulich@suse.com>
Message-ID: <4e3afc8e-1ed8-2e27-b583-476d35352efd@suse.com>
Date: Mon, 28 Jun 2021 09:48:26 +0200
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:78.0) Gecko/20100101
 Thunderbird/78.11.0
In-Reply-To: <5e725a42-953a-c96f-3e72-f0c741b0ce16@citrix.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: quoted-printable
X-Originating-IP: [37.24.206.209]
X-ClientProxiedBy: PR0P264CA0231.FRAP264.PROD.OUTLOOK.COM
 (2603:10a6:100:1e::27) To VI1PR04MB5600.eurprd04.prod.outlook.com
 (2603:10a6:803:e7::16)
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 2412636b-b60d-40ba-45ce-08d93a091d17
X-MS-TrafficTypeDiagnostic: VI1PR04MB6864:
X-LD-Processed: f7a17af6-1c5c-4a36-aa8b-f5be247aa4ba,ExtFwd
X-MS-Exchange-Transport-Forked: True
X-Microsoft-Antispam-PRVS:
	<VI1PR04MB6864218BFC15754A1F7A9933B3039@VI1PR04MB6864.eurprd04.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:10000;
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	pl8t816JSwf4LagMj4slXaPIn3LjCZHkURvH5QTr2n6crGwDj7pBVQfA/bU/wHv6PV/OrvS4LJvAUGdXaO2hpwqlN5N26VBGbZqdX+hpW2brxXaRastPq/LHdNcCgtU4zvx99N9TTxTPU36UFk+KFydV2m7yo++3uIM6zZgFTOODU3kTWLexd9rVz+Wf8lvBKitQbFZYWnpEztQW+JUx2nNbRZMF+cGZSBXXAyZqdBnKAhP11toZp7mjEPND4oxE/GP2F99QNdbCNbNaPIbAxvZnjLNmTSR6gch/2KrQTbod6Jp32gPS83eoVc7z3kM/mTm52gwsHQWKHLm/BZkjQ2YAlHGDQod6Ea326w+i+egq9ivR+znHaSVR/Gz6ksd3asQ0L7Ps7N3c8GH1YX2hRXlmdBNlXjmnmULmz02XRDy2KrrD2Tw77vGUe58g7U7ULoCxBX+n+PwCrxL7KZ0qDKN5aKltIUUKgiXcvbrGQAgaGceGFpgvNqAPTYHJfOJojb2k15+qSyM/O19DqJxsnLHKBB/7pZZc6v0RMHjPIUiCzLNat+gGm4+o5Tp9ADnKvz518oX11TS7lE5/m/EQlG6n0sK6zXFXL01LgvryUZ0i3X8nH5RyaWQ35Lb9MPfhZ1arcxCQ93xxUVfqhA6B2o26NpHap5xNqeoyqUOZdgXQFGnLc6ZNa670yH4JXECH/4Ce33PR7BUC5F8pSRcTw23FCWYEj9xq8HBTs0V0B/rPg2IBbz15q3lkitcMph9n
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:VI1PR04MB5600.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(346002)(376002)(366004)(136003)(396003)(39850400004)(6486002)(54906003)(38100700002)(2906002)(66476007)(66556008)(86362001)(66946007)(316002)(2616005)(5660300002)(16576012)(6916009)(26005)(478600001)(31696002)(8676002)(8936002)(83380400001)(186003)(16526019)(36756003)(4326008)(31686004)(956004)(53546011)(14143004)(43740500002)(45980500001);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?5BjQ4zn+Q5zXP7zKpMoDAj1/g830LPNWf+fDXuKV4w/dAKozMiS6ZfyE0nII?=
 =?us-ascii?Q?zpyfVoz5aRawnPtk/PlBnufBHSipk5o3wm2wGpKC+d3jCxD0Vd5b0J03VIM2?=
 =?us-ascii?Q?5LyW/nO2HHKBj2GLT1+hLOr8ClzHnSMi+h4Fzr88V91UCi1cvJnf7nUk0QMX?=
 =?us-ascii?Q?y3QtOJyi0rZPr95mO4AZpkd0ClWZ2Lm5u4twMTHLGdH/Gih01fVBiLNhUIHF?=
 =?us-ascii?Q?JCKeQtt9aOjkm9vfprtf8U/6Tzfe/fGBkXkhS0ZfMIvOPh6m3ibMu+lPYczk?=
 =?us-ascii?Q?ejboU/ZDu1vrMVToc2OjDv+tW/ReIOj1VgKvDa37p9o+6RD6VVlCCsM0V5Zi?=
 =?us-ascii?Q?VQ1VgyDSwaxf5XMs2js4H1idvO5lqeJv6fnfi+nqd6uPP+x6eFdcQVIecCjf?=
 =?us-ascii?Q?X5luEB9xmROk+UV+yVWPs6Lbxc5C/7U2hFM6HUvbWdFzlzUeG33hEnA9Tt0C?=
 =?us-ascii?Q?xSRLnpxh+apw6Z0IibAywx/HuBgl/ct1Y9Y43kEcFzq2UeAF0B2mqRWWPEPI?=
 =?us-ascii?Q?0j9aarYMpJ4ldawYMhlgZKVQyWewiD8JQuBBRHzWnOBE4zwOYwtd2zVjD93U?=
 =?us-ascii?Q?bnFJ6Dy7+JXcTdJcOmz3Fw9MI5AQPqjG6zTKRHVydtyBf13i2RkbIJ/jOi0l?=
 =?us-ascii?Q?ZrpILDhrdzX7BqOZ1WbsPOn+tVAdVvP7j1K9U9cdALKyJh3EnN3hg9xmEq9X?=
 =?us-ascii?Q?SF2RuQogiFubowBg4kfgLfrSWxWDWZXi3FATJrC/qt+8ZibvyrMPrRIrjYO6?=
 =?us-ascii?Q?qJs78jo2xI+mAjOG48494S8nU+NErS0rUd+hi/Tqs7Mph06foN1hNl3a3Mm1?=
 =?us-ascii?Q?SADGAltOKv/e92XH7JtDSR8NQfItLHiMMJvlfalO6kf2bvDVaFn8zkH6qGx+?=
 =?us-ascii?Q?kvgpPG1GMyREAhMQsDkOFk7vtCSw+5NkEGPOFzsMgaa2J+M5naim5W+QQQSc?=
 =?us-ascii?Q?PaV9E4uKbDXKeGpUy4vPZAkfMXpi92x+ZW26M3OTACn9V6ZiuanoPZmTEx2Z?=
 =?us-ascii?Q?tKhvxPJYdpNAVAk267PVu1Yj5E92fZxOP8FfveTKyklUxO4kaRC/+n4kkjvJ?=
 =?us-ascii?Q?9vSHsDPCGJsflsjylPpBPf+Vr+5kcO42xuclV/BleilNLvuD/oSOV3TVZrjZ?=
 =?us-ascii?Q?nk4J4idDjDvT4aY1RsjD4juvkql7BdXnZv3eL8xyNuPA/BjgWpJQzTlAP3L3?=
 =?us-ascii?Q?6AuG37GCKHVgw69qeK/lHYlk+t9++8V2RIvsDZmzfewnBb5ryVMbZos6yk/7?=
 =?us-ascii?Q?cBl4vsBDLJ6NJCTqXyzDjRigl1z+MdY8HVHZxpHPSATfivK4zqCOzwXtxnL4?=
 =?us-ascii?Q?xPbuj+bI4SZ7gJOHChHRD1t6?=
X-OriginatorOrg: suse.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 2412636b-b60d-40ba-45ce-08d93a091d17
X-MS-Exchange-CrossTenant-AuthSource: VI1PR04MB5600.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 28 Jun 2021 07:48:26.8366
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: f7a17af6-1c5c-4a36-aa8b-f5be247aa4ba
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: bGpKWtdx98byX1cwK1D9Ol6sYDPqzH3UPs/8TY7w8odWZn/k7RYoyQ1VFHHeP4x5he9T7XsuyGc3Q3Af688XGw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: VI1PR04MB6864

On 25.06.2021 18:36, Andrew Cooper wrote:
> On 25/06/2021 14:18, Jan Beulich wrote:
>> In send_memory_live() the precise value the dirty_count struct field
>> gets initialized to doesn't matter much (apart from the triggering of
>> the log message in send_dirty_pages(), see below), but it is important
>> that it not be zero on the first iteration (or else send_dirty_pages()
>> won't get called at all). Saturate the initializer value at the maximum
>> value the field can hold.
>=20
> I don't follow.=C2=A0 Migration would be extremely broken if the first
> iteration didn't work correctly, so something else is going on here.

As per the title we're talking about overflow situation here. In particular
the field did end up zero when ctx->save.p2m_size was 0x100000000. I'm not
claiming in any way that the first iteration would generally not work.

>> While there also initialize struct precopy_stats' respective field to a
>> more sane value: We don't really know how many dirty pages there are at
>> that point.
>>
>> In suspend_and_send_dirty() and verify_frames() the local variables
>> don't need initializing at all, as they're only an output from the
>> hypercall which gets invoked first thing.
>>
>> In send_checkpoint_dirty_pfn_list() the local variable can be dropped
>> altogether: It's optional to xc_logdirty_control() and not used anywhere
>> else.
>>
>> Note that in case the clipping actually takes effect, the "Bitmap
>> contained more entries than expected..." log message will trigger. This
>> being just an informational message, I don't think this is overly
>> concerning.
>=20
> That message is currently a error, confirming that the VM will crash on
> the resuming side.

An error? All I see is

    if ( written > entries )
        DPRINTF("Bitmap contained more entries than expected...");

> This is a consequence of it attempting to balloon during the live phase
> of migration, and discussed in docs/features/migration.pandoc (well - at
> least mentioned on the "noone has fixed this yet" list).
>=20
>> --- a/tools/libs/guest/xg_sr_save.c
>> +++ b/tools/libs/guest/xg_sr_save.c
>> @@ -500,7 +500,9 @@ static int simple_precopy_policy(struct
>>  static int send_memory_live(struct xc_sr_context *ctx)
>>  {
>>      xc_interface *xch =3D ctx->xch;
>> -    xc_shadow_op_stats_t stats =3D { 0, ctx->save.p2m_size };
>> +    xc_shadow_op_stats_t stats =3D {
>> +        .dirty_count =3D MIN(ctx->save.p2m_size, (typeof(stats.dirty_co=
unt))~0)
>> +    };
>>      char *progress_str =3D NULL;
>>      unsigned int x =3D 0;
>>      int rc;
>> @@ -519,7 +521,7 @@ static int send_memory_live(struct xc_sr
>>          goto out;
>> =20
>>      ctx->save.stats =3D (struct precopy_stats){
>> -        .dirty_count =3D ctx->save.p2m_size,
>> +        .dirty_count =3D -1,
>=20
> This is an external interface, and I'm not sure it will tolerate finding
> more than p2m_size allegedly dirty.

But you do realize that a few lines down from here there already was

        policy_stats->dirty_count   =3D -1;

? Or are you trying to tell me that -1 (documented as indicating
"unknown") is okay on subsequent iterations, but not on the first one?
That's not being said anywhere ...

Jan



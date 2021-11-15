Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 1EC3E450307
	for <lists+xen-devel@lfdr.de>; Mon, 15 Nov 2021 12:03:42 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.225777.389957 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1mmZlM-0006YA-EY; Mon, 15 Nov 2021 11:03:00 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 225777.389957; Mon, 15 Nov 2021 11:03:00 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1mmZlM-0006Vn-BX; Mon, 15 Nov 2021 11:03:00 +0000
Received: by outflank-mailman (input) for mailman id 225777;
 Mon, 15 Nov 2021 11:02:59 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=uxYG=QC=suse.com=jbeulich@srs-se1.protection.inumbo.net>)
 id 1mmZlL-0006Vh-AD
 for xen-devel@lists.xenproject.org; Mon, 15 Nov 2021 11:02:59 +0000
Received: from de-smtp-delivery-102.mimecast.com
 (de-smtp-delivery-102.mimecast.com [194.104.111.102])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 9771e6e4-4603-11ec-a9d2-d9f7a1cc8784;
 Mon, 15 Nov 2021 12:02:58 +0100 (CET)
Received: from EUR04-VI1-obe.outbound.protection.outlook.com
 (mail-vi1eur04lp2050.outbound.protection.outlook.com [104.47.14.50]) (Using
 TLS) by relay.mimecast.com with ESMTP id de-mta-2-5rGWA8UHOvuFKF-xzzE9TA-1;
 Mon, 15 Nov 2021 12:02:57 +0100
Received: from AM0PR04MB5587.eurprd04.prod.outlook.com (2603:10a6:208:125::12)
 by AM0PR04MB5586.eurprd04.prod.outlook.com (2603:10a6:208:130::24)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4690.16; Mon, 15 Nov
 2021 11:02:55 +0000
Received: from AM0PR04MB5587.eurprd04.prod.outlook.com
 ([fe80::387b:e76e:f981:f670]) by AM0PR04MB5587.eurprd04.prod.outlook.com
 ([fe80::387b:e76e:f981:f670%7]) with mapi id 15.20.4690.027; Mon, 15 Nov 2021
 11:02:53 +0000
Received: from [10.156.60.236] (37.24.206.209) by
 AS8P250CA0015.EURP250.PROD.OUTLOOK.COM (2603:10a6:20b:330::20) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.4690.15 via Frontend Transport; Mon, 15 Nov 2021 11:02:53 +0000
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
X-Inumbo-ID: 9771e6e4-4603-11ec-a9d2-d9f7a1cc8784
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=mimecast20200619;
	t=1636974178;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=T8ya6VCSxe4zqaCa/M4sqxusON15MQIBf9pbVe0Nfp4=;
	b=GMTCm5W8CFFB07ZOn1iJVcTvrtj5joo1AWuFsD4NNfCniirpFzzz4uUXQM58JMEXH1swoz
	dGAtJhzjBdeoFEfu59st2WJ31a/tCfDykmknr1F+cTC7RsoxIv5ENAxD3HqQ6GQ2So0mfG
	khhL+UvbpujIXf/mchfrKlkAzoY/3No=
X-MC-Unique: 5rGWA8UHOvuFKF-xzzE9TA-1
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=gTUo6dhY4OuCUFqD6rFBNV/txjklfz9c9XDoTk0rcDTJXl8uxu/nJh00l3Peme+29xpM1RpCwSBW8V2A0mvqVbZXTioGriWrmTkNJl//71SvvsgcYYjM8nN/mxweUS3jETsKVn9V7Wu6YzLNiU8z71vD1tZUFGCWNbgksmvh6yw26pdq4UaTr7CwaNHPqZnOZ8j1necEuT0t+mLWdB4hJzfDFZLNjIt5V8MhNc1h5aXJq3d8ZHhvMwcBUlCAzXQ1ysg5cUyXbuoKDMqsHmQpxUTfSsnZRlr9e90k9ci3a+t/Utwm5hf+nqOWKWJe37G5lOdgwx/tJP9oKLoyXP/AMA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=V7b762wK0IwJcNCb/AgiZcIEIF2l1RXPGW9Slak8UWM=;
 b=BDF7FPBOXIDppgguDG8EtsLTzeB7YTSApQZK5p9rnN8l0r7sKxrD+0Pv6L6JqxkaEFWlg0yil2wqhO9FydfsDVn/cyt/NubYIViZLlSUK1wGX4VS/xbarNFppM5YrrRhymopqQcS4tZezG1yDi8rkK0bSPLe/CL7iWmToMKC8Dl7qn5NAJs9OU+yqycARzk1c2jdkTWX46O7CF7CSoRflRpu9FFtIVhrhXVePXwvMmHQpjHfIxVqPLrs2kcoXwWnA8PrPXb38qdr6E45krebA1hvhCbWbQ3+cq4LYUMaDzd0UF0XrlMiZlpIG2MGJB6+YgqEpojLm66LBqE4QxX3BA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=suse.com; dmarc=pass action=none header.from=suse.com;
 dkim=pass header.d=suse.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=suse.com;
Message-ID: <ec9b71ee-c687-3556-a999-941886610329@suse.com>
Date: Mon, 15 Nov 2021 12:02:53 +0100
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:91.0) Gecko/20100101
 Thunderbird/91.3.0
Subject: Re: [PATCH for-4.16] tests/resource: set grant version for created
 domains
Content-Language: en-US
To: Roger Pau Monne <roger.pau@citrix.com>
CC: Wei Liu <wl@xen.org>, Andrew Cooper <andrew.cooper3@citrix.com>,
 Ian Jackson <iwj@xenproject.org>, xen-devel@lists.xenproject.org
References: <20211115105106.928-1-roger.pau@citrix.com>
From: Jan Beulich <jbeulich@suse.com>
In-Reply-To: <20211115105106.928-1-roger.pau@citrix.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable
X-ClientProxiedBy: AS8P250CA0015.EURP250.PROD.OUTLOOK.COM
 (2603:10a6:20b:330::20) To AM0PR04MB5587.eurprd04.prod.outlook.com
 (2603:10a6:208:125::12)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 7998d71c-7a29-4ff4-0b06-08d9a82778d6
X-MS-TrafficTypeDiagnostic: AM0PR04MB5586:
X-Microsoft-Antispam-PRVS:
	<AM0PR04MB5586F95DBFB1C1A5CFF52D09B3989@AM0PR04MB5586.eurprd04.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:8882;
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	PTYLg0vbkE2uoDhnRcjcygSSxwdd8cRSPm+fVX/r4HP9qKGAjBto5MabHBWlc0oXZOB4+grPwA52T162SB/8t6v0MbZtC1JswvtvlZkNcR2cGx3+g4ZEvgD7QswGBLla00RH4g+yz1yMYva1fOgvCFglc+gq7GHfOaY4G0Qej/C2YTtTX8We+tLUvxa/Kr7X8rsD5F+irjiW4nDwwYo15DSAnX5LplOijP4CHTg/JimxIFKKSRK98gv/IguJAAtqbM8X16TCI6+A6Y7+Syl4m0Ap83srklXSyKQ2mvBR18xiWii8GYMd8Wf3M2PfOgU6J/MKIvhORe+johuPjSE5xiUVhWxcSHGpEtd9jumAoDgi2GDea3z1ahzdwgGlg8iVaM4LuXCRxQQk5kYDViXf/x5w7WUHo8yJ/JAu4pePHDI9lOJdlRtZ6pBLa6/aV1DwRVNTFcBmFaUVpzd+xZQzEZUh+qHHYdPJEx9m67IO+84rQBVqXxeiw/XRjxUa6/qs5fn87iHcx+UsW1qOS8TeVjBlgeVwwZsEXojO9HwFIoNpZqJQ8HEwZEPAzzdXfnPVHmhi2I6v8OghNrYm9E71MgkYbc6WJPzFo0EfO44Ndagzu8VsUm7Dtozjn/OsDZoCoXKPq4+79vWhSoEiFyCTUgiHD4SJkGDKHyFJ2fcwdICjoBerQCSayUgW2c7LqVwDOePozzloxsUAVNRd9BDEN3S++TtDrOe9Qn3n2of7bS7BYSfWuZ8OhD0elHbi3oQd
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:AM0PR04MB5587.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(366004)(186003)(31686004)(66946007)(6916009)(316002)(38100700002)(16576012)(66476007)(26005)(66556008)(54906003)(5660300002)(508600001)(8676002)(4326008)(8936002)(6486002)(36756003)(31696002)(86362001)(2616005)(956004)(53546011)(2906002)(45980500001)(43740500002);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?BMVznHD39PXgX8LsvSvdjue/rvKXTzkX1VOAx2kaaKx7ByktAGxJSUy+bh4K?=
 =?us-ascii?Q?nrtygzozoV5MJ/42vMTLP8IiIBTfXPVylm/d1amGRqANeuh8h70Kg98gRliU?=
 =?us-ascii?Q?yyWeXQRl2oouyFYTqo/qUiQskqGIb8yFR5LM9ArZKjOhwiQyNbqLE98kzit7?=
 =?us-ascii?Q?nByt4LYhKsuuY5k0QRvFO8xSY5KRMyVTB6FO5JfuBy8QIs9+1xxjFqmgrDwb?=
 =?us-ascii?Q?c7rJE8iCSVfQNwocPEOs6lVzc3IfB7uSlIGdMdu4MGXB9cSANzFIBw7o+DD0?=
 =?us-ascii?Q?AJs0dAeI0v+Jo1yfdKWqCjy4N6Oy5fKfUKCJJ/l6BCYq9KVjVMKZr6gussUF?=
 =?us-ascii?Q?UMH58sJuL8jSnsAUK4EYq0X6916NqxuIU+/IACSp3rxTRe/gOhCuCrBxyP4k?=
 =?us-ascii?Q?4U/BBQlYyR9+U+Ir/5ge6V9rQez4yhv4AqAhcosE6fooDgAzZ9C6R4G5aqnM?=
 =?us-ascii?Q?wGXm9DInYfv13A2RJM4Co1JktVaBLVoR4wy57HGPhPZa+eocTHlextXu/Y0F?=
 =?us-ascii?Q?zf1//iS1xqEgZTU/IvkJPct5/C3RWLqNnMi6Gzc3fXlrbOinWxDpVgyGT6Qf?=
 =?us-ascii?Q?TJewURCols8+tdPI42kpNGa67lgTlud6KFLbszWwwqTpimDya22eqL+opzKN?=
 =?us-ascii?Q?h2O29HI4xY+5v48jUGB40TWxT7wBvLXV9WpaGYHsbl7vTDiHZuuahm1pNc8J?=
 =?us-ascii?Q?ubXOywenn71dWGQhwDh+4K9eILz2zLe1UvqlXIa/WTAMSGfIYVFNTq5EmzrS?=
 =?us-ascii?Q?AU9tGP5Jc0GeYc1KgDL275sN5eGBH3Op/8hnaJZmi2Un0I5dVTh2ysS8Lpjm?=
 =?us-ascii?Q?cH/u5I0uSATJ3buTySix8q9g9jX1q7b4p+qnzAgVfa2ar+JTnvOCFm4hR8VO?=
 =?us-ascii?Q?qBUO3271fRw30PVmGnBYi8DOvqy7xKcvcFDWW13DsgdVN3z0QV4rdL4nJIfE?=
 =?us-ascii?Q?EVfv02i2R/JZFto5eRsJZxP/LNqo2r+LEqfi+b5UZDpDU1Qw5FmwTGTTQauq?=
 =?us-ascii?Q?OFrygboaxEAV+gqEC/KcOwR1gp7Iek7EXDArUhIW+xvE0+fcMHT4z5O8BaMz?=
 =?us-ascii?Q?X1zC23zVhR0thRjPArHlOyry/7UR37lodC+L7mi3ZhSl6RCRbaU6EveGPwmb?=
 =?us-ascii?Q?E9cRhLIvu57tDHatozF4lH60dU9gdc69AzYD8RdH0fsHfld1GrHi1hj1ytHi?=
 =?us-ascii?Q?RU28I7wQccCvBQOs91LtY9KUakHJ8LiB8O7tCbf/nk9OcvtJzGL2ymP+kBgM?=
 =?us-ascii?Q?m6Ktda63lUJaxzCZTeaCXXsp7CQLAx/6qKJQtk0DuGRa0PrPKuzpE3S9oFcJ?=
 =?us-ascii?Q?srCZK7t3jmSz5stnH/T01jfdBRWE0AmWNDMHX1YOyfGGrFl9/k9E4bDHfy1F?=
 =?us-ascii?Q?yRP6MmmJJaogvAEfa8Nn/zLr4rMukDdfRiqNS5pD0jsYSFKcl/+mPA8e/hJs?=
 =?us-ascii?Q?mXwXVVGxO7MLix4Mph2C50fFxcRLYCuy9fHM3Eyz+HL1rSvUdfxYJJdXB2+z?=
 =?us-ascii?Q?TRABs8L7q7xBT0etTuzI+9PeVmeZV0Uj7hlqfSACFwlVF6Xln6TUNTjgDC7g?=
 =?us-ascii?Q?Es0W3Past7fiMrGIB3xUTCCU5B9q10qIve1dLM9H51uJ1NxGYj35+yQ883gk?=
 =?us-ascii?Q?A9w51mbSCcCkEIzaN6PxuHg=3D?=
X-OriginatorOrg: suse.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 7998d71c-7a29-4ff4-0b06-08d9a82778d6
X-MS-Exchange-CrossTenant-AuthSource: AM0PR04MB5587.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 15 Nov 2021 11:02:53.5249
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: f7a17af6-1c5c-4a36-aa8b-f5be247aa4ba
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: CnQkgA4bAXEQA68jAHsxT6CVODnvzE/VBg0wl0YmZ7IsDktQxf/D6SC1Jn/HuqKq84n+Lm63/etcC75x50JRZQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM0PR04MB5586

On 15.11.2021 11:51, Roger Pau Monne wrote:
> Set the grant table version for the created domains to use version 1,
> as that's the used by the test cases. Without setting the grant
> version the domains for the tests cannot be created.
>=20
> Fixes: 7379f9e10a ('gnttab: allow setting max version per-domain')
> Reported-by: Andrew Cooper <andrew.cooper3@citrix.com>
> Signed-off-by: Roger Pau Monn=C3=A9 <roger.pau@citrix.com>

Technically
Reviewed-by: Jan Beulich <jbeulich@suse.com>

However, two remarks:

> --- a/tools/tests/resource/test-resource.c
> +++ b/tools/tests/resource/test-resource.c
> @@ -120,6 +120,7 @@ static void test_domain_configurations(void)
>              .create =3D {
>                  .max_vcpus =3D 2,
>                  .max_grant_frames =3D 40,
> +                .grant_opts =3D 1,
>              },
>          },
>          {
> @@ -128,6 +129,7 @@ static void test_domain_configurations(void)
>                  .flags =3D XEN_DOMCTL_CDF_hvm,
>                  .max_vcpus =3D 2,
>                  .max_grant_frames =3D 40,
> +                .grant_opts =3D 1,
>                  .arch =3D {
>                      .emulation_flags =3D XEN_X86_EMU_LAPIC,
>                  },
> @@ -140,6 +142,7 @@ static void test_domain_configurations(void)
>                  .flags =3D XEN_DOMCTL_CDF_hvm | XEN_DOMCTL_CDF_hap,
>                  .max_vcpus =3D 2,
>                  .max_grant_frames =3D 40,
> +                .grant_opts =3D 1,
>              },
>          },
>  #endif

The literal 1-s here are really odd to read already now. It would get
worse if some flags were specified later on and then used here, ending
in e.g.

                .grant_opts =3D XEN_DOMCTL_CDG_feature | 1,

Imo there really ought to be a wrapper macro, such that use sites
will at the same time have documented what this 1 is about:

                .grant_opts =3D XEN_DOMCTL_CDG_version(1),

And then I guess tools/tests/tsx/test-tsx.c needs similar adjustment.

Jan



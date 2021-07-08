Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 193E73C156B
	for <lists+xen-devel@lfdr.de>; Thu,  8 Jul 2021 16:45:12 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.153185.283010 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1m1VGj-0002YQ-QO; Thu, 08 Jul 2021 14:44:49 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 153185.283010; Thu, 08 Jul 2021 14:44:49 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1m1VGj-0002VT-Mi; Thu, 08 Jul 2021 14:44:49 +0000
Received: by outflank-mailman (input) for mailman id 153185;
 Thu, 08 Jul 2021 14:44:48 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=qibP=MA=citrix.com=Andrew.Cooper3@srs-us1.protection.inumbo.net>)
 id 1m1VGi-0002VN-2b
 for xen-devel@lists.xenproject.org; Thu, 08 Jul 2021 14:44:48 +0000
Received: from esa2.hc3370-68.iphmx.com (unknown [216.71.145.153])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id 0a18c13a-dffb-11eb-8589-12813bfff9fa;
 Thu, 08 Jul 2021 14:44:47 +0000 (UTC)
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
X-Inumbo-ID: 0a18c13a-dffb-11eb-8589-12813bfff9fa
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=citrix.com; s=securemail; t=1625755487;
  h=subject:to:cc:references:from:message-id:date:
   in-reply-to:content-transfer-encoding:mime-version;
  bh=VuBRQZuwfmzYd2jyatOEf9/HhhYWaHC9/FW4ECcjKr4=;
  b=WyuDRvCGiS97ZZ14NY9MrT6KJJFauAJtP46GgDCLvgqlVLbL77VgrORd
   CI82eVF3Al3JqGRs3wts2pMGFvziaMig+7N8lKmxp9qj+/qAANEtcwbss
   cAGUa2poEZ5WHjgAdNzHLObC41SGOiLaAVNZbg9A/HTQFgSKxvjbboitt
   U=;
Authentication-Results: esa2.hc3370-68.iphmx.com; dkim=hardfail (body hash did not verify [final]) header.i=@citrix.onmicrosoft.com
IronPort-SDR: fvLg16k/u0ocCACGWwZsL6jfegdqtSdy/QNXVmKRnvunogikkVlrALMf7eZC9xcwEJCXuMF+bb
 aB9Ue4zQkxM4/d+FQSDnGFYj2KNZ3ZBjdWgRB+psqGoG2Prtw2dj3kKq4YVOljneUCx/N+84i8
 SMaXsDmxT48WtpwGeGD12BWEx97Lx65fQqynFspJdW5tbuDXh4w0DU36Zc4im0LNQFvi9o0nns
 KIXprfs3RVzMftKArW8on7wq9856PBZ/YRqbdyfB4IOWqYkk33571QgR+sb465q6KcVkAFk1z6
 2G8=
X-SBRS: None
X-MesageID: 47840050
X-Ironport-Server: esa2.hc3370-68.iphmx.com
X-Remote-IP: 162.221.156.83
X-Policy: $RELAYED
IronPort-HdrOrdr: A9a23:/wYjgKnfIVHfKIbv+v0VWo3GwHzpDfPPimdD5ihNYBxZY6Wkfp
 iV7ZImPH/P+XYssHFJo7C90dq7MDbhHP9OkM0s1NKZNzUO11HYSL2KgbGN/9SCIVyIygc+79
 YGT0EWMrSZZzQUsS+Q2njaLz9U+qjjzEnev5a9854Cd2BXgwwK1WpEIzfeNnczaBhNBJI/Gp
 bZzNFAvSCcdXMeadn+LmUZXsDYzue73a7OUFojPVoK+QOOhTSn5PrRCB6DxCoTVDtJ3PML7X
 XFqQrk/a+u2svLgiM0llWjpKi+quGRh+erN/b8xvT97Q+cxTpAUb4REYFqegpF7t1Hpmxa0e
 Uk6C1QRvibo0mhBl1cJnDWqkvdOOJE0Q6g9bbfuwqUneXpAD09EMZPnoRfb1/Q7Fchpsh11O
 ZR03uerIc/N2KzoM3R3am5a/hRrDvGnZPiq59ts1VPFY8FLLNBp40W+01YVJ8GASLh8YgiVO
 1jFtvV6vpaeU6TKymxhBga/PW8GnAoWhuWSEkLvcKYlzBQgXBi1kMdgMgShG0J+p4xQ4RNo+
 7ELqNrnrdTSdJ+V9MJOA7Ae7rHNoXpe2OxDIu/GyWcKEg3AQOyl3es2sRP2AiDQu108KcP
X-IronPort-AV: E=Sophos;i="5.84,224,1620705600"; 
   d="scan'208";a="47840050"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=Kt8vLc420I3HtW7b4ysn5acSWyxwUxqZQ+tD4xSSLeIawf8dbARLodCL6Qdrvkp1mQt7/OytveckLnrJqkVkT5Hydq77F0JoOgkIx4Nx6ARr8tmAs8twgvu+aw1C9ToYVttZCR6cT4PSBNvhm/QrxUvby9KDOoLgD2oonFP3TiZR6FV23Oi26mgD77AHZkuFQjWebiA/2M3ylamkKHqayphr6GnJza2mxLleexGGggopJpM3TScV4EZxUi/Jidv+X8+c3nVUKxbnkC+L3SnrGcbt0bNfea+fnMAKKWOqbKnaS21ThnZK/JEnsCILatIPRT0yB/+1Wr7c6YEugFaKCQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=qGBhDckLYKwKxdc6dYJ3hX2aWc1DJk6+8Nd6l9Ijz3Y=;
 b=UmL9WDOKN3gasTbPKA3/vTRx+qeqVaO8IzN5ybKjtXej1NeBYwzH3ZxmfF00OGNmu5ywuk7SVDK8vth+sH57Bhs2GpdmJLQgvRyDU9W15g53CfCoykBojKzPoFbX9ERFcN3W1JeZAiteL0vMRFAnxELuggU4rnPKqzn5Mstj+TNmpFfjWhK12oWmVTxxJMoKktf1iBriUIFoYJa0DD8BdAZ3huHbsTQXe2stA2bs1ScRlPZ2aEWrnKoLYqThPlmvF5ryc6/oPLloKSCC9arQRO5VvQm2rv5evo1UMrA5gTxNkvi5CE+CR0Ui4NwiINWs7TLQ/W4GHxMx7TuEI5YT9A==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=citrix.com; dmarc=pass action=none header.from=citrix.com;
 dkim=pass header.d=citrix.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=citrix.onmicrosoft.com; s=selector2-citrix-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=qGBhDckLYKwKxdc6dYJ3hX2aWc1DJk6+8Nd6l9Ijz3Y=;
 b=B23/zKlHnVQUhAs1F7a6/ivySUZ/Vja4Fbhy8GhqLOICA6nVOm2nV4xDpKaAWeY9h6V6oVFgwlEvXu2PPlDvJ0W1ldEr/udyNzGXw3xHgBbCK66oYIKMaKe4LoUtzgg97YtOYeoEn7SdV9YReyTyr6ZLhX3Ou/XY9TZ5jUvJV10=
Subject: Re: [PATCH v1] automation: use zypper dup in tumbleweed dockerfile
To: Olaf Hering <olaf@aepfle.de>
CC: <xen-devel@lists.xenproject.org>, Doug Goldstein <cardoe@cardoe.com>
References: <20210708135704.25626-1-olaf@aepfle.de>
 <0b16fc43-9b5b-1edb-0e21-024bd9cd9708@citrix.com>
 <20210708163352.08da715a.olaf@aepfle.de>
From: Andrew Cooper <andrew.cooper3@citrix.com>
Message-ID: <5710b7ef-5779-6a60-e679-86aced373f4a@citrix.com>
Date: Thu, 8 Jul 2021 15:44:34 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.11.0
In-Reply-To: <20210708163352.08da715a.olaf@aepfle.de>
Content-Type: text/plain; charset=windows-1252
Content-Transfer-Encoding: 8bit
Content-Language: en-GB
X-ClientProxiedBy: LO4P123CA0482.GBRP123.PROD.OUTLOOK.COM
 (2603:10a6:600:1a8::19) To BYAPR03MB3623.namprd03.prod.outlook.com
 (2603:10b6:a02:aa::12)
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: bc3cbd0e-365e-48b0-a158-08d9421eeaa4
X-MS-TrafficTypeDiagnostic: BY5PR03MB5345:
X-Microsoft-Antispam-PRVS: <BY5PR03MB53452AC555D50D42D4A5AF3FBA199@BY5PR03MB5345.namprd03.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:1284;
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: PP3ir9F6a/b+Y+GDHNww9Lz8OprcO/DfawALzKaN2hWRuw77boXh4FQuZF9Uo4CsgL/Yx8R08oAmY5t5Qyyss3yAjZMk2qap9SmL9XTjnlMKBxM4jLcTlD2x7M+G/omotyZWhvBFYqcbTaoJyA+4a+KFbhtBsbLYIlTQXcuqQ796HG5PYbe8JjDGdQhj7yX4mF/7x14vFa2N1/Z7t/uLR/FBRcGtA5FnSI+2JgbTDxtLlLViEyDZcL1ChL4XvLkAQyEpOzcDY8jAWshcMOq2a4f/nRO3SG/0d9pezChVTgDPxQL2V/sXuNHbQJvxZH+KYkk8Fp6WG4ri2QaAbQR9b1FgmZBr10jeTEBteGdCCYCaHVErUsh4KjzAZbYQitlThDgZog3sRDkRsYChAP1+h/tv2GN9EzyIxcuUAW1SoQsRl5mPeDf3oiPZPxxQS53otlqU1FqaJEISFogOET3HotSYu+nsjSImUseqkfXgEMXOY1UsyCJXDtkWxqlnmYLRHuf1OplBTMWh5G2CIwYciAbxEq3ec1UaNs9dY0KphfS0+noAMLIKJaEu7Z5cjckabKSyDf/mTmsQm1Bg2lQs1xoCZ5B1ca0PdkZY8OUKvP2RDNGT+bO261bTgtUP8tlYwFewEVbdAs0Qk8j0nJmYsAyfrzCz5E498i5PEI7ju+yQghl+jqxjFy8VzJ8j4UHZGUatenl1Hsy7s+SMUqMYb+kWic2B9MGpNKIbDisC1og=
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:BYAPR03MB3623.namprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(4636009)(346002)(396003)(136003)(39860400002)(366004)(376002)(83380400001)(36756003)(6666004)(6486002)(66556008)(4326008)(86362001)(31696002)(66476007)(31686004)(16576012)(66946007)(316002)(6916009)(38100700002)(4744005)(5660300002)(8936002)(478600001)(26005)(2906002)(8676002)(186003)(2616005)(956004)(53546011)(45980500001)(43740500002);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?Windows-1252?Q?GXJMAKhW42qHhKTgfyHgLwuSsMSuE5tBjvsLKsiJYSOLOwmrLpMfLNM5?=
 =?Windows-1252?Q?REbCNHk2Yq4ZQyaIFXTh4W0XuGV0v+Q5tQntlsvinQWvmFMeur08WMw+?=
 =?Windows-1252?Q?d1f5x+vYEBYUGsvebvE4rryFZeLc6lFA1mGg43+xaXr61U+xsdeQ2ERv?=
 =?Windows-1252?Q?4iG+9l0sXqFBXmh4MKUczqklHhbzvRrIJ65x7yw+fKW41F2KY1njjr39?=
 =?Windows-1252?Q?EtAWUTCzcWgaoHOFeNzlRa3/DWrMlcgXxGGfaUpIt7NnkZQouVj+lU0d?=
 =?Windows-1252?Q?B0yM/PXNHssp/DvsifMu1a+akHnRGJOrkAqWY/+QxpT0unZjDC2jbvHb?=
 =?Windows-1252?Q?9T4Ld9+DlFydhcTX9ogSMQyCzOIIAPeyqmn9IyU253ZMEPlOVh7Hf1Aj?=
 =?Windows-1252?Q?S0o6LMxBsDXe9l6UWFJzjV5ey8jH11WZ5ND22V1pVQbmlxzGasvdu3Hf?=
 =?Windows-1252?Q?JPgypOIjv1it0fBM7OCTPX8zNu4TJkE04Dq5NVFe9PcAVHgkaT4/nKzC?=
 =?Windows-1252?Q?TKtPh700iuGHoa7bxfbnUh1lJwcaBIVTfsKkLADvymFLgoZe9ZNx7ZSY?=
 =?Windows-1252?Q?E88F7qZfHdgEIYQrCnPgYP3wouaV0MI5ZJYRsC5B48/GBY6TCjAQj2C7?=
 =?Windows-1252?Q?swNHw8M98KjQQ5BA0EF5NjBCu/OkGKrZOdcKBO9fW4Ubu/7jNgkXPoXf?=
 =?Windows-1252?Q?CBbx/ZhH8tpJwprRnTuXhgjQOy9jszLLsMmoJevTAMXuTqpWWeNy5c7U?=
 =?Windows-1252?Q?VmyURfhiRaeNJT6Fv5pQEcOg+4rleRPkRk1PpoKE6WyJpdIiSahk0mYq?=
 =?Windows-1252?Q?XYKzdmSxaDjB4y2u7msVz+QA8uq1zt+kTzXDaXC5eSiJ8lebv+9q9jmW?=
 =?Windows-1252?Q?x/+i8oEj3zxle97cMsUlYKTtOZ6o3nmUjULHpPOAJ0x/usIx0tL3HjbA?=
 =?Windows-1252?Q?pmax0K4T2dGbEjmJUzm+/hpsetODpSViRXtwZSimRhGdI+MnDmj1mWEK?=
 =?Windows-1252?Q?xJx7JAZyyg8CHd6ilNQXcgjVu83zpoWCKg9w+Oru6cCfRIzKaU3i6MA2?=
 =?Windows-1252?Q?RRgQob5U+4aPmFWJciSjwV8+ROYoe/1OJ2NRisCq9zsfT4ji1Ol81xWy?=
 =?Windows-1252?Q?HJGdlMlj8GwLLQSofSaY6d2p/RcwJHcFK6GWS18FYm8yspTdXQh+lLn4?=
 =?Windows-1252?Q?qZgQGLZ11c3NeM5/ieDERBCCxlcud7+g+En/D5pfuHTsoBzkGkWMb54m?=
 =?Windows-1252?Q?/XEgCEjq4CQsLptEfJkFZsiELmeclwgc6RlDDsfd6obP3fVSj1oSxpZi?=
 =?Windows-1252?Q?ENCxTsFYEN9hQzkBE7ocLNybYkDKl5bGWozdTwhjEIadnV8A/CbEtn0g?=
 =?Windows-1252?Q?muZ98macXLIe7SPwqCj7GIql4bhEfhV1s3J1NAf/ExmfplbdUWiz0Mpp?=
X-MS-Exchange-CrossTenant-Network-Message-Id: bc3cbd0e-365e-48b0-a158-08d9421eeaa4
X-MS-Exchange-CrossTenant-AuthSource: BYAPR03MB3623.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 08 Jul 2021 14:44:40.4034
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 335836de-42ef-43a2-b145-348c2ee9ca5b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: jUkK7mGrpxISDy9v10ex+eVG2Cj4R7jHr4jONVaTRQRK4JGpkinDzEmTZiA/0prO7K3gRa3V5zTs6pWlTFAkOh6Fmr189oU4bIYvlnSEv6g=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BY5PR03MB5345
X-OriginatorOrg: citrix.com

On 08/07/2021 15:33, Olaf Hering wrote:
> Am Thu, 8 Jul 2021 15:30:09 +0100
> schrieb Andrew Cooper <andrew.cooper3@citrix.com>:
>
>> Have you rebuilt with this change in place, or shall I do that after
>> committing?
> The current image has the latest snapshot 20210706, so today it has no effect.
>
> I'm testing this new build and will update the README before pushing an update.

Ok.  I won't commit this patch yet.

Please include it in a series of any/all changes to the tumbleweed
container, so we can commit all patches around the same time that we
update the live containers.

~Andrew


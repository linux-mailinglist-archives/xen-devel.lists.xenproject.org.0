Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 5E365372BD7
	for <lists+xen-devel@lfdr.de>; Tue,  4 May 2021 16:17:58 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.122482.231033 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1ldvri-0000dK-Tv; Tue, 04 May 2021 14:17:34 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 122482.231033; Tue, 04 May 2021 14:17:34 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1ldvri-0000cv-QQ; Tue, 04 May 2021 14:17:34 +0000
Received: by outflank-mailman (input) for mailman id 122482;
 Tue, 04 May 2021 14:17:32 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=6Poa=J7=citrix.com=andrew.cooper3@srs-us1.protection.inumbo.net>)
 id 1ldvrg-0000cq-J8
 for xen-devel@lists.xenproject.org; Tue, 04 May 2021 14:17:32 +0000
Received: from esa2.hc3370-68.iphmx.com (unknown [216.71.145.153])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id b7f01392-f16a-42c5-b0b6-22756509218c;
 Tue, 04 May 2021 14:17:31 +0000 (UTC)
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
X-Inumbo-ID: b7f01392-f16a-42c5-b0b6-22756509218c
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=citrix.com; s=securemail; t=1620137851;
  h=to:cc:references:from:subject:message-id:date:
   in-reply-to:content-transfer-encoding:mime-version;
  bh=eufgxCqONvYW1r7dAxyrmXvPvv9Cmpg2WSksENOOIto=;
  b=G0ToPfZy/HkD79rWflTPfzk0Nmx1RbTHK4/y9Nv7x7Fo9O+3hCLdXRZZ
   ImukAqBSQlZCgIwN7mysa9ItEclLBxqmiiRi36q6QdE2vBhi92bAe4bys
   eQq5q8Fk4iL/sVOuRJynBT/zpqxd1+NBtNFHGG4XeyoYI6wl4Xo8NEYMF
   M=;
Authentication-Results: esa2.hc3370-68.iphmx.com; dkim=pass (signature verified) header.i=@citrix.onmicrosoft.com
IronPort-SDR: WBvaaw+LXMbsgqQbNUgK1df1bOn16qpilUW5gYi1En30fu7vHmoyvtr3jbEFOSFCQZuO52Zg6w
 f4DhnxtS7eZfzK2QEhvXWoNRlgfG9mtYaF8DPjcd1SrlJUhvluXZX51d8eO1KlF7gFYNjlaCoi
 2VLDvqOzQ2d9q7V7QpdzOb1cgyb0qCqvhEpf86UHraX68Ffi2EPDZEGcWG9e0eunhf8fDb/kXI
 V2/tE/joYDj0+GCt8Fy1VqY/VUZjRKOwtJFPncHsIPst0DA8PNWNkuirJbb1rPMS1rMfoJYPCC
 UaU=
X-SBRS: 5.1
X-MesageID: 43021780
X-Ironport-Server: esa2.hc3370-68.iphmx.com
X-Remote-IP: 162.221.158.21
X-Policy: $RELAYED
IronPort-HdrOrdr: A9a23:ykpRyqNAs+vFgsBcT27w55DYdL4zR+YMi2QD/3taDTRIb82VkN
 2vlvwH1RnyzA0cQm0khMroAse9aFvm39pQ7ZMKNbmvGDPntmyhMZ144eLZrAHIMxbVstRQ3a
 IIScRDIfXtEFl3itv76gGkE9AmhOKK6rysmP229RdQZCtBApsQiztRIACdD0FwWU1iDZ02CJ
 KT6qN81kSdUF4Qadm2AWRAYvPKoMfFmImjTRkNARMm7wfmt0LW1JfRFR+E0hACFw5e2LtKyx
 m4ryXVxIWG98u6xBjVynPJ4/1t+efJ59NfCKW3+7MoAxr2jALAXvUGZ5Sju3QPrPir+BIWlr
 D30modFuBSz1+UQW2vuxvq3GDboUQTwlvv00WRj3emgeGRfkNDN+N7iYhUcgTU5iMb1bkWus
 87vBP6xu5qJCjNkyjn69/DWwsCrDvSnVMYnfMOlHsaaIMCadZq3P8i1XlIG5QNFj+S0vFfLM
 BSCqjnlZNrWG+BY2uclmdix8HEZAVIIj62BmIGusCTzgFMmmF4w0Yy1KUk7wc93aN4ZJ9e6+
 veNKN00JlIU88NdKp4QNwMWM2tFwX2MFzxGVPXBW6iOLAMOnrLpZKyyLIp5NuycJhN6Jcpgp
 zOXH5RqGZaQTOuNeS+mLlwtjzdSmS0WjrgjutE4YJih7H6TL33dQWeVVEHiaKb0rciK/yef8
 z2FINdAvflI2erM51OxRfCV55bLmRbeNEJu+w8R0mFrqvwW87Xn92eVMyWCKvmED4iVG+6KG
 AERiLPKMJJ6V3udWT/hDTXRnPxam3y9Z99C8Hhjqwu4blIErcJnhkeiFy/6M3OAyZFqLYKcE
 x3J66isq7TnxjwwU/4q0FSfjZNBEdc57vtF1lQoxURDk/yebEf//GWeWVY2mq7NgZyJvmmVj
 J3lhBSw+aaPpaQzSctB5aMKWSBlUYeo3qMUtM6lrCc49zmPrc1FIwvVqA0NQijLW00pS9a7E
 N4LCMUTE7WET3jzY+/ioYPOe3Zf95gxCGxIcBVrnrbnV6Gpd4mQ0YaWzLGa7/TvS8eAx5vwn
 Fh+a4Wh7SN3Ry1L3Ekveg+OFpQLFiMDKl+FwSDboVMkrXNcAV9JF363ACyulUWQC7H5k8Sjm
 vuIWmxdevQClRQgHxez53n6Uh5bGmbYkJ2ZE1rqIEVLxWyhl9DlcuwIoaj2WqYbVUPhtsQNz
 zIehM+CAJjzdLf7m/ZpB+yUVEdgrk+NO3UC7ouN4zJ0nS2MYuSiOUtBPlP5qtoM9jor84GWe
 +SYBWuMTv9Eu8lsjbl/koNCW1Rkj0JgPno0Brq4CyEx3Y5G+PVO0kjaLcBId2QhlKUD8qg4d
 Fct5YSsuSxOGmqNYLD5qHTcjJZKhTc5USxVPolrJhIvaQ08Jt/dqOrJwfg5TVi5lEZKsyxqW
 Y1BIJcy5rFMpV0f8MTdzlCl2BZ3uinHQ8OiEjOHuQ6fVsRlHfVMNOC3qrQpdMUczq8jTq1HW
 PazjZU8PjEVRaSzLI2C6o/JmJNdUg3gU4Std+qRsn1CA+wcftE80f/GnihcKVFQKztI8Rdkj
 9Kp/WJlfSQbSz2xUT5uiZ6OLtH9yKCTdmpCAyBXc5O/NrSAyXCvoKapOqyhizwUz21dgAxgp
 BEb1UZaoB7sQYZ5bdHmRSae+jQuUIqk1xX/DFhmBrM4+GdkRbmNHADFxbYjJVQVSRUKV6Sg6
 3+gLOl6Eg=
X-IronPort-AV: E=Sophos;i="5.82,272,1613451600"; 
   d="scan'208";a="43021780"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=clnQt8P5nvnK1+aC5eiQSc6I+BaRQYkd6HoO+pIyvYWzlDjKT/CgcZloMVlHYVcZLGBgUWCmAymweK31xnl+t24+6BHe5b8D8ABLGgK577Daf6SYuJZ9/PQEPKWxi0L431dug7kDcE2UQrYn8G1a4/Ulw2mkJNS6T50EHVQMBJpLICdNVf+m8VPm6iUzd8USnH5bzL7Njd1STYsk3M2KgPufzFsidiHGmGOtPVE64yngeTPvRrfhNTkOato8FRlGNZt9/3QcdUVgoTIaPexcb2ydal/SdPVQ40xH6/LJMz5q2KvwCGIZ25TE6hk9HEJtoAPJAikYRvpvjK5isHCP3Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=0IzHNUnHkHRN05OTXJBVEIrofGBAQ94N1TE62xdLd3k=;
 b=Y6xsKFJJflhHmWVzxX32W61NjJ7Rl+Y88bnjSAIQU4YGgYcoEwrdHRWwrqd9HxeqrV+pvjmRvj9S0XD2Z8PlMEcQwLwCZ119vX5MUwsUkPUouPp0e0DSstQ8k07b7K1qFdqST6gHZ4KWNDAVFMUmjW4gJ2GE6YeJ3fiO/bY+LMwOGfZpXIu0/Of0EAk/mo+Wja97nZfsTBBCzIPvSCY3hYycNwxBgHY41csPImEBj2Z/kVnNzcqcwQ6+fOmoHk0d7Txw8/8DVWiUX4AL9Y6ZUjXlKtpiAPmeGA57JizdyQ++DttviGNwOhun2T90S5vGw62E6bVwPAsggGjS9Ds3xA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=citrix.com; dmarc=pass action=none header.from=citrix.com;
 dkim=pass header.d=citrix.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=citrix.onmicrosoft.com; s=selector2-citrix-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=0IzHNUnHkHRN05OTXJBVEIrofGBAQ94N1TE62xdLd3k=;
 b=hJumQfsPpscaZxP0InR2EFo02wVGn51uEk5zMeDF/ZIEPYQzVu0WyBJZbUP8OEoFYsRM8MXL5D/TdPyUiLjC8KOXdx3JvNSoge1cY1NQqD8HDHmNW/1sEOauroA0YEGw2wpaPjqhXjg15gj0M+aEAmIKV2aahUI7EquZgcgQCiU=
To: Jan Beulich <jbeulich@suse.com>
CC: =?UTF-8?Q?Roger_Pau_Monn=c3=a9?= <roger.pau@citrix.com>, Wei Liu
	<wl@xen.org>, Xen-devel <xen-devel@lists.xenproject.org>
References: <20210503153938.14109-1-andrew.cooper3@citrix.com>
 <20210503153938.14109-6-andrew.cooper3@citrix.com>
 <5e6511ca-83bd-8a43-202e-949b4d19b1ab@suse.com>
From: Andrew Cooper <andrew.cooper3@citrix.com>
Subject: Re: [PATCH 5/5] x86/cpuid: Fix handling of xsave dynamic leaves
Message-ID: <1279476a-f99d-59a4-7fed-1aee37dbe204@citrix.com>
Date: Tue, 4 May 2021 15:17:10 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.8.1
In-Reply-To: <5e6511ca-83bd-8a43-202e-949b4d19b1ab@suse.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Content-Language: en-GB
X-ClientProxiedBy: LO4P123CA0002.GBRP123.PROD.OUTLOOK.COM
 (2603:10a6:600:150::7) To BYAPR03MB3623.namprd03.prod.outlook.com
 (2603:10b6:a02:aa::12)
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 9c95041f-901f-4f06-043b-08d90f075259
X-MS-TrafficTypeDiagnostic: BYAPR03MB4119:
X-MS-Exchange-Transport-Forked: True
X-Microsoft-Antispam-PRVS: <BYAPR03MB4119823AA5CA3565ABFA230FBA5A9@BYAPR03MB4119.namprd03.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:9508;
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: TJ1z5gqvc8JW4MYDWHr3cWLWb2jPUaOXZPaHqNvE3sIhRgaY/Y/qJCnzVwRikMLx2f5/0/GgXbddmNp4hfYG6qqCl/3EyilS5/xrZsR2H9wgQJtipgXoBIcOeLsPY8q7MXstAJWrGcDaKMaaCn2Fzs2/AMAEok0q1xmWInUrcEaK7mxZ707DkVyhoMQ/SkaxtJSMz4a3SbQyBWd4KeqiasGjJUDbn5d/Mp4LVtWQCTyuo57BeDxYxz8fUorkcqGmZVF5SMVdB9yRS03PZJ1HZGYets6ZGyXl+7m80ZLgXcVrbcXTFO06XxIVaARyvhtspXS7H47y2qe4Pr+h5cB5tlbG4WE0j68Qdw8hgWdskEsn2WDruHbJ/ymXzBIJh7WJjEHPfofCF6AhjpJZFiohKlQgl3b3WtxKaOJZJB0MJd0MEpiPmcEZbmsRMxxMoPkr4JMN/B0qZ8MONA8+3Xa3WU/As3bZUiFe/qTm8nhU2orsvuFXftFkoBBbXdPsJl0dlh3prQtOtofHYqTDQ8hBae8qtHZkoWOz8HDghva31h3CE0kfAhCQBu5X8+6cPUyS+sUy/jJkbcw6xJdf0erqehQpL+tAkhc9pxfm2iS7Ypnt59c2VQP0KTW8EEI1vly7zmoVVkhzTB6eeTcgBqD5Tlxs8ZM0KbAeHqJb97Y/oULDY4ts4O3YviZ7T39fuaaJ
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:BYAPR03MB3623.namprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(4636009)(346002)(396003)(366004)(136003)(376002)(39860400002)(956004)(2616005)(31696002)(6666004)(31686004)(26005)(6916009)(66946007)(66556008)(6486002)(83380400001)(86362001)(66476007)(8676002)(478600001)(316002)(54906003)(16576012)(2906002)(8936002)(53546011)(16526019)(186003)(38100700002)(4326008)(36756003)(5660300002)(43740500002)(45980500001);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData: =?utf-8?B?QUdQSVpXZWEwRmxDaUVPM1YzaWxEdmNpRGhySCsyR09nMy80UDlyL0xRQ2dj?=
 =?utf-8?B?Rlk2T1BOZi8zakhHQzN4eEhvTWxtQXc3bWhMRUZ4MWhia3BVSTZYd0MyNXI2?=
 =?utf-8?B?czQrQVViUFZoRmJrK1B5bGg2cjRUY1ZmNGlDNGVINmkrWFZTbmo5RWJVeStU?=
 =?utf-8?B?RmpLeHZrS3QyOW55Sk9SR3ZIRmdidFpoWDQya1N5WFd0T2hUUEZVRHBKeHA4?=
 =?utf-8?B?Z3FLVDliaDdHVnZiWUpBUHhqKzV2eUtTWm9PNU5yR1lNYVkwUzZDOEwvV1hu?=
 =?utf-8?B?aUZDSmtQWUI0ZGFWVTlnVXA3TWF6anFFeTUwMnJXWHJhb1JFZ0t4aUlwQlZE?=
 =?utf-8?B?Wkd0eUFzQVhvZSs4dmlpMjNKOEJUWUtGSzk0WlIrdUhzSjZ1eTNsQVVqMElh?=
 =?utf-8?B?VGt2U0h3bEVhL1Bubm1qaE54TW5lQ1Q3OUdLekM2R0JyOXhYU2xlL3RvdEFs?=
 =?utf-8?B?N3pQam5oRTlSTHlNdndRdlBmR3hOZXJUVVBMQ09NcHZVSVlQRG52Ums3NVFL?=
 =?utf-8?B?RVNsSlFVY1FudXJhL1VJNkY3dkF2bHh4eW1rVTl4ZHVUaEJGajI2ZWR5OWtB?=
 =?utf-8?B?L2EwMlA3bUY5dUhGTGtqQ2Jnd044TGlEU0I3aGVWUzRDYnlGcENLUXRENEho?=
 =?utf-8?B?c21jZ3pMdVJscFVwclZlTmIyV0wrdGc4S3VKdEV2SDFWSzhEUHBaNDd5VmRm?=
 =?utf-8?B?SkVOV3BqVmkyL3RUNEUrWDFxODl4NFZwQnlTZjJGcFVZV083NXduZStOUUJ3?=
 =?utf-8?B?WlhBaWt1NTV1Q01LdUtuTW5hWjVCaEpEUDFWcVRiNzZTTHd0cWl0M3p5OC92?=
 =?utf-8?B?cmhFOWlMbnV5VG45WmJsS3RUdVdhSlZlRmRXNldsRFEveDcreEtRL3o3VkRZ?=
 =?utf-8?B?K3hKR1piMXV3azBXL0JCODRNUWtGZnRIZmFsdHZYUVoxcWZScllhbHEyOHUz?=
 =?utf-8?B?bEtodEtVQmZXYjFUdVRyM1pGRkVzcG5VckR5TkNDdHpWOXMyVlI4VFk1eHht?=
 =?utf-8?B?V1A0Rk9Kdk1mRGE0c3BIY2o5STEzUURmTUlTNFkxV2RqUnhUeFpyTmxveUl5?=
 =?utf-8?B?NGRiNjlDWS9yb3dNZklBcWo0MU1SczFmOEc0YkFwUTBnS21nL3ZJMThuL1dN?=
 =?utf-8?B?bTNWS3FOdkRWQVo0cFV2RHRjN2J1VlRWWEYzWUNCbHZmNTNlNC9tQUVMMTBU?=
 =?utf-8?B?VnhqWnhTcHFUdGQ2QkJBNWpFNlAyd3BUZU95YS9Sd3k3bjZSODBtVHZMRkJj?=
 =?utf-8?B?NnpLdjhoTEE4QlEra2tYd3BUbTVlbzMzUXdLOVc4N2ZLaDRmaktIUURWNHFp?=
 =?utf-8?B?KzFUenJmT3I1M1ByYSt3QUlaWDVkZEQ1cXl2SU9UNkFWRlptaVdaRDdQeXhG?=
 =?utf-8?B?akQxMm83dlEzem8vUi9LS3F1WnFoSkxOQXNhUjdqckdnd0RFZEd5VWdlQnpP?=
 =?utf-8?B?UmNRbXRHL1VMN1llQUFTeGxmeExubG9ZQ0dqeFZkbmtsS1p6cmtZS3Uybjl5?=
 =?utf-8?B?RUdRcThpTmdXZzFUWExvZU55RkFBLzBueHgrOEt4cE9oVzA5NkVTNzBKcm9z?=
 =?utf-8?B?YnVhczloZ2IxelpvRzVHRlBYRmEvYm0xVFZ6NHh2dzQrOHZMdWpWbExaN2po?=
 =?utf-8?B?RXR0SzExTldBUkUzWXF0RU1vZEZqSU5FRXdKdXhsM1pCcFRoa3NyanNHSktS?=
 =?utf-8?B?THJmNTNUdGIrL1dweXJYWHA2dUtoeUhvNTNtUE80aHZ0ZTFPVFl4SER6ang2?=
 =?utf-8?Q?GZQ04AFQV0ZJfmLRPkLCqqTQuvO636YIPfhdL3q?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 9c95041f-901f-4f06-043b-08d90f075259
X-MS-Exchange-CrossTenant-AuthSource: BYAPR03MB3623.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 04 May 2021 14:17:17.1458
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 335836de-42ef-43a2-b145-348c2ee9ca5b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 8hn4P1ia/iBlCjpfNC78qmYsbCH6XXUggQN1JMvmndW9z7ePGn/bKyaVw3LwXvRztC1gyKM7WZQyMFiUfhRj0tCo2s7ERQzTck+65cw/j1c=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BYAPR03MB4119
X-OriginatorOrg: citrix.com

On 04/05/2021 13:56, Jan Beulich wrote:
> On 03.05.2021 17:39, Andrew Cooper wrote:
>> If max leaf is greater than 0xd but xsave not available to the guest, th=
en the
>> current XSAVE size should not be filled in.  This is a latent bug for no=
w as
>> the guest max leaf is 0xd, but will become problematic in the future.
>>
>> The comment concerning XSS state is wrong.  VT-x doesn't manage host/gue=
st
>> state automatically, but there is provision for "host only" bits to be s=
et, so
>> the implications are still accurate.
>>
>> Introduce {xstate,hw}_compressed_size() helpers to mirror the uncompress=
ed
>> ones.
>>
>> Signed-off-by: Andrew Cooper <andrew.cooper3@citrix.com>
> Reviewed-by: Jan Beulich <jbeulich@suse.com>
> albeit with a remark:
>
>> +unsigned int xstate_compressed_size(uint64_t xstates)
>> +{
>> +    unsigned int i, size =3D XSTATE_AREA_MIN_SIZE;
>> +
>> +    xstates &=3D ~XSTATE_FP_SSE;
>> +    for_each_set_bit ( i, &xstates, 63 )
>> +    {
>> +        if ( test_bit(i, &xstate_align) )
>> +            size =3D ROUNDUP(size, 64);
>> +
>> +        size +=3D xstate_sizes[i];
>> +    }
>> +
>> +    /* In debug builds, cross-check our calculation with hardware. */
>> +    if ( IS_ENABLED(CONFIG_DEBUG) )
>> +    {
>> +        unsigned int hwsize;
>> +
>> +        xstates |=3D XSTATE_FP_SSE;
>> +        hwsize =3D hw_compressed_size(xstates);
>> +
>> +        if ( size !=3D hwsize )
>> +            printk_once(XENLOG_ERR "%s(%#"PRIx64") size %#x !=3D hwsize=
 %#x\n",
>> +                        __func__, xstates, size, hwsize);
>> +        size =3D hwsize;
> To be honest, already on the earlier patch I was wondering whether
> it does any good to override size here: That'll lead to different
> behavior on debug vs release builds. If the log message is not
> paid attention to, we'd then end up with longer term breakage.

Well - our options are pass hardware size, or BUG(), because getting
this wrong will cause memory corruption.

The BUG() option is a total pain when developing new support - the first
version of this patch did use BUG(), but after hitting it 4 times in a
row (caused by issues with constants elsewhere), I decided against it.

If we had something which was a mix between WARN_ONCE() and a proper
printk() explaining what was going on, then I would have used that.=C2=A0
Maybe it's time to introduce one...

~Andrew



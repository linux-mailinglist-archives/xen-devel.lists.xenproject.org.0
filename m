Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id A8E92372DED
	for <lists+xen-devel@lfdr.de>; Tue,  4 May 2021 18:20:22 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.122571.231180 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1ldxmC-0004nP-2H; Tue, 04 May 2021 16:20:00 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 122571.231180; Tue, 04 May 2021 16:20:00 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1ldxmB-0004n0-Ux; Tue, 04 May 2021 16:19:59 +0000
Received: by outflank-mailman (input) for mailman id 122571;
 Tue, 04 May 2021 16:19:58 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=6Poa=J7=citrix.com=andrew.cooper3@srs-us1.protection.inumbo.net>)
 id 1ldxmA-0004mv-Nl
 for xen-devel@lists.xenproject.org; Tue, 04 May 2021 16:19:58 +0000
Received: from esa1.hc3370-68.iphmx.com (unknown [216.71.145.142])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id 7f1b0039-b9c3-453c-8fa5-358e2f2ac074;
 Tue, 04 May 2021 16:19:57 +0000 (UTC)
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
X-Inumbo-ID: 7f1b0039-b9c3-453c-8fa5-358e2f2ac074
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=citrix.com; s=securemail; t=1620145196;
  h=subject:to:cc:references:from:message-id:date:
   in-reply-to:content-transfer-encoding:mime-version;
  bh=BIkzgdykgN6KNEdoNvYGFZ3/LhxyiUpca/MzS//CAx0=;
  b=ahT4cWifR+uCfDPyC5UHPzceSXT/dUGnybcJvZtrCqZ6R93fj1SmqyZT
   ZW19b/+o0bajNZdHOxGAILsTKN7TrMD1rRnaeZzGgdFoi7z8rit+CqmlK
   DAqSlEJrOjyt+1gCFYVDAiJHYe1AqDzB3OOY/V7mNvOvhUYR1jHxAN3Aj
   I=;
Authentication-Results: esa1.hc3370-68.iphmx.com; dkim=pass (signature verified) header.i=@citrix.onmicrosoft.com
IronPort-SDR: PnwDQxP6IdHsw/WOOnZZeVx/hIw0IRsf8VhjgsJzyqGKUy3rZ8Wvl0ajzjMGAHwxaKZamLVKRD
 2ge9Te77qJXTb0RdGLpj7VWRx0EfUFLyxjk9/RuoHwaFfyIEQQsPQGjbIu6X69K0+3Bw4+Xykj
 j9TifLh2EUGbA6SuyGbWMWhydOJ+QfZ/8wLAyJxGSjhefIT7vo2gdwAIn81WZPVJpqY6NHjCXD
 GfA1zie/CdF82bXHjIwekUiqeEnX/VWRAnGQHAfhjp0xN0bd1RNyVyoKkD/0is1SdHcWQtBy3P
 9hg=
X-SBRS: 5.1
X-MesageID: 43429236
X-Ironport-Server: esa1.hc3370-68.iphmx.com
X-Remote-IP: 162.221.158.21
X-Policy: $RELAYED
IronPort-HdrOrdr: A9a23:JYtDOqHE4GsZgAX9pLqFRZTXdLJzesId70hD6mlYcjYQWtCEls
 yogfQQ3QL1jjFUY307hdWcIsC7Lk/03aVepa0cJ62rUgWjgmunK4l+8ZDvqgeNJwTXzcQY76
 tpdsFFZeHYJURmjMr8/QmzG8shxt7Cy6yzmeLC1R5WLD1CQYsI1XYcNi+wFEpqSA5aQb8wE5
 SB7sRKzgDQBkg/RMK9G3UDQqz/vNXNjp3relorABQg5QmIg1qTmcLHOjKf2QoTVC4K/Kc6/Q
 H+4nHEz4iAk9X+8B/T0GfP849b8eGO9vJvDNGB4/JlUgnEpR2vYO1aKtu/lRAz5Nqi8VM71O
 TLyi1QRfhbz1P0UiWLrQD22w/muQxemEPK7VODm3PsrYjYaVsBerN8rLlUeBfY9EYs1esUuM
 kgvxP7xu9qJCjNkyjn69/DWwsCrDvSnVMYnfMOlHsaaIMCadZq3Pwi1XlIG5QNFj+S0vFELM
 BSCqjnlZNrWG+BY2uclmdix8HEZAVJIj62BmIGusCTzgFMmmF4w0Yy1KUk7wY93aN4ZJ9e6+
 veNKN00JlIU88NdKp4QNwMWM2tFwX2MF3xGVPXBW6iOLAMOnrLpZKyyLIp5NuycJhN6Jcpgp
 zOXH5RqGZaQTOhNeS+mLlwtjzdSmS0WjrgjutE4YJih7H6TL33dQWeVVEHiaKb0rYiK/yef8
 z2FINdAvflI2erM51OxRfCV55bLmRbeNEJu+w8R0mFrqvwW83Xn92eVMyWCKvmED4iVG+6KG
 AERiLPKMJJ6V3udWT/hDTXRnPxam3y9Z99C8Hhjq0u4blIErcJnhkeiFy/6M3OAyZFqLYKcE
 x3J66isq7TnxjzwU/4q0FSfjZNBEdc57vtF1lQoxURDk/yebEf//GWeWVY2mq7NgZyJvmmVz
 J3lhBSw+aaPpaQzSctB5aMKWSBlUYeo3qMUtM6lrCc49zmPrc1FIwvVqA0NQijLW01pS9a7E
 N4LCMUTE7WET3jzY+/ioYPOe3Zf95gxCGxIcBVrnrbnV6Gpd4mQ0YaWzLGa7/UvS8eAx5vwn
 Fh+a4Wh7SN3Ry1L3Ekveg+OFpQLFiMDKl+FwSDboVMkrXNcAV9JF36wwCyulUWQC7H5k8Sjm
 vuIWmxdevQClRQgHxez53n6Uh5bGmbYkJ2ZE1rqIEVLxW1hl9DlcuwIoaj2WqYbVUPhtsQNz
 zIehM+CAJjzdLf7m/epB+yUVEdgrk+NO3UC7ouN4zJ0nS2MYuSiOUtBPlP5qtoM9jor84GWe
 +SYBWuMTv9Eu8lsjbl/0oNCW1Rkj0JgPno0Brq4CyEx3Y5G+PVO0kjaLcBId2QhlKUDsqg4d
 Fct5YSsuSxOGmqNYLD5qHTcjJZKhTc5USxVPolrJhIvaQ08Jt/dqOrJgfg5TVi5lEZKsyxqW
 Y1BIJcy5rFMpV0f8MTdzlCl2BZ3+inHQ8OiEjOHuQ6fVsRlHfVMNOC3qrQpdMUczm8jTq1HW
 PazjZU8PjEVRaSzLI2C6o/JmJNdUg3gU4Sit+qRsn1CA+wcftE80f/GnihcKVFQKztI8Rckj
 9Kp/WJlfSQbSz2xUT5uiZ6OLtH9yKCTdmpCAyBXc5O/NrSAyXBvoKapOqyhizwUz21dgAxgp
 BEb1UZaoB7sQYZ5bdHmhSae+jQuUIqk1xX/DFhmBrM4+GdkRnmNHADFxbYjJVQVSRUKV6Sg6
 3+gLCl6Eg=
X-IronPort-AV: E=Sophos;i="5.82,272,1613451600"; 
   d="scan'208";a="43429236"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=LahPVBJpnDbJSPWfT+9utm83ucTk9Qw1aKOt0LTHw98XH0kjfaiAql4X63u0QYbOyF90H1Eo8EpXQmQ/I665Ok8yv5OBl9C2o3MCZAh2JKJYcfvz3U3E4hOuKpqaDDpsG0xRfJPIvPGy8oiSKvzrQpdi1/djNTgCfJd8cK13ZNo0NaEuXGSWdQdf+0qOVq8lYptVwov2vxMf/TRlBmvmGn3RRvZuh72eYy3yi0hx9UEI86em53waq6JAEY2B9hRo8TEQvKVQCBPVB9/rNJxcIqkTzFmDFwTdsVrDSvM9wfq9E5GJ40mApgmBWglgnRYGrlwV1pTLyun4Wa4TEbdf4Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=BIkzgdykgN6KNEdoNvYGFZ3/LhxyiUpca/MzS//CAx0=;
 b=Maa0TnGCKSiHlJoTBUYUYydoCbftzepColWpL+6y7A3jwSfwHBXgrPce++1Tko4L1TZOofHUQF3uw3/5fjVdrb5gIZQcHj8/pqFuPFbRfZNJjcLrTkrcY16cD82H4xdWYNkO9TxynAOne673ljlgdpS86mbU+HS0YJvXfgz7N6r9n0tt/ixWv8ohfDhkRnRAuS6IbEpdbkmbxMR8sDm6tgZkQ07kzZMM76PVEoWNkT/VAiqd6WQS7JQty8iztsX9nXvj9UYKnlztdU8jz/bJKpk1nWZFPk/dVVzUmYIhWC9VTPN717IQ69nMivxffDL9B8V1cr/Y/CLH3eWWuBFCEA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=citrix.com; dmarc=pass action=none header.from=citrix.com;
 dkim=pass header.d=citrix.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=citrix.onmicrosoft.com; s=selector2-citrix-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=BIkzgdykgN6KNEdoNvYGFZ3/LhxyiUpca/MzS//CAx0=;
 b=VDBYLj0gdx1ds5pDR5Vc3cpTZLe4M/eQJ5yhH7z9QciqShW+xl5rZhILnR0U/hI6ajcrtuF0TkI/qt+vVlvgKCZntEmETC7JGkdNQGV7vle+SPJ4bvb6+I3vJHixFArqkuhE5KjYJ/DxN5W3SN2viVChlqfcSshj3ja/5UMzrA4=
Subject: Re: [PATCH v3 04/13] libs/guest: allow updating a cpu policy CPUID
 data
To: Roger Pau Monne <roger.pau@citrix.com>, <xen-devel@lists.xenproject.org>
CC: Ian Jackson <iwj@xenproject.org>, Wei Liu <wl@xen.org>
References: <20210430155211.3709-1-roger.pau@citrix.com>
 <20210430155211.3709-5-roger.pau@citrix.com>
From: Andrew Cooper <andrew.cooper3@citrix.com>
Message-ID: <d0508c89-1540-d3cc-f756-c24af75306ce@citrix.com>
Date: Tue, 4 May 2021 17:19:46 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.8.1
In-Reply-To: <20210430155211.3709-5-roger.pau@citrix.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 8bit
Content-Language: en-GB
X-ClientProxiedBy: LO2P123CA0100.GBRP123.PROD.OUTLOOK.COM
 (2603:10a6:600:139::15) To BYAPR03MB3623.namprd03.prod.outlook.com
 (2603:10b6:a02:aa::12)
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: c70fcd2b-bf47-4f85-4683-08d90f1872bf
X-MS-TrafficTypeDiagnostic: SJ0PR03MB5648:
X-MS-Exchange-Transport-Forked: True
X-Microsoft-Antispam-PRVS: <SJ0PR03MB56484BA2B5A16705CBACA0B6BA5A9@SJ0PR03MB5648.namprd03.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:5516;
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: H7rW1i17JAqWR1aSlVdjZNRACNHsyNzCgBOwg01tuoS8eSHqbOe7lDWQRIBvD1d81gOzMWimwR1MGZjI9gRvCLxpDMOOuENJVxFXtQ50fsKanZSCoMpnd8Eg1bEDYRaWlkbmjuN2C8IEpOOpSqaqyq0XoWW8Xl32/Na4P5F+LzGXzzZvMvmmA64B3a35OBZJNCacsZMMHppqVrCE82hZfWwdD1L3PooSr+wYYCu55iQkEpPoipRZqG/8b7Zbv34+xqovrKsro/5xx2SdvWgfja9hXHDKSQTE1zoQdKEKpQwgLHhJT/JHxXgPOsnh4ryR4S08nl7/oV13RaR3nevb5EyKooHHtfOIGI/kYIXx6q89aIRsOVH++9OeF4rxsgbUhUmLksGcqIo37I0CF8S/ArKflw6AzHHrvP3eXndbkSw8eTJnYirCwp1Jc8EUStNK81UO25eWbjYtRd+JpKHWWNe5Yrh7YGZvUA6/4ySW2yRs4PZgC1m6XHTXz3Dkxchd7/jNNlbT6c9hThUhbno7xnijgYXskzV5fU31gBaL3C0/MUZ0ry3y4yeV3gUwOY2SkWi+87fuGe4wwLufwq1/V1PIiBZatp8shtFDePXSLkll3g6+iE4DmPqcfym3zX9Mc3KN3fKaSAZIRi0jxnYgekRMxp4Ozhkc7CLynYpXRdvJ9XXlMqu7xOMw6LC9F/QP
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:BYAPR03MB3623.namprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(4636009)(39850400004)(346002)(366004)(396003)(376002)(136003)(956004)(53546011)(66476007)(316002)(8936002)(6486002)(83380400001)(54906003)(38100700002)(4744005)(66556008)(16576012)(31686004)(66946007)(26005)(16526019)(4326008)(478600001)(86362001)(31696002)(8676002)(36756003)(2906002)(6666004)(5660300002)(186003)(2616005)(45980500001)(43740500002);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData: =?utf-8?B?TThIVm8xUHVwbHpydEZmN2pLRFdaNFg1TTdsbmJncHQxSmJOamFQVWcvcU1h?=
 =?utf-8?B?TVk4bnZoNFNNSGxySU92K3pGaWdjcitqVGpZam9QbjlUaklFZGlweUM1MVl5?=
 =?utf-8?B?ck5QWW9SeUpNU0J0a0ZVMnJwWmpwR0RMNjRiZ0l4QVVtZnhHUnFBQmtrZkts?=
 =?utf-8?B?akpwNmFiaWZPRGN2eVBDenV6aUVlTGkvRVVTY3g0QnBFNXcrbTZmTDFEajl5?=
 =?utf-8?B?OWhWaktTZm9sZnBEMmhMZ2hQZmRPV3ArZ1psZkFCZk9KRGhYY2piWmd6Q1hO?=
 =?utf-8?B?NU5wQnJtTGVwN3pxeGN0b2kxenRzWWZsRzNmdWZadTVkU2xsSUVXZTFCVkVF?=
 =?utf-8?B?ZUZsZS9HTENFbXY3TG83WEdXZThXNTFQZjNoU3gyRWw0eXFkN3RlV2lUT1p6?=
 =?utf-8?B?c1hqcVlRaS9IMVVXMnBZUzFvVm9mMm1yTm82bm9hbHNNTU16Rk4vdEdaRExR?=
 =?utf-8?B?K0wrLzluTHF3cm1lSHhSbDZrTHB3K25RT2VEK0hpZjFZT3l6bXg3c2FIeTZC?=
 =?utf-8?B?Um9jYzhoS29heXhLWnM4VlFvVkZLSStYMlJ3eFJ0cjdVYjF5Wng1aitWakdF?=
 =?utf-8?B?TitJZ0c4MjBJcTB5R2RXUmRUbCtXb2V5dkNHTXBLVDhJRTlFRzVZNW9wNzNv?=
 =?utf-8?B?b1RnYjN4ampFOS9ySE4zREROSWx1TEJ0TVpuUmorMlZGQ09pc0hhaFFOc3py?=
 =?utf-8?B?MUVhbUpNZ1hYUm8xUGRaOHVnUk9OR24yd3VyQ040UmdKS05SQ3ZxVzFSdzJk?=
 =?utf-8?B?ZkQ3QkFlNll0MllTR2hpREZhUy8wRkRJYjlRbHRyelJWTjJMbGJYRzJmRmRR?=
 =?utf-8?B?TFRiYnNwM21LOUZzeFk1RlVtemtIeUgvWmhOQ0ViMDQ5cWJaL2FCNS93bmsz?=
 =?utf-8?B?amxmU1dXMjVxWGxnNFNSai9SUnovandoY0MrNTQ2ZWtHN0RRODcrcHlzTllu?=
 =?utf-8?B?Uk1ldkhlVCtkQVhGQisxODhxSmZDeFN5OEZtSVZmZzNHMXZrZnJXZ3JnUll1?=
 =?utf-8?B?eHQvMHFYM2dNOVg4WEMzdkV1dmpZbUVGSmxXdkVLcTBuMzM0M2h6Y2tIdGVq?=
 =?utf-8?B?N05uTkVsMTd3dkdhdVowN0lxTno2N2N2N0hzcC9ZRHM4emRucGRjbEJMVW0z?=
 =?utf-8?B?RkZtbnhjZlBKMXV6SitGM3JTN2lpV0NablFsdCtkSEJNU2FzQy9NVHV3b1lF?=
 =?utf-8?B?UjdpUGRsSFYvTmhVbDZ3Zm03RFlsSk1LZzZrcEg1ektKWGZTRzBxMWRrVTBZ?=
 =?utf-8?B?VzNiTWZkUXYwUDNJUTMzRkRXbFJEaVRaVHNsQWJnWHNzYStGTzhaTTFkU3ho?=
 =?utf-8?B?VEhqWWtidjdpcWFtWnJFeDVKQkFvb2xUeVhVckpIUE0vRkVYS3ExUGxGSXdI?=
 =?utf-8?B?WTF2R2pCQXdGYi9ac2FORTROQ3NvbEVQR2FWbmhhWUl2QzZhelR0OWt0S0kz?=
 =?utf-8?B?R0dYdndxWWxGZ3djT2c3enBYUHlrOXp3ZWdBMXI4aFNVcG1NVmN5OE4xdmpB?=
 =?utf-8?B?eWNUdFlDNzBmM05JQVZrSXp5c0pKREhBU0FDbGhkMUliM1o3SjE2OFZZTmox?=
 =?utf-8?B?QVRGZERoalczQ1UyTjFHa1lLTVR4ejVqZVdMQTMvcFNxWUtkZkdNV3YwYjZK?=
 =?utf-8?B?WC9VTzNuQ3BWeWxBSjFqR1hKSkNhN3dnT2JvL3grdVlNbGdVY1FERE83Qzc5?=
 =?utf-8?B?M3ZBbnRrakxuek9teTdOMjVubjR6c1Q1ZmZXeTdhV3RmSEZaR0JxazBuUHk5?=
 =?utf-8?Q?tew3vgok05hjGTmwkBuewTIIfx/9Oka/vgBMBPC?=
X-MS-Exchange-CrossTenant-Network-Message-Id: c70fcd2b-bf47-4f85-4683-08d90f1872bf
X-MS-Exchange-CrossTenant-AuthSource: BYAPR03MB3623.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 04 May 2021 16:19:53.1723
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 335836de-42ef-43a2-b145-348c2ee9ca5b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 1x6S6x8L/ILIy1Q+rxdQ7QAX+rUmdyIa1RVRjry4Qty2ZDv85FOWpg/nWHRXP9CP4L6S9m88Oebq25mHs3Nud18bijBpyGoSJWrG9NK8h8Y=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SJ0PR03MB5648
X-OriginatorOrg: citrix.com

On 30/04/2021 16:52, Roger Pau Monne wrote:
> Introduce a helper to update the CPUID policy using an array of
> xen_cpuid_leaf_t entries. Note the leaves present in the input
> xen_cpuid_leaf_t array will replace any existing leaves on the policy.
>
> No user of the interface introduced on this patch.
>
> Signed-off-by: Roger Pau Monné <roger.pau@citrix.com>

Acked-by: Andrew Cooper <andrew.cooper3@citrix.com>


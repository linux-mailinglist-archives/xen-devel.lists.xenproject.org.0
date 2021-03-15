Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 5CF2833B261
	for <lists+xen-devel@lfdr.de>; Mon, 15 Mar 2021 13:18:59 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.97996.185817 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1lLmBO-0005X9-1x; Mon, 15 Mar 2021 12:18:50 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 97996.185817; Mon, 15 Mar 2021 12:18:50 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1lLmBN-0005Wk-UV; Mon, 15 Mar 2021 12:18:49 +0000
Received: by outflank-mailman (input) for mailman id 97996;
 Mon, 15 Mar 2021 12:18:48 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=vQgs=IN=citrix.com=andrew.cooper3@srs-us1.protection.inumbo.net>)
 id 1lLmBM-0005Vx-1x
 for xen-devel@lists.xenproject.org; Mon, 15 Mar 2021 12:18:48 +0000
Received: from esa2.hc3370-68.iphmx.com (unknown [216.71.145.153])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id 93f307eb-1c54-4617-9d0a-8d454e5b4927;
 Mon, 15 Mar 2021 12:18:46 +0000 (UTC)
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
X-Inumbo-ID: 93f307eb-1c54-4617-9d0a-8d454e5b4927
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=citrix.com; s=securemail; t=1615810726;
  h=to:cc:references:from:subject:message-id:date:
   in-reply-to:content-transfer-encoding:mime-version;
  bh=sWjkr+PBpEwQK42pGbh45eeU4EpaRPSpIIvbQ/pJsvE=;
  b=YbtT0IqUUMKOEPbWNR/qFThvHUn4C+yeefi5eCmd6+tU6N26NzEvgvbk
   bYfsUdr9hMn8K5xenGDLptKVOfAnsFZYZX0Sle9YZRuPPefYQKgPwwIw3
   pgMnQ98iFOorHxvsRZhJMg4Q+UQvTNynJRYpXwpMIppOLIvpw0g0lAY5A
   Y=;
Authentication-Results: esa2.hc3370-68.iphmx.com; dkim=pass (signature verified) header.i=@citrix.onmicrosoft.com
IronPort-SDR: iCdNJDbnT67zDCadoD73PNg2dC3BtHEYcIP2QFcHnhihO/GyESafgdVNNdApl0uWffWHagBgAs
 aLYneTBeX9ny64VX/pnTwZAroCGhNHEd6RbUoAS4pGzDV854J7D2tbn3YmhZhc7/m+Lts9GIeq
 mRY5hM+HdhZdlEzZsCwkfIdFHPlH5xDuhyooKQhFeLnkIX/wfQJS9OnQInkPdHvv799F1TPWI0
 7QmARPsnzgt/8I2Nrx7BTtLAsVb0cqymhHQcClk27UDVft4lhwKAbDVwYOi8jxIkJO6y+9tQYT
 rAc=
X-SBRS: 5.2
X-MesageID: 39295505
X-Ironport-Server: esa2.hc3370-68.iphmx.com
X-Remote-IP: 162.221.156.83
X-Policy: $RELAYED
IronPort-HdrOrdr: A9a23:Ud0KlKOT0LK1McBcT27w55DYdL4zR+YMi2QD/3taDTRIb82VkN
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
X-IronPort-AV: E=Sophos;i="5.81,249,1610427600"; 
   d="scan'208";a="39295505"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=GQWqMBRerlCoxB0hmdOW/xjUYbkFCwNpFnyEpHuqphtBJ9qdcFUtG8bQNe7bF4QGdvYF5XWfD9LUy8X6iOj3+oo6oTK09XRwmpSPFWe6q8RI8Al6nIxBU8f86N5sZjHh0thUXXVYl/Ou7NyEjABl6D1oJYQX6tbxFt8bMI8kyTXogDJjTMe2yZ2p88oZ5kuvBYAPgQYyapLZl34kkFLLtIia9BHgNdynH+289481KKoAIaK5DoqXN1kJnDvBRZ7XdvXFhWdRzhUsg/OAyYoKG7q/QCUZDJn6mhXQdh0KEwx9Y/nrUjEpYGKiMEc1FvKk3FCwzwAxhaoSYGyi/5e/Tw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=sWjkr+PBpEwQK42pGbh45eeU4EpaRPSpIIvbQ/pJsvE=;
 b=KVJ8UiuWMfU+RUepSYRNQN/I8tEE1NUy3sYJWwbFuqXcza+IJHcu1YifEuVj2mpJfAZimU/p1/rhy0BUQuK2ammjYc5S3y4S3uN+VsvoQ1O/ma+l2il1p21BeE0Z56pUN6ZoYN00zKVPIkjvgzBhJLKbcZFWfmW4fZBpFDas3Egyiwo84xKGoFZDyPiVWKTE8cuAsm5JAKm8mNsYbaY5rUIJ4d/tryLp/Gn/dQiLi4ThmTzVSngB3qlvw0cX9qY5N51eLAzUKmgD+7P/d0T8t01RGY18q5YHlsMoxjZ/hLT9iuatQJvgLYUiUiJrumkL72ktVsfdLG7xm3HaTdS+DA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=citrix.com; dmarc=pass action=none header.from=citrix.com;
 dkim=pass header.d=citrix.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=citrix.onmicrosoft.com; s=selector2-citrix-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=sWjkr+PBpEwQK42pGbh45eeU4EpaRPSpIIvbQ/pJsvE=;
 b=obd2pzXx2Ux5PtI5fHVOhytLyHQG5HX4GxijULflaEAVInr5e/B6NNWg2/PDjFU4VfpqCaWZH8LiZLT2nDAeLSjaJ80QwmgZFPljlGyCF4OE8NGl4u6fB/rnkU7VA0YSekoha+hFuPQEsD8nInWl6RpKro8cinWeDeYPl/ejdeg=
To: Julien Grall <julien@xen.org>, <xen-devel@lists.xenproject.org>
CC: Julien Grall <jgrall@amazon.com>, George Dunlap
	<george.dunlap@citrix.com>, Ian Jackson <iwj@xenproject.org>, Jan Beulich
	<jbeulich@suse.com>, Stefano Stabellini <sstabellini@kernel.org>, Wei Liu
	<wl@xen.org>, Juergen Gross <jgross@suse.com>
References: <20210313135500.27241-1-julien@xen.org>
From: Andrew Cooper <andrew.cooper3@citrix.com>
Subject: Re: [PATCH for-4.15] SUPPORT.MD: Mark C XenStored LiveUpdate as Tech
 Preview
Message-ID: <43d6d118-308d-6bb0-3b91-7dc0f8a38d56@citrix.com>
Date: Mon, 15 Mar 2021 12:17:25 +0000
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.8.0
In-Reply-To: <20210313135500.27241-1-julien@xen.org>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Content-Language: en-GB
X-ClientProxiedBy: LO4P123CA0235.GBRP123.PROD.OUTLOOK.COM
 (2603:10a6:600:1a7::6) To BN7PR03MB3618.namprd03.prod.outlook.com
 (2603:10b6:406:c3::27)
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 9e38013a-8e3a-46f0-4f01-08d8e7ac4e41
X-MS-TrafficTypeDiagnostic: BN7PR03MB3825:
X-MS-Exchange-Transport-Forked: True
X-Microsoft-Antispam-PRVS: <BN7PR03MB3825367FBDEECA8EB177C69BBA6C9@BN7PR03MB3825.namprd03.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:6108;
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: kRoMTjJSvnZn5+ylLzUjUC1v9zVsBgjjw7k+tldUoFM0vdksGXBv0qMv4HDSZpJNIC+zQOwzh5B/pS0x50t6YLXiqTZ8+g+h9tLHUkux56cLYwXDgXHv9V/86pS7xUjzeACfHyIPHeZ5Qx3jYi+9upkN7coyKR+tsivPaOjHyKxO/hEYAqjqbL/6/MCd4UGJeuCEinVzOI+4ZO32wEoKeZcaktHpNwEswaJCiLAbcmABs6N9US2Kc9B7tlgVuP2Th1+erQx8UPTqrc7th9UvHIYT7y8sJmxe4XewgFb8vfsIF+Z1WIcPzL1jXyElBdzxUFw5XEM842lDtO8TwfdH8SuQ3SW+ZGqokb8RfnJIDsCw9Wa7gNjr4kV56dttkXTDWHdF5TdcA7iUpnJtIIj/GBriPYDmvzJKl57q4VVyPgi+dhdai1l4xYe1e6LwyRgNw0ahP2rVDVRZCOuQ2+7dbWLrcPm56yRLc+Hxhxkq9KGIG+kOqdO5yzYfVeeWLGzWgUXmOiZq2b1i3AYFc9Cwy8JKGA4FqVJz7Rn4dOeKlrsL9E4bz+Ig3Y7jHhVUTbmbY6ZICsVLu/ZL9+VVHhfPy5PJUXsMoWhL/++3CT69o/NQp1EQqpY4jQOLAFmEr4JLSbv9mO1N0G6c1SMPed/jig==
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:BN7PR03MB3618.namprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(4636009)(136003)(396003)(39860400002)(346002)(366004)(376002)(66946007)(83380400001)(66476007)(31686004)(4744005)(66556008)(5660300002)(6666004)(316002)(26005)(8936002)(4326008)(2906002)(8676002)(956004)(53546011)(16526019)(16576012)(31696002)(2616005)(478600001)(54906003)(186003)(86362001)(36756003)(6486002)(43740500002)(45980500001);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData: =?utf-8?B?dHhLUFJkODhTdW5lTm14RjdjSnNHKzNWbThtblZYd0hVVWwzeElYY1JxQUxJ?=
 =?utf-8?B?YzNjUUM1MTlVVElPZ1hzOUpOQ2FoNk5pSVBLTXU2MnlTMEtpOUNYRXdFMkxP?=
 =?utf-8?B?ak42VjFnMUZ3eEVWSVh3emlBNldONXBMeUgwL1NULzhNWnpNZ214R21LRG5n?=
 =?utf-8?B?YXNXQXp5YzBYTUZMdGVnNmZ4RERocnNJdGFER1NXNHM1YXlkaDR6aERZbUZl?=
 =?utf-8?B?UUNOYkl4Wm84bSt2ci8xTWhJWjJMY0FlMlVjY250M2tBUlljbFJXSzJDZThv?=
 =?utf-8?B?MVBjUU5MNSt3Y1VzYVlhM2RGeDJTOEdVSmpUZkNnNVp4bC9ycE1HMzVScGxJ?=
 =?utf-8?B?TjZFVEJ4TjhVem9sQUZNWW9TV0h5c0E4ZUkyUXBZRGJubjNzUWEzL1VNK1hE?=
 =?utf-8?B?cDg2MDhzRVF3NnR0TWx6ejFGK21OeUo5TFlpdFk2RStKNWRLYzAzYnhzT0FF?=
 =?utf-8?B?ZVdWMlV0dk1UL0wwNnBObTZtcG1ieHUxQmE1ZkZ2cXdmSDhIbW44dW1aVU1n?=
 =?utf-8?B?S28wVnl6RUR6UGY2MnZDekl4bENDRjg5a1BkUUM5WnZkNnRseVhkKytZbnQ0?=
 =?utf-8?B?b2k4WFFNamVmS0lzODVvTTAzcWExNG1FUkdyRTBuTTR6azZQMW9wSU5zRFpj?=
 =?utf-8?B?Q1d3UEJYb2sxNWlQYzg0TWNuSkRZYm55R0ZZSzV0WXZLbGovUURUa29xVnFo?=
 =?utf-8?B?aG5WSXgxczNONXhnYit6V21KUmdua0tHa0JwUTBocFhVZVgwNER4a2JVbThi?=
 =?utf-8?B?cmJaKzROR0hmVGhVM0dIcSsyd1g4ektVLzRNT2tISnZ2Y2hPQUE4cE9qOW5K?=
 =?utf-8?B?SEtLbnhHTDNURzh3OXZ4NkpaaVZDZ0lseDhmKzczeERkQkV1TjdtZkhEVTVE?=
 =?utf-8?B?bWoxaTkyUnd3emVqSzc2WWN1VFBNWjNMLzJRTEZZWmozVnFiVE9Vb0NaYS9h?=
 =?utf-8?B?aVk3R2daZ2FYdms2N1hLSGRGKzV3ZTRiSDFtdW1ZcVpFb1NwdnJ2Z0ZETno1?=
 =?utf-8?B?eERHYzlnOFhTNDN4c21MaFQ5TVlzY0FEbXVZUy9pWW5rZ3lQYjM4eVoxYWdU?=
 =?utf-8?B?djByYUowcWRwMlFxa0J2RjdqRnh3Y1VqTTlwQzFHRHdLUGlVYTZ6dy80WXJm?=
 =?utf-8?B?RE5XcDNvR3drUmZ0WEdNYUllN05jcjhLOWZEQXVUKzFyOUdPbjdGUmhyMS80?=
 =?utf-8?B?ckVXSEU0aW51bTZNQXFrWkFyZWR3blpJNGpVWXk0ODFIWGNBT29KVWJvc0Ra?=
 =?utf-8?B?Z0dQTWtOQS9VWFc3clI2TFQvcnhWc3JKOVZwWkJwYncvMmVXaWRIemo0b1pD?=
 =?utf-8?B?aTVEbEtyWmJWaHpPYWxPam1Sa2pTcWRIR3BoM2tURHZlWUYxSW8vL2o5bytZ?=
 =?utf-8?B?Y1liWU1ObGxmbTR5R1lMUVRLdE9BT01jVFl5bFpxY3A4L281dUNBU2I1dzZy?=
 =?utf-8?B?eE9QMEZZT2Vnbzc5T1BNL2dmbDZ2bWFTelA5TFk2Y2doMTdqVy9ua1ZBeTRj?=
 =?utf-8?B?MlRNaUd2T0NybGQxUStjWis1dG1ZRWJQcWxHUEtYMDVzRlRHMG5XT2ZINTZ4?=
 =?utf-8?B?QTNQZ3hGWGJOODhZZVM0NlZxR0trSjBUajdmTUFEeFMvRzhnSk1keWhQeGJv?=
 =?utf-8?B?K0xRQ1hzVTZPS1l4dFppSlQ4N2IySXlVbm5DVm11TUU2TUxobUdYOURpVVBP?=
 =?utf-8?B?ZnE2MnRaKzk2RmFxTW1scFpQTGFIZ2tNTEZvV3hBY2ZpcGhJOU9TNmZZc1Rl?=
 =?utf-8?Q?MGkexrIQ5YLOwM25wS+nrk2BhJmbYU3tJmIXTx1?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 9e38013a-8e3a-46f0-4f01-08d8e7ac4e41
X-MS-Exchange-CrossTenant-AuthSource: BN7PR03MB3618.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 15 Mar 2021 12:17:31.7262
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 335836de-42ef-43a2-b145-348c2ee9ca5b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 7fY6aR9M0duI9FiFtU2BOEAIBiBifmEyC+Rtu0N3sqn4HrzRZrFPcXwI9lN9pSi3JblhcAf7wzzR2Zl8di/SpV+RHUNKIDW1+5DQanVENnY=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BN7PR03MB3825
X-OriginatorOrg: citrix.com

On 13/03/2021 13:55, Julien Grall wrote:
> From: Julien Grall <jgrall@amazon.com>
>
> Support to liveupdate C XenStored was adding during the 4.15
> development cycle. Add a section in SUPPORT.MD to explain what is the
> support state.
>
> For now, it is a tech preview.
>
> Signed-off-by: Julien Grall <jgrall@amazon.com>
>
> ---
>
> CC: Juergen Gross <jgross@suse.com>
>
> It looks like the OCaml side was not merged in 4.15.

Yes it was.

> So I have only
> described the support state for C XenStored.

What about stub-cxenstored?=C2=A0 I think it wants pointing out specificall=
y,
whatever its status, to avoid confusion.

~Andrew



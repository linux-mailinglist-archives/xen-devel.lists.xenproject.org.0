Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id A41793ACA8D
	for <lists+xen-devel@lfdr.de>; Fri, 18 Jun 2021 14:04:36 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.144551.266038 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1luDEK-0002im-Lx; Fri, 18 Jun 2021 12:04:12 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 144551.266038; Fri, 18 Jun 2021 12:04:12 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1luDEK-0002gI-In; Fri, 18 Jun 2021 12:04:12 +0000
Received: by outflank-mailman (input) for mailman id 144551;
 Fri, 18 Jun 2021 12:04:11 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=CUMw=LM=citrix.com=andrew.cooper3@srs-us1.protection.inumbo.net>)
 id 1luDEJ-0002gB-5n
 for xen-devel@lists.xenproject.org; Fri, 18 Jun 2021 12:04:11 +0000
Received: from esa4.hc3370-68.iphmx.com (unknown [216.71.155.144])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id 0b26ad3b-c8b7-4a77-a771-08dc3c847345;
 Fri, 18 Jun 2021 12:04:10 +0000 (UTC)
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
X-Inumbo-ID: 0b26ad3b-c8b7-4a77-a771-08dc3c847345
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=citrix.com; s=securemail; t=1624017849;
  h=to:cc:references:from:subject:message-id:date:
   in-reply-to:content-transfer-encoding:mime-version;
  bh=d9K9ap+ETE95oUFWqKttd+E8ehCyTWctqEITAxBskOk=;
  b=iCnDHHX8RzfaxRPnu9sZUYQUBx4ou28jMPctMSo7RRQLkmuLR2S4EL41
   kJKLfAAca+S17WHgHul6N0SXbizRb5yddJ8kpbWk0TLC9edz95UiKiBHl
   8EAdhM/kBbPLTrshTp4ZaRW5pQ7ZOSDV2CTBk4RTeJYD0/CmZAvyER1kA
   k=;
Authentication-Results: esa4.hc3370-68.iphmx.com; dkim=pass (signature verified) header.i=@citrix.onmicrosoft.com
IronPort-SDR: 1Zpy0bzQ24qv0HRrQSP+xRTBcsE8h99D6KCfuR8A2vl61lIYXiK7fAXRG0L9IK7HkygzKQTTlN
 gbgfLqNAyd0Qojy1BwZ1i0SQ7c4e88tjPyz4Tkjfhy4kmj4OBMe2W/njW9sdngEbFnjVVlquZ7
 KI6y7fdhcbm8ZlgghCQKMZIqHsNNLnRYEdHOV/h5Gg2ZAEdK+8kI90dosUDS7pVbPVg58WfpnJ
 XwMmYO6rx4SQyj6EdaGucUpuDXYU5K8nLtxneeW4SOpbU3wxXjbxN7ZqBwqhfz62v8FTi8UjUU
 kjA=
X-SBRS: 5.1
X-MesageID: 48039831
X-Ironport-Server: esa4.hc3370-68.iphmx.com
X-Remote-IP: 162.221.158.21
X-Policy: $RELAYED
IronPort-HdrOrdr: A9a23:/PYJj61kZ6xxDg735uxCHwqjBSlyeYIsimQD101hICG9Lfb3qy
 n+ppsmPEHP5Ar5OEtBpTiBUJPwJU80hqQFn7X5Wo3SIzUO2VHYUL2KiLGC/9SOIVyEygcw79
 YHT0E6MqyMMbEYt7eJ3ODbKadZ/DDvysnB7o2yvhQdL3AfV0gj1XYfNu/yKDwEeOAsP+tBKH
 Pz3Lsjm9PtQwVsUiztbUN1L9Qr6ue71a4PJnU9dlYawTjLqQntxK/xEhCe0BtbezRTwY06+W
 yAtwDi/K2sv9yy1xeZjgbontdrseqk7uEGKN2Hi8ATJDmpogG0ZL55U7nHmDwuuumg5Hsjjd
 GJiRY9OMZY7W/XYwiO0FvQ8jil9Axrx27pyFeej3emi9f+XigGB81Igp8cWgfF6mI71esMlJ
 5j7ia8jd56HBnAlCPy65zjTBdxjHe5pnIkjKo6k2Ffa40Dc7VcxLZvuX+9KK1wWh4S1bpXSd
 WHVKrnla5rmBKhHjLkV1BUsZuRti9ZJGbcfqBq0fblpgS/nxhCvgclLYIk7y09HD9UcegO2w
 3+CNUfqFh5dL5aUUtMPpZ3fSKJMB2FffvtChPcHb21LtBIB5ryw6SHqonds9vaCaDgiqFCxa
 j8bA==
X-IronPort-AV: E=Sophos;i="5.83,283,1616472000"; 
   d="scan'208";a="48039831"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=b+y9i4xxBGSgRM9WkPr5v9YXxa69Q4fI6obTJbmCZdaSYXmUTOMsMtq1WEHqllHb1haf3hzzsl3pwISsDAzLAQWk5mbwePDFxP3eTXSnqtOa0UMG0FCIQNVk9KuAWfLBnNte2cAP17XdnwB5X0TslOYYyJhFI2lL4cky/6t1zic7eYdW3YeAxt1Nwde8im0nY1ktPmAAZkkh6Jc7YsgjC0Wr0NQUavt/TF22CeWXvhVPHah8yMQu2aYIakWpUtD8vfX6g3HKUKieozQN/C42Ija9uYyoeGH/QFRxEfZi8++Bt7y1l2wuWslG//RoE3s08lVF7T8mCFZr/5R8H77vhA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=8PBiWLjiHQp/SNn8XcLxbh42CJZ3ibzJdi8tJxiJW7A=;
 b=PvYrvrBLf5dXZOxVOEiowuSEpnt5ha4BZYQ9MG/ClD1QQv0J050lrqCOArXn6vsewzqivWJQ15AHXeSVSUpUDcgW7kEC5AvGqpZbQOQl/WYU/n9Zy/Vvz2gc6SL5HLl27QD3ZjTU12PXg9rs61+fo66Wnaq/AFpYGuWzhtMWVNRp09MUFYTSdbaMD/wB0IrgokHNjpYLfFnJ06WoMMcDixemcy3PLswNUVbwp8pkkRrNaAXrbfw2Mgis66/vvkYH61JOURbgJvZI9FvE5D2pX+c+g5wbuDSqRQec5YxsdJ8xyBTqmbqg6W7PYEPjj7R9lEdgkTUq8HKnP2V/CRwPdQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=citrix.com; dmarc=pass action=none header.from=citrix.com;
 dkim=pass header.d=citrix.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=citrix.onmicrosoft.com; s=selector2-citrix-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=8PBiWLjiHQp/SNn8XcLxbh42CJZ3ibzJdi8tJxiJW7A=;
 b=vTQECRvJrLrXIoK1u7wQBGUjAl6pIrmIMKij9eYrE/wHhAroW3KnritUYQr1bAe2d2njnizYRvhTk1oiWpHNBC1omUjPSq582jbr5/c+b4SEUWybmRhu9ePtxi3Zta3TaRAcy41PImRr4UYYeiN5heVnnlld8ecTC9U9Pzq6Z9s=
To: "Daniel P. Smith" <dpsmith@apertussolutions.com>,
	<xen-devel@lists.xenproject.org>
CC: Stefano Stabellini <sstabellini@kernel.org>, Julien Grall
	<julien@xen.org>, Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>, "George
 Dunlap" <george.dunlap@citrix.com>, Ian Jackson <iwj@xenproject.org>, "Jan
 Beulich" <jbeulich@suse.com>, Wei Liu <wl@xen.org>,
	=?UTF-8?Q?Roger_Pau_Monn=c3=a9?= <roger.pau@citrix.com>, Tamas K Lengyel
	<tamas@tklengyel.com>, Tim Deegan <tim@xen.org>, Juergen Gross
	<jgross@suse.com>, Alexandru Isaila <aisaila@bitdefender.com>, "Petre
 Pircalabu" <ppircalabu@bitdefender.com>, Dario Faggioli <dfaggioli@suse.com>,
	Paul Durrant <paul@xen.org>, Daniel De Graaf <dgdegra@tycho.nsa.gov>,
	<persaur@gmail.com>, <christopher.w.clark@gmail.com>,
	<adam.schwalm@starlab.io>, <scott.davis@starlab.io>
References: <20210617233918.10095-1-dpsmith@apertussolutions.com>
 <20210617233918.10095-6-dpsmith@apertussolutions.com>
From: Andrew Cooper <andrew.cooper3@citrix.com>
Subject: Re: [PATCH 5/6] xsm: expanding function related macros in dummy.h
Message-ID: <42e3d58a-edf3-1da9-af6e-c2400f25365c@citrix.com>
Date: Fri, 18 Jun 2021 13:03:53 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.11.0
In-Reply-To: <20210617233918.10095-6-dpsmith@apertussolutions.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Content-Language: en-GB
X-ClientProxiedBy: LO2P265CA0308.GBRP265.PROD.OUTLOOK.COM
 (2603:10a6:600:a5::32) To BYAPR03MB3623.namprd03.prod.outlook.com
 (2603:10b6:a02:aa::12)
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 39d3152d-621c-4b39-803d-08d932512a8e
X-MS-TrafficTypeDiagnostic: BYAPR03MB4615:
X-LD-Processed: 335836de-42ef-43a2-b145-348c2ee9ca5b,ExtAddr
X-MS-Exchange-Transport-Forked: True
X-Microsoft-Antispam-PRVS: <BYAPR03MB46152C1B95F4988F6B2122A0BA0D9@BYAPR03MB4615.namprd03.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:8273;
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 9YFIeBTWGbym/tOl7gWzBoPOYZF/5YDFhdCsFgogFE2PP83ucEKZnzrfUujBSi83JWDmDyiTn/8HhXpeFo6hNRHTzKoIAQNpHa/pQVTndSA6uVChXOaHg9tV4YDXicheP+ZkXeZZwfjRhxJgzACXCg3XO7O4qD1Gvcs28TB9CaIIeJUsXHck/qI9/Eiij624qT+MH1ITDiBzBJAnmSmMmp0Vv7jQY4g2LK565cUMlAyBMSak4FIiZVy+09Vy8ATDV8HlNiQolfer5dBkTDIfvGiiqJllM6bkemu/eIsYaUMi2XEVgyEnSJs1K7nb1EV9ibpMHqHmEv5Z2QQHmOs0jjmVjy+9HWT/HNLBgHmQgL37N5u0p82KXDBC7fov7TVddoQ4/ZQ+bC3QsPRzWSNTvKFMWCNzg+AXvjX2Kh7l6AtUY5jKOxfRze3xTImOigwEEQQOFdAfG3kJE9Twdkn38/12H8frMfwreUgT7z+uONkY6VPkO+R9FSsRXD797jt8wa24VHwXMFo49oUsWdf4N3jYTfD9R3bQ1awjRR6C0Ks2r3KHdxlkuAnzbkOXUE8aSqxOYLnxqpgq32rFEtaZLCXsBaxht3RWfiWl45lDnX4WaazxbJa02WeAZdU4ORXKV1/2QWmyb8WTAvfuzVGlmnW/swKit5tq7r9V7u4iamDVWASeZTNen3xvq2BMM9aq
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:BYAPR03MB3623.namprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(4636009)(136003)(346002)(366004)(376002)(39860400002)(396003)(5660300002)(7416002)(8676002)(54906003)(478600001)(2906002)(86362001)(8936002)(31696002)(4326008)(38100700002)(16576012)(316002)(6666004)(26005)(16526019)(186003)(83380400001)(66556008)(36756003)(66476007)(66946007)(31686004)(2616005)(956004)(53546011)(6486002)(45980500001)(43740500002);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?T3hDRW9kU0VacEhrVXdCcVRmNWpzdG1lNUFzWU1nc1o0aTJlUWtYOUZwVWIz?=
 =?utf-8?B?UnNKL1BQaEYyRUV4bDlEYVdQZFQwcndtN0ZLNVFFTUR3MWxqaWdGbjAwSmhq?=
 =?utf-8?B?cVhVK3Y5cTMyVVhvN1RBRWJwNzI3djFaemxxaGVXbFdFb1BWU1YyRG5iL2cr?=
 =?utf-8?B?VTBhQjJvWGR2MkdZbGFwRFJmenBPaUxINHpHRCt1OFloTUdPM3NrUHpVaTFs?=
 =?utf-8?B?QlRsS2FVeVU4OE9OcEd0MnVHUXpPcUpCcVhVaVUxWXRzYzl3SStqMldsNGl3?=
 =?utf-8?B?K1dsemNwMW93NElVSDZTbHhOU2FNSWFWVXZjaldYbjNtU0NMUWw2R3lFUFJw?=
 =?utf-8?B?TytKZXQrQ1Q2ZXlEM2RtMFpOMTZCQmFMc3pxK1pIWDBHdWNUN0RmV3N4YkM0?=
 =?utf-8?B?blZxN0tuL3Z5Q3JUQThQN3BVNHhoQ1RuZTg2NG83UWQzeXlCS1FxSmtacGIx?=
 =?utf-8?B?MDhLZUd0bFZldUVSTDY2Q0sxdFFFZCtSNCsxNXgzWFE1b1JNNDF6eEVJNWNE?=
 =?utf-8?B?Z2tPWVpUb3Z6MmduanozcUczRU5oOGE5KzgyYkNrQnNmVkdhbEVoajBYNVpp?=
 =?utf-8?B?ekNHcDJVME1FNjNETWdWMzd4MFdYU0dHcWc0cXZWc0xwNC9HbWZ3dDY5aXNB?=
 =?utf-8?B?cnBaTWRpclFsRGpsSExsUk1XQ1djQXo5SjJ6SG1ROGJSQjhKSzBxamkveVRI?=
 =?utf-8?B?bjhoZHBzVDd0SythOTh4aDNWZHhGSnlsSyt4SFByQUduZFR5U1NrTjJTbXYw?=
 =?utf-8?B?ZUV2ekFzdHVxVHZIam03OW1MdEJueFVENFE3ZU41d1pUMzJUN3NoWm0zOEF3?=
 =?utf-8?B?VWt5NzVIREE2c1lOYzBTMmFSVWlSUTByQVF3N0tWV3RFVEFGelY3bmhKajlq?=
 =?utf-8?B?OHNQWVV3QkxOd1pIRnhLK2cySWVCWmFmdzVTSzkrMkJIb1pFNGtvYWNja3lF?=
 =?utf-8?B?bW1zbHpBRk5DK0NOaVU2cjFjYnJiUDdpUUpQUVlSM2EvT1JQQk5mekJHV2Jy?=
 =?utf-8?B?L2hKVkpveHhkS1pOUkZkd0tMTUJSR2tHSVFieEU1Qk9UZHp0clhwMlYrQjFB?=
 =?utf-8?B?eFljTUdIVDVTaWc2VGo4dG9xRmlqQ0k1aVBhbm51bVdYRkMvc1lRbDIwaUlP?=
 =?utf-8?B?T29xOGJKNE8vVTlTQUFYKys4blFnZWtydWJXVXoxT3B3SmdoWjB2OXhaMU9V?=
 =?utf-8?B?cTQrTWVwQUYxZlBsTVZ2TlV0Zi8wc0t4UXNGMW81ckllcGx2bzF3WnFYcXNW?=
 =?utf-8?B?ZzhQNFJzeGdXOFFXd3ZLRWNKZW00YmRiVVdMVGROZFdXb2Z1KzNKRkE0Q01v?=
 =?utf-8?B?OWtQNXQ0ZnU0K3FCM1NiNm1va3NmNElwYTk1KzN6VkVINnN1emgxL1VaaHox?=
 =?utf-8?B?VzllcDRzQTBjZjVsb2dTTkV4UDNOUCtSa1l5ek5MYzZWTzA0MTRXYTlRNXps?=
 =?utf-8?B?c0pORjBkUUZveVhFbSsyaHhoMVB3dWY5eGoxMnFnUmN1eVpCdG1Calo4NUpL?=
 =?utf-8?B?b2lzRkhQc0Mvb1ZMcndGdi96VEoyS2YveUxRY2FzSWplV1djdy9nU1pQODl6?=
 =?utf-8?B?dWhuT3FoMFJXWUJmdnhtOFFpWDNxNDJUc0h6WHdlUzNzS0ZYRTVHNkIzTmxy?=
 =?utf-8?B?aWY2ZWphYzQyK0N5ZXNEeS9VUzUvWVl5Z0NRWlljOHNOZ2wvSFdYV3R6Zysx?=
 =?utf-8?B?THNNZkNVSlRnNVRrcTVBRjErSmlYT1Y1cUxBZFQzd0xHUitNdUlScUhNUHhR?=
 =?utf-8?Q?Vdfgil3232b7jMFumPxkHSgMp2A/Z7XhDhlwnnd?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 39d3152d-621c-4b39-803d-08d932512a8e
X-MS-Exchange-CrossTenant-AuthSource: BYAPR03MB3623.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 18 Jun 2021 12:04:03.9126
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 335836de-42ef-43a2-b145-348c2ee9ca5b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: HerZurYamLhrmL26YQ0gDr/YJDxZQIzwUNl7d2FepbI5NTWCPFH/7zlyA66aI6GooWiHr6TdT6jy24hYmCxs3Amesa1XKxddcP+ylZpBmQE=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BYAPR03MB4615
X-OriginatorOrg: citrix.com

On 18/06/2021 00:39, Daniel P. Smith wrote:
> diff --git a/xen/xsm/dummy.h b/xen/xsm/dummy.h
> index 7e2bb09dac..0f8ea163af 100644
> --- a/xen/xsm/dummy.h
> +++ b/xen/xsm/dummy.h
> @@ -9,7 +9,7 @@
>   *
>   *
>   *  Each XSM hook implementing an access check should have its first par=
ameter
> - *  preceded by XSM_DEFAULT_ARG (or use XSM_DEFAULT_VOID if it has no
> + *  preceded by (or use XSM_DEFAULT_VOID if it has no
>   *  arguments). The first non-declaration statement shold be XSM_ASSERT_=
ACTION
>   *  with the expected type of the hook, which will either define or chec=
k the
>   *  value of action.
> @@ -47,14 +47,12 @@ void __xsm_action_mismatch_detected(void);
>   * xsm_default_t argument available, so the value from the assertion is =
used to
>   * initialize the variable.
>   */
> -#define XSM_INLINE __maybe_unused

Nothing in a header file should ever need __maybe_unused.=C2=A0 Now that th=
e
!XSM case has been untangled, I think this can be dropped, rather than
expanded inline.

> -
> -#define XSM_DEFAULT_ARG /* */
>  #define XSM_DEFAULT_VOID void

XSM_DEFAULT_VOID needs to disappear too.=C2=A0 I can't see what it is even
doing before the cleanup, because if it is missing, you'll fail the
compile for using K&R style functions.

~Andrew



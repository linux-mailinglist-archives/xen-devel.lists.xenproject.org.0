Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id BA69336947D
	for <lists+xen-devel@lfdr.de>; Fri, 23 Apr 2021 16:18:18 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.116418.222209 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1lZwd6-00039Q-BQ; Fri, 23 Apr 2021 14:18:00 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 116418.222209; Fri, 23 Apr 2021 14:18:00 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1lZwd6-00038x-75; Fri, 23 Apr 2021 14:18:00 +0000
Received: by outflank-mailman (input) for mailman id 116418;
 Fri, 23 Apr 2021 14:17:58 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=zio3=JU=citrix.com=roger.pau@srs-us1.protection.inumbo.net>)
 id 1lZwd4-00038s-Ef
 for xen-devel@lists.xenproject.org; Fri, 23 Apr 2021 14:17:58 +0000
Received: from esa5.hc3370-68.iphmx.com (unknown [216.71.155.168])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id 70e5341d-c052-46c6-8eab-67ab968f6ceb;
 Fri, 23 Apr 2021 14:17:57 +0000 (UTC)
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
X-Inumbo-ID: 70e5341d-c052-46c6-8eab-67ab968f6ceb
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=citrix.com; s=securemail; t=1619187476;
  h=date:from:to:cc:subject:message-id:references:
   content-transfer-encoding:in-reply-to:mime-version;
  bh=p9+ak7UkGNU1QcxtVUb0K485xsRBFsBum1iJTHi+X14=;
  b=iV3bhwBL0pz0Uq+DfI0Byzgt10Uy0XLKDjDGCs0CmMoCUoj7Wb6SgJWK
   oSlmzM7Glbh3L70FkY1Munz9Lran20y9EBcsKXJZlcNdrZHRxpM9+tRVF
   qDGc8EYoKcJiJyVC2wxHZMJVuce6e83rZU49DK62ClHVJu7WopVsa2bkq
   8=;
Authentication-Results: esa5.hc3370-68.iphmx.com; dkim=pass (signature verified) header.i=@citrix.onmicrosoft.com
IronPort-SDR: VWs9NX7WJcJnt1YXSxxA7EQUcgGMNZLuX2tZi4EdA0Ik1shZ76b0Pk3z6eWWRLuioV48+L9J0A
 K8BFxLv2v/zspiA2ioaTMcCjBOEcn1Wb5FzRV0lS5bS9rlZFUds0HdE/CtapyANIYFBBzMbOvi
 ZGkK15UQjgxFp0yYkddg1ck/TgxoySZtJ8W2zsDWBeBBLNTwiwnxPWoQSY6SZWkObTiNr6Un8q
 15lns4d9UWSbp6t5btIsq7+5b86S6yGLtUQF8Ar4p/sCuuUZ5YMwgFzUHpFSzv7F8HUh8tU02U
 6/w=
X-SBRS: 5.2
X-MesageID: 42104076
X-Ironport-Server: esa5.hc3370-68.iphmx.com
X-Remote-IP: 162.221.156.83
X-Policy: $RELAYED
IronPort-HdrOrdr: A9a23:jQiupq+cfxZCTwgO5E1uk+F8cL1zdoIgy1knxilNYDRvWIixi9
 2ukPMH1RX9lTYWXzUalcqdPbSbKEmyybdc2qNUGbu5RgHptC+TLI9k5Zb/2DGIIUHD38Zn/+
 Nbf6B6YeecMXFTkdv67A6kE9wp3dmA9+SSif3Dymp2JDsKV4hLxW5Ce2GmO2dxQxRLAod8OZ
 qH/8xcpyehf3N/VLXAOlAuWe/fq9rX0K/8aRkdCBI9rCWIhzWk6Ln1eiLooys2eTVJ3Lsk7C
 z5gxX0j5/TyM2T5z398yvo75pQkMb80dcrPqKxo+UcNzmEsHfLWK1PQLuH1QpFxd2HyFFvq9
 XUpgdlAsIb0QKsQkiQgT/Anzbtyywv7XiK8y7pvVLGrdbiTDw3T+pt7LgpCyfx0EYrsNFi3K
 8j5Qvw3PA2fHCw7hjV3NTGWwpnkUC5uxMZ4JYupkdSTJcEb/tppZEflXklYasoJj7w64wsDY
 BVfafhzctRGGnqC0zxjy1ExdyhWWkLBRGWQkQOkdz96UkpoFlJi2Qf38ARhXEG6dYUTIRF/f
 3NNuBSmKhJVdJ+V9MzOM4xBe6bTlXXRxjBKnifLD3cZdc6EkOIj6SyzKQ+5emsdpBN5JwumK
 7ZWFcdkWIpYUrhBeCHwZUjyGGCfEyNGRDWju1O7ZlwvbPxAJDxNzeYdVwom8y8590CH8zyQZ
 +ISdFrKs6mCVGrNZdC3gX4VZUXA2IZStcpttEyXE/Lit7XK7ftqvfQfJ/oVfrQOAdhflm6Lm
 oIXTD1KskFxFusQGXEjB/YXG6oVVf4+b52DajG78kewIUALeR3w00ooGX8wvvOBSxJs6Qwck
 c7CqjgiLmHqW6/+nuNz2gBAGsYMm9lpJHbF19arw4DNE35NZwZvc+ERGxU1HybYjt2T8bcFh
 9jt016kJjHaKC49GQHMZaKI2iah3wcqDahVJEHgJCO4s/jZ9ceAos5XrdyUSHGDQZ8lwoviG
 orUn5EembvUhfVzYm1hp0dA+/SM/Nmhh2wHMJSoXXD8WOGpc8uQXMfdyW0UdGehDsvQzY8vC
 wyz4YvxJ673Rq/I2o2h+o1dHdWbn6MPb5ABAOZILlPlqvTYwF2R2eSjTm8gxU+E1CasXk6ty
 jEF2m5aPvLCl1StjR93rzx+F15TGmbYnl9c2t3q4F7CGTAtEtiyOPjXNvB70KhLn85hs0NOj
 DMZjUfZjljwN26zza5sjePH3dO/ORlAsXtSJAYN53D0HKkL4OF0ZwcF/hP5ZB/KZTFqekQS9
 +SfAeTMRL1A+4kwBauu34gISV4wUNUyM/A6VnA1iyVzXQ/Cf3dLBBaXLkdOcib9HWhaPCS0p
 l15OhF9NeYAyHUUJqhxq7WZTIYdU+Wjm6yUu0yqZdb+Yg1r6B+GpHHUT3OkFFLtS9OWPvcpQ
 c7euBc5ruEB6pEO+o1UAhd9kAylNuOIFAw2zaGSdMWTBUItTvjI9iN47D0srIhDU2KmRvoNT
 Ckglhg1saAexHG6KUTBK0xK1lHcUQQ6Hxt++WZao3bYT/aAN1rzR6fMnWndqVaR7XAMbIMrg
 xi69XgpZ7bSwPInCTRtyB8OKRA7iKORt6zGhuFHapt/8ahMVqBxous78jbtka6dRKLL2AZj5
 ZCb0oec4BqjSQjlpQ+1myKcZPMy3hV22d20HVAjV7i2o+v/WfdEwVnCGTi8+prdAgWFGOJg8
 TD+fWfz1Ln7lF+qMH+KHs=
X-IronPort-AV: E=Sophos;i="5.82,245,1613451600"; 
   d="scan'208";a="42104076"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=ICHXMs+9DuCf8T0ZrlwMCGXwgf8T9RzICNtms1QJ0BPTnOvcvHiXK637SqS0yW+Re1NneHApySo1B1qXfcsrcheUFdivxEPtbZB6lOfgAneAsvWwq9nagDW7zBLZlxcW0h2/IE1buVkEhvxuM5zbBoymTm104zNtnTRRa6HdwSSYOMeF72AFoh2mE1G6JfETMT8hVAph+VphI/6vA1+k8Dg1Wi4frvhli049rhD/KBJobP3yETAJ7ajTQoYsuQ+FB/w1o2Kvj+UJoM2DCPf0DXlYRVlZADzWDD+daKUiwTDI7shpe+1MGsB+Yq8Zuqk9NmDDfcJb82HX6Rv+H6jfNA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=/QNggnJrL6UwgR2bBdwckj8GkHrwg2kJom6UmPsQtCc=;
 b=KnmqOUMzz+X0HiWAEzDGnYU1J8GGrgYRpHi0tCbGEjwp45fOB39PgXpzv8+BSlrfkGF/TL+Qq7J5nlfqpJJnaU4Tv6IK9SW+OCS8F8fA4JwTkvR3gYCz6YwlPVGOpxgtiaI4G3/Xh/saenlmc5S/b+W8CByo3agIjHiIxNwkrmSLCw5Fyiv0c+F13vNidSVZhdclR2tz0NLtoHdjCGPfg0vxfF9i34poxIb3Eu6fXlITAqdBzFKtz0nyHXZuOPn6HyyvxMP1UXg96XTgffTucmTQ/RSmXW34tQTINck3u/KMZQBM8J9L2SgOvWKkeJShVi775TxDhWqH6YmaRiFzUg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=citrix.com; dmarc=pass action=none header.from=citrix.com;
 dkim=pass header.d=citrix.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=citrix.onmicrosoft.com; s=selector2-citrix-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=/QNggnJrL6UwgR2bBdwckj8GkHrwg2kJom6UmPsQtCc=;
 b=VVQNt9oV1ynsMphAmVMMjkN4/XVBghAQBE6TXxq3RBqku/XR9G5vuc2uljXtL3aUNf35MOMhutJ1aapKjlR8XQrTWvrGr+RcrWc5fn9tjCvtNntptb3ZmNuPjhX43WWCXODfcIO1DNIPkymPGVUAyjWeBHGbT5QH6VsG6SJ1o5U=
Date: Fri, 23 Apr 2021 16:17:49 +0200
From: Roger Pau =?utf-8?B?TW9ubsOp?= <roger.pau@citrix.com>
To: Jan Beulich <jbeulich@suse.com>
CC: "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>, Andrew
 Cooper <andrew.cooper3@citrix.com>, Wei Liu <wl@xen.org>, George Dunlap
	<george.dunlap@citrix.com>, Kevin Tian <kevin.tian@intel.com>, Jun Nakajima
	<jun.nakajima@intel.com>, Tim Deegan <tim@xen.org>
Subject: Re: [PATCH v4 1/3] VMX: use a single, global APIC access page
Message-ID: <YILXDfXfR69mwfHH@Air-de-Roger>
References: <4731a3a3-906a-98ac-11ba-6a0723903391@suse.com>
 <3e7ad009-f062-d58a-9380-103ce1573a73@suse.com>
 <837a427a-a74e-00e9-70c7-1d3cfa28b30c@suse.com>
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <837a427a-a74e-00e9-70c7-1d3cfa28b30c@suse.com>
X-ClientProxiedBy: PR1PR01CA0008.eurprd01.prod.exchangelabs.com
 (2603:10a6:102::21) To DS7PR03MB5608.namprd03.prod.outlook.com
 (2603:10b6:5:2c9::18)
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 22b2c839-5095-4288-c253-08d9066295cf
X-MS-TrafficTypeDiagnostic: DM5PR03MB3292:
X-LD-Processed: 335836de-42ef-43a2-b145-348c2ee9ca5b,ExtAddr
X-MS-Exchange-Transport-Forked: True
X-Microsoft-Antispam-PRVS: <DM5PR03MB3292497F289DDBD26300CF2B8F459@DM5PR03MB3292.namprd03.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:9508;
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: vaLlAiIPn9IA4I4e3Cz0YLLoFim/rIA6Wq1x/KP9MxOgkCIHOqqkeYjV1G8MGVzY4160VV1IGNAPnFpD/K1sRJNjGwc/OXI3rDnsgUNKLHsFAjsLA3NSzjUZ+h5vz+LyjJCaVfDPSrM7y2nOnTyZjcT4o7ZV6yg4R9zBBmX73rQoF5+FFjVjD+hZ+i0HUpzuqivMFUghajJoGbhQd+CH8aJUe3gYnjm5VIsX7r/Jn9wMgQLRlJfeqWvwsoxEBX34slhLpegNF1a6bZv4eU6bBC1WV2xcti0Ip6ZaA26pyZ930H+ZGqRAu5u3IhycjSZDYrgD7J5f/slkL5L5lnsScSjEJ7byziO7Yk3+d6/ukw/4/pnChdqcxYvow4uDdv0OaUL+QsBy2XTfSWOTkgonI7hm8A6icdTboSI49530Z4ofLfPiQfXQejgdZSRJzO91A5R5Nk1mDEDnBN2KWh7D9u2RKVm4gU6yIw79Zxwea1iWfIM1xhd/4xUepboGPrUcSiw/62vFpp+bwgeo2tj8Jil7fRwYykmIda8xb8/3mVlNllxXntj+YRqyof+z+/Y3VFOWO80jsikIaK2okory1JrFRzBnDg+8fZLADF0Nf8RXdtyQ41jg8pZn7vN1UGIuiJK62Chm08GOCVOAh7EqaA==
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DS7PR03MB5608.namprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(4636009)(7916004)(136003)(39860400002)(346002)(396003)(366004)(376002)(8936002)(9686003)(26005)(83380400001)(478600001)(33716001)(54906003)(6916009)(6486002)(4326008)(8676002)(2906002)(86362001)(16526019)(6666004)(5660300002)(316002)(6496006)(66946007)(956004)(85182001)(186003)(66556008)(66476007)(38100700002)(357404004);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData: =?utf-8?B?dDMxRzlNSDNuYVVBeFdJSWZ2WTZtZnJaandac2RVNHlYWUxXRDRUQ3J2UWdX?=
 =?utf-8?B?WERXY0JNOW1kV3BpUTU2dTJ3QzdQSFFRd1FhMXZLUXNvMU5Ec0QwekZHSEVo?=
 =?utf-8?B?YmhrcDlyc3dTblgzUjBhWU1QYUtRQ0V5YytJcW1tNXhyMGloYUZxMFh1dUVk?=
 =?utf-8?B?bUxVVVVDbUVmb2pubDVtY0R2UGY4VHdOQTZEb2p2SDhvQjZ5SmhSNW42TkZF?=
 =?utf-8?B?Q3pCTk11KzZRb0JVMi8zanlGUkZ5aTRhS05IWngvT2g3YWRRNTVMQzh5Zlhl?=
 =?utf-8?B?WGcxa0MwbjhHTlNXKzN2V09PRS94cTVyTjYwU3JSMTZlMk9RNytGL1hoYXdx?=
 =?utf-8?B?SUo3bnZUdFN2cDlCcEtuT2RNZWV5OXF4SjN1YldPMmJlUE84SzNvcytZMVFM?=
 =?utf-8?B?ZzJyblNnNDNiRWJRdlo4ZndCK1lpdmRVMmZ3L2o1dUlER3Z0dHBBaThENnor?=
 =?utf-8?B?L3ZrcC9rajZvM1IwR0NSOGVCejdQcDRPTGh1WGFqNmpob3VJZEdWSE0rSmpp?=
 =?utf-8?B?akMxNjVvV2tKdkJ5cEc2dnplL0E1NWo3cm9PWEtIM29CV0FhaXpJWnltUG1Q?=
 =?utf-8?B?YVFwbnpJT0Rxd1RERlJHeURFYndFN01HWEJMNk00YWtWSDNpdFcrY0ZJTzds?=
 =?utf-8?B?YmVUQ1o3SyszQVJWeDFHRkVsa2gycEtxSUFJSlR5QVF0T2xkamtMMnVWanI5?=
 =?utf-8?B?aDZsSU1iZldBUW9mb3FxaVBDQzAzUkxQNVplS2xmVXA1OVlHWnlQVXgrMUlE?=
 =?utf-8?B?RWRYMXptVlFZU09jN2VwR1NqSEVZVVpHSVdWMTRrMTVGTzlpVEJDVWFHakRs?=
 =?utf-8?B?NWROcVBxbEpNWCtGMzF4djRqQjNFNVpBNFhOcFROc2ZmejhjcndyaS9XQUkv?=
 =?utf-8?B?V2N2S2VrMFByQk1JbVp4eVA5Wlc0OHE5MVlpRGRXdytEbEtXMFA4RUQ5cThG?=
 =?utf-8?B?SkxWV0NBQTJyZUJZYUNPM3lxc0tYemZrUVpxV2RzUHlocDVxa3p4dXljMlFs?=
 =?utf-8?B?WUJjWDUzcmxJNVkzUTlteWlJdS83U0dLbVRQVDdkQlArT2k2UmllRHpHOXpR?=
 =?utf-8?B?RXRxZE0vbTFTWGNMRDJBdlJ6cW5JTllUK2kya2MrdWNpcWlhbk54OVpnYlYx?=
 =?utf-8?B?L2pISlJ1Vm83SEZOaXNZN0ZZVFRCVEhSaFFDVzZDZStvcStEMVhYU055cTNn?=
 =?utf-8?B?WmVsVG5FMklOUU04VU1KVE9NZURQbEgyUFAvY0xIM1Y5K011RHYwSFREVTZl?=
 =?utf-8?B?TVdYaXg5Y0p6RW9vY0xrc2tsbjRTcFZNY21GRHRBdXVRTHNzMVVOTW8ycEty?=
 =?utf-8?B?ek1NdzVaUy9ubkNTK281N3BtdStDL3Z6dU4zR25ZN0JqZmlmak9DQ1FTQm9r?=
 =?utf-8?B?WDNYbVRhUzJGVWJzeEhJb0VlaTFqMG42bm12K2tjbXBONmN6UnEvQWFxNzY1?=
 =?utf-8?B?MjNZdkUzSEN3aVRxZ1A1WHpWR1hyZlE5Z2xydUVzUUdvby80emhaVXNSRVZk?=
 =?utf-8?B?Vk1MNWcxcGx4dEpwVGEwSU1KVm5TendGYUg2RzlDeVlFZ2JCV2pleXJOWFVS?=
 =?utf-8?B?elVTVUlGZXFPRDdrdFo5bjZHZzgwdjJFK2VOYmdKRnRxYWlGTzJ6T25mT0w5?=
 =?utf-8?B?dGVvc0NIeXpaR0tQdldUeEtxU1J6NHdtK3NUNytnUFFSUVpaN3I1UFRNRjQw?=
 =?utf-8?B?akVTVGlkaWpPVXZ1Zy9QbkdiSk1uQmVYZWs0bnlkMFplNmlYek1WY0NRK3lp?=
 =?utf-8?Q?00xuGMoZYMdm1h4lL9xgikw4A2CsTTCocWgb0az?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 22b2c839-5095-4288-c253-08d9066295cf
X-MS-Exchange-CrossTenant-AuthSource: DS7PR03MB5608.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 23 Apr 2021 14:17:54.1729
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 335836de-42ef-43a2-b145-348c2ee9ca5b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: XiESHYR3cWPzPG9dNv5O/HmG1C1rJDnuK4Q3bVCEaWnSgKWCI/BN2BH9mssD5t73UUIS6q/uHMI7JULgOiMe7w==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM5PR03MB3292
X-OriginatorOrg: citrix.com

On Fri, Apr 23, 2021 at 12:52:57PM +0200, Jan Beulich wrote:
> --- a/xen/arch/x86/mm/shadow/set.c
> +++ b/xen/arch/x86/mm/shadow/set.c
> @@ -94,6 +94,15 @@ shadow_get_page_from_l1e(shadow_l1e_t sl
>      ASSERT(!sh_l1e_is_magic(sl1e));
>      ASSERT(shadow_mode_refcounts(d));
>  
> +    /*
> +     * Check whether refcounting is suppressed on this page. For example,
> +     * VMX'es APIC access MFN is just a surrogate page.  It doesn't actually
> +     * get accessed, and hence there's no need to refcount it.
> +     */
> +    mfn = shadow_l1e_get_mfn(sl1e);
> +    if ( mfn_valid(mfn) && page_refcounting_suppressed(mfn_to_page(mfn)) )
> +        return 0;
> +
>      res = get_page_from_l1e(sl1e, d, d);
>  
>      /*
> --- a/xen/arch/x86/mm/shadow/types.h
> +++ b/xen/arch/x86/mm/shadow/types.h
> @@ -276,9 +276,16 @@ int shadow_set_l4e(struct domain *d, sha
>  static void inline
>  shadow_put_page_from_l1e(shadow_l1e_t sl1e, struct domain *d)
>  {
> +    mfn_t mfn;
> +
>      if ( !shadow_mode_refcounts(d) )
>          return;
>  
> +    if ( mfn_valid(mfn = shadow_l1e_get_mfn(sl1e)) &&

Nit: I would prefer if assigned mfn outside of the condition, like
it's done in the chunk added to shadow_get_page_from_l1e. The rest
LGTM, so:

Reviewed-by: Roger Pau Monné <roger.pau@citrix.com>

Thanks, Roger.


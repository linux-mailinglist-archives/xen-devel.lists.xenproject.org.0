Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 6DD9C36685D
	for <lists+xen-devel@lfdr.de>; Wed, 21 Apr 2021 11:51:41 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.114250.217674 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1lZ9W7-0003eU-HK; Wed, 21 Apr 2021 09:51:31 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 114250.217674; Wed, 21 Apr 2021 09:51:31 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1lZ9W7-0003e7-E1; Wed, 21 Apr 2021 09:51:31 +0000
Received: by outflank-mailman (input) for mailman id 114250;
 Wed, 21 Apr 2021 09:51:30 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=wOap=JS=citrix.com=roger.pau@srs-us1.protection.inumbo.net>)
 id 1lZ9W6-0003e1-L1
 for xen-devel@lists.xenproject.org; Wed, 21 Apr 2021 09:51:30 +0000
Received: from esa5.hc3370-68.iphmx.com (unknown [216.71.155.168])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id 66bb021a-d33c-4e10-8abd-65d1d3fac78c;
 Wed, 21 Apr 2021 09:51:29 +0000 (UTC)
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
X-Inumbo-ID: 66bb021a-d33c-4e10-8abd-65d1d3fac78c
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=citrix.com; s=securemail; t=1618998689;
  h=date:from:to:cc:subject:message-id:references:
   content-transfer-encoding:in-reply-to:mime-version;
  bh=oTqMgQNTbljGkCNof0aogO2mCDJzupvG+kPHh72K1WI=;
  b=DyX4dNKf6nz9aF43a4FbTBhKAx8QFLaRAkXdRHIukMLKakrPHV28RwG8
   YP6Nsp3JF3iCxcArPe0HBuj6Kce5rKjAGayp0CpmF4ZQnRrPhg9EBSUgy
   ZASrPDVT3tYuvHSkEusAqsyKoJ+rJjJ3AyTloVbHXVHnSt5h/+qXBUzOz
   E=;
Authentication-Results: esa5.hc3370-68.iphmx.com; dkim=pass (signature verified) header.i=@citrix.onmicrosoft.com
IronPort-SDR: LF47+frCR743NAddzqk7PyL/Zf6bTHY4m+2kFim7M9cdNOiIgoBmm8tSTXb6CxzLceuYayl2RK
 +K/f7kwLKfa6Cmkd71fvIoHxeJGhD3fJv3ea6feymiKJEc9YQlEPByIFrVeUop0wSht0VEOsDD
 xUE8eczmbTq4nTtiSJSPAoXoXntzIJ7ukOkOGgOQscFsrihnJ9Ri4qxC107MGTYKjA5BTtzWGc
 kXPbforW3iZhiFPcsoXcbzzZ7+ymvP5VnKr3MvJeFAaLwrOvp/hc5Q4yCVy6+keKY/kPaiChal
 NzY=
X-SBRS: 5.2
X-MesageID: 41894874
X-Ironport-Server: esa5.hc3370-68.iphmx.com
X-Remote-IP: 162.221.156.83
X-Policy: $RELAYED
IronPort-HdrOrdr: A9a23:LEsSpqPnoj8UCsBcT3Pw55DYdL4zR+YMi2QD/3taDTRIb82VkN
 2vlvwH1RnyzA0cQm0khMroAse9aFvm39pQ7ZMKNbmvGDPntmyhMZ144eLZrAHIMxbVstRQ3a
 IIScRDIfXtEFl3itv76gGkE9AmhOKK6rysmP229RdQZCtBApsQiTtRIACdD0FwWU1qBYAhEo
 Cd+8pAoFObCAkqR+68AWQIWPWGmsbCk4jobQVDKxks7gSPij3A0s+HLzGz2BACXzRThYoz6G
 StqX2C2oyPkdGejiXd2Wja8ohMlLLaq+drKcSQhqEuW1DRoymyYoAJYczngBkUp6WV5E8ugJ
 3wpX4bTrtOwlfwWk3wnhf3wQnn118Vmgzf4HuVm2Hqr8C8ZB9SMbs4uatjfhHU61UtsbhHuc
 ohtQ/p1Os0fGb9tR/w6NTSWxZhmlDcmwtYrccpg2FCSoxbUbdNrOUkjTNoOa0dFyH34p1PKp
 gWMOjg4p9tADSnRkGclGxuzNuwZ280DxeLT2MT0/blogR+rTRXyVAVy9cYmWpF3JUhS4Nc7+
 CBCahwkqpSJ/VmIp5VNaMke4+aG2bNSRXDPCa7JknmLrgOPzbop4Ts6Ls4yem2cPUzvdUPsa
 WEdGkdmX85ekroB8HL9oZM6ArxTGK0Wimo4t1C5rBi04eMB4bDAGmmchQDgsGgq/IQDonwQP
 CoIq9bBPflMC/HBZtJ5QvjQJNfQENuEPE9i5IeYRajs8jLIorluqjwa/DIPofgFj4iRyfRGX
 0GcD/vJNhRz0yiV3Pi6SKhHk/FSwjax9ZdAaLa9+8cxMwmLYtXqDUYjly/+4WqJFR5w+gLVX
 o7BImivrKwpGGw82qNxX5uIABhAkFc56ild3tLoAQNIn7laLprgaTZRUlimF+8YjNvRcLfFw
 BS435t/7isEpCWzSc+T/WqL3ydlHlWgH6RVZ8Tlumi6K7eC9IFJ6djfJY0ORTAFhRzlwovgn
 xEchU4SkjWES6rr76kgpwSDOT2bMJ9nw+vHM5RpRvkxAehjPBqYkFecy+lUMaRjwprbSFTnE
 dN/6gWh6fFpSyiMlIlgOMzMERFbUOeBL4uNnXCWKxk3pTQPC1gR2aDgjKXzzU+YHDj+Ukpim
 v9FiGMYv3QDl1BundX77by/DpPBxegVnM1Tko/nZx2FGzAtHo26+ONa6ap+0a6a1cJwIgmQX
 v4SApXBjkr68G81RaTljrHKG4vwY82OPfBSJ45davI53+rIIqUtK0PEvNO5qx5PNT2vuJja5
 PHRyalaBfDT8850Q2coXgofBRuoH4/iPXyxVnL6nO70HNXO4uaHH1WA5UgZ/eS4GjvS6zWjN
 FXjdcpsfCxNWu0QNic0q3TZyNCLBSWgWPedZBelblk+YYJ8J10FN3ndBGN8ldt9hA3Nt31m0
 MTW74T2sGLBqZfO+gpPxtE9V8onumVJEQlsgbKEvYzFGtd+0PzDpes2f70srIhDU2KmRvoNX
 Se+yNb+e3ZXyHr789tN4sAZUBXYlM78nJs4aercJDREhyjc4h4jReHG074VL9WU66eH7oM6j
 58/tGThueSMw71whrZszc+AqVA9Q+cMI+PKTPJPe5D6NqhP1uQxoOs/c6olT/yDQKBVH5wv/
 wMSWUgKuJZijcji4Ur0i+9DozPy3hV7Wd20HVAjV7i2o+v/WHBO1pJWDep2qlrYQ==
X-IronPort-AV: E=Sophos;i="5.82,238,1613451600"; 
   d="scan'208";a="41894874"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=K0rWyxRg5E5mpumjWvkI7xKBC1bAiqSf4/+YnOvSQMMrvLm7vgT5dhu589E7g5/ViO9umG3WMUthfvDvrt+0n8JGgEGNycPkZwXgK3DK3BjU3keRd+K9XnSN44zbzXqbUZGScyGhR4Zy3dpaY+WrvRxeaG/3z0z57JYtSy6111gCZysCrmTYsBzbTxE4xwQBkjlv9utjRB/0WGEiLE00HhlpVOarLDx0hcZ9aMvSPGehcBRl2WPC1Ma9EPLCeLTl2ez4yosdyMfgnRxRuacUJ1MNUMWdMR0aXHxSrPmrK2AQC6X2AQFZ0J6C+o5DD0obJ7oZlQJy2DXQk1FOvt/agQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=uwNUfrZqu+DuUd2g4tbFwNBfv+P2RW/cTZIEI9eiZWw=;
 b=X3q11TSVTXyw28rEQflUbDBKz7RBSPOXM3LwE7D2I2XrSNu6ToF5mYWZX0yZcTzfjiOUxswEtwcp8xu+8Wv6Zbz4rbsbiR5Bm2PLu+TjP6a8QD3s30Z78K6UasjW9km9YGgDttXKEY2OQk/zvCwggQ7EpeOOzSiIUE9nW+kJlFdMwm2n+an+HP8juDKQHlFIRBKOSJsDVSu0dOlOnncLQYqMO1QDaDPoX5uFk6DKN5xmJDcvLQQS8xLV0r63u/uCOqcepjwD96aiI2IOrpxSDjYFznbGvOICxcKp/HdWnglj4mJ7P2oc324d1rpUaDOFBPmCH0O3lpefwUYJvd+4lg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=citrix.com; dmarc=pass action=none header.from=citrix.com;
 dkim=pass header.d=citrix.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=citrix.onmicrosoft.com; s=selector2-citrix-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=uwNUfrZqu+DuUd2g4tbFwNBfv+P2RW/cTZIEI9eiZWw=;
 b=FipwPRORFUuljiL7ETIeIbLdSW9s/o375RYk2iJODktFpTHbJyRZz8E8sdcXRPBcAwe6Y4FV4p8Jm8hylf7ZdJoJHs0M06M/32YTV4ZhgySSZdnLPe53M9proMzCkfomijtV4XH7w4+QQtBt7PcCBrTUShDvCitWW7Qwu8qIM7A=
Date: Wed, 21 Apr 2021 11:51:22 +0200
From: Roger Pau =?utf-8?B?TW9ubsOp?= <roger.pau@citrix.com>
To: Jan Beulich <jbeulich@suse.com>
CC: "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>, "Andrew
 Cooper" <andrew.cooper3@citrix.com>, Wei Liu <wl@xen.org>
Subject: Re: [PATCH 5/8] x86: drop use of prelink-efi.o
Message-ID: <YH/1mjZ+VI1ySusV@Air-de-Roger>
References: <b327185f-db31-50c8-ec76-6ef8f2fcfdfd@suse.com>
 <ea4fd135-fe9a-ecea-c03f-0b518b800d4b@suse.com>
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <ea4fd135-fe9a-ecea-c03f-0b518b800d4b@suse.com>
X-ClientProxiedBy: AM7PR02CA0020.eurprd02.prod.outlook.com
 (2603:10a6:20b:100::30) To DS7PR03MB5608.namprd03.prod.outlook.com
 (2603:10b6:5:2c9::18)
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: a9fbd881-1edf-4808-3fa4-08d904ab0789
X-MS-TrafficTypeDiagnostic: DM6PR03MB5340:
X-MS-Exchange-Transport-Forked: True
X-Microsoft-Antispam-PRVS: <DM6PR03MB5340BD2E40AC0B551B1802A88F479@DM6PR03MB5340.namprd03.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:311;
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: EEu5Ha9DhdOvJmCCeiNY7mLwA6F++p8pFrKdPHxdgY+s/eo2WIX4gu9IBqO5zUoAATGT3OIRXx8lvIxXCEjTsnRxW+iGv2A7IJ53NJZJhd1z8ZxCOWJqS4Iz9sR/aPTNC8Tsm7uCkeqp5PV0Rjjjdy4rPbRADyV9RFWC6GMxs3NEB17eIz5M0prGBxaCsmYkXLdxJv/ECZ7BU6XSMXDU4a5syfuUD+FhKFtWtmIP9UedSUlzX6Deo/XVywkaIn1v0ltiWYL9b6vUbqkwx/Iq6uoBPsOLgHo2CqjZm/H0wsdvH6+FiTj0sZy3RUMYO639mHUTliZ0CY6QX6AWHFn7aTQkeq8xI0YA9G96EpZMGu0AQmKAelZjlPb2YABohfpnD84asVK7KoUKeWBxB/enf7qCBg6aN16SzRgW5sMnHM/9m5gOWXbbeqw4zHTd776T66EtNXZNFMT7KqugPaM3wsgnT7hhErWlShlshqfGXZbDDzFKpSxp25DGDLcmZ7FlwVqjVUhbVyQ4RyRlzAV5jwuAQiEEMdePTY8F97bQ0hXR81wI3g7p9cyyL3cKb0+2ZBD5Un2JUlbF4/xgMS4HZpTv8tJY9X/gpTKhgb6ryjQ=
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DS7PR03MB5608.namprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(7916004)(4636009)(136003)(39860400002)(376002)(346002)(366004)(396003)(85182001)(186003)(316002)(33716001)(8936002)(26005)(54906003)(9686003)(6666004)(8676002)(6916009)(86362001)(956004)(2906002)(66476007)(6486002)(66946007)(558084003)(38100700002)(6496006)(16526019)(4326008)(478600001)(5660300002)(66556008);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData: =?utf-8?B?dFBleUNHblV3ZFd5UDJoMXJZaWk0R1B4cWV4OEh5SmFrOEVabEtyeWdHSlFQ?=
 =?utf-8?B?SlowRXUwQVJ1OHZhSGtrQXFrcEM3b1ZDZ2plMU9FNlNIa2RLTDdLWjUyS2Rz?=
 =?utf-8?B?YmhtZVpMYUloN05rUW5aa0c4ZFlNcXFBeXRWbnlwL2htRUFoNWdNM3h0RnhS?=
 =?utf-8?B?OHVXUlZkSy9yMVdOWXUyZjQ2WHRTbUlYeTBBaE9QWjVOUjE4Nnp3dEk4bXBT?=
 =?utf-8?B?NUV1NTBIZEF5R0JFbFBrR0g0YzlMMTRaMGNwMkJ3Y1huRGRTdUxOYWMwQmEr?=
 =?utf-8?B?eFplT1RJalZkWWpUTGJKUGlZRzRxbG5xL1h3WTJwOUNGMDM2MDFsVkp3a2VI?=
 =?utf-8?B?OW5od01kQTZHZHNTanE0cGtRd1REeDZSdER1aFFJN2RMdEY3cUFFMUVhZkV3?=
 =?utf-8?B?NEg5VkZ2U1BqandyWU5QcU52OUF0cHRYdUJTdHBpV3BsQWNwQUFySzI4Ynlx?=
 =?utf-8?B?MnZxbktKRlJQZ3EyUWsyblpra2hOdUtBVVNCdlNxUXNpU1kzb0NQc3BxeFFq?=
 =?utf-8?B?WkdMNUk5ZGFqQ0MzNkd5K1BLVTBJTlVnc3ZEdmh3Sk9USFQ2TkZiaWE4c1dD?=
 =?utf-8?B?ZVM1dmdHSDk2NFowWlRKMjF5TjdUU0p0bWV0c0ZSOFFhQW9zNGM0RmJIZjZD?=
 =?utf-8?B?RmtYaTRTMHI1cWNPQ1Y1eUJwN2REZjBpK0NjdHRrdlhaQ2NFVEFlKzM3NTAz?=
 =?utf-8?B?bGY2QVV5ZUYxK0d6NWxoTWZCMTI1WnBrUGFCNU54TVhnanZyUzRFalNZSnl6?=
 =?utf-8?B?Qmx1RVdEbTA0QVZHR3JvQVhTQ01yTHl0REova0pmSEhlbDloZDdkTXJsaFEy?=
 =?utf-8?B?VHA5SGlRc0dIeWZzelJuRzdSZUZLNkVqcGl2V1dXanFZbVBzM2tIZVJsR0RS?=
 =?utf-8?B?eG9RSlEwQnNiNk5JQjFGcDhHWldJcEtzQy91cGJ4NWJzSVhaajlhMmRCOThU?=
 =?utf-8?B?WDVFemlxaTRPYXRTSWI1V2Zldi9Ic0M5OW9FMHZabmZnVHI2V2dDdXJzMUJr?=
 =?utf-8?B?Q3BXS29ZSTVyOUZLL2IzQ1ZGQUVoSU8yOXhlaFRYYnFTcDVNL2Nxc1RNTXlt?=
 =?utf-8?B?N2tsQkg5NlhiODQrK01wbGVGR0s1cU1DN01nOURFd0FlVFJJVjc0WHRVVVE4?=
 =?utf-8?B?Nlc2cENqTW1DYVVLaXZnTVowanNqZVgwYzhkU1VtSi90SEhqRjNCMk54MzNr?=
 =?utf-8?B?cjhCdFIyemllMEowSW83c2xFbERocytjTWRXSEFzbXZuT0QzOUdIcnZQdUsr?=
 =?utf-8?B?SkFFRDFPelpQRGJBSnZVL2RVU3ZxRVFtSVFMOS9aWWlJbnh5L0ZhTWJUdmsz?=
 =?utf-8?B?cDg2RGJ2cVFWcTNyVjQ0SVpmTjhIOHZueTl6eU0zRFlqRUVEWStvdGphRnE3?=
 =?utf-8?B?RmZuWTNtUWdsRGV3c2JtdnAxM0xRU2hWdlM3aUZxVXYvQVN0OGNXUzFoMmdE?=
 =?utf-8?B?OTJSMzB1elJ3SkozL3hmQjR4MlM2dHdPaEdPa0k1b3VZMmpZbmVnR3BPL21G?=
 =?utf-8?B?TGpOSXJ5cUpGQWZOQUkxcFJuV0ZNSjJXWHBsTGZYUFo1c2JEK2l6a3l4c1d5?=
 =?utf-8?B?UmFlSnZ0OThpQnFMQjZrcUxYdWt2NU1GcGtUMkhFYWpYTjRuZ0s1VnJWemVV?=
 =?utf-8?B?MDQzcDJPd1hJRi9BbytuRjhOay8yZ3NCOHNrQ3VCME9DVGVPZmRNRnYvMDVh?=
 =?utf-8?B?bjBTNnJmQ3J6akJ5czJCWFJsS1pieWpZcjk3WjNnaDdid01GcGlVUXg1RU1j?=
 =?utf-8?Q?zDVtw2CXwB0jUgXl3Qdd9UF2e+WcQC65wR5z9ud?=
X-MS-Exchange-CrossTenant-Network-Message-Id: a9fbd881-1edf-4808-3fa4-08d904ab0789
X-MS-Exchange-CrossTenant-AuthSource: DS7PR03MB5608.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 21 Apr 2021 09:51:26.3025
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 335836de-42ef-43a2-b145-348c2ee9ca5b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: DIgHVEkPQGAEZ5ulJinOkCxKuuwfUP1TEjVE5cG4Ho6BBdeXNCf6EPjgPUOCgyGSEpcOzlLq2tw0c4+RyaSBZA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM6PR03MB5340
X-OriginatorOrg: citrix.com

On Thu, Apr 01, 2021 at 11:46:00AM +0200, Jan Beulich wrote:
> Now that its contents matches prelink.o, use that one uniformly.
> 
> Signed-off-by: Jan Beulich <jbeulich@suse.com>

Reviewed-by: Roger Pau Monné <roger.pau@citrix.com>

Thanks, Roger.


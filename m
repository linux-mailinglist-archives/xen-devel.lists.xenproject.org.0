Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id B41883669DC
	for <lists+xen-devel@lfdr.de>; Wed, 21 Apr 2021 13:19:21 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.114412.218039 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1lZAsx-0005xq-Ed; Wed, 21 Apr 2021 11:19:11 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 114412.218039; Wed, 21 Apr 2021 11:19:11 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1lZAsx-0005xR-BH; Wed, 21 Apr 2021 11:19:11 +0000
Received: by outflank-mailman (input) for mailman id 114412;
 Wed, 21 Apr 2021 11:19:09 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=wOap=JS=citrix.com=roger.pau@srs-us1.protection.inumbo.net>)
 id 1lZAsv-0005xL-4Z
 for xen-devel@lists.xenproject.org; Wed, 21 Apr 2021 11:19:09 +0000
Received: from esa3.hc3370-68.iphmx.com (unknown [216.71.145.155])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id da843a40-b44b-4c4f-afda-f69b858b15ce;
 Wed, 21 Apr 2021 11:19:08 +0000 (UTC)
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
X-Inumbo-ID: da843a40-b44b-4c4f-afda-f69b858b15ce
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=citrix.com; s=securemail; t=1619003948;
  h=date:from:to:cc:subject:message-id:references:
   content-transfer-encoding:in-reply-to:mime-version;
  bh=+6XvWl9bdtC2Nl6uvoRHyp7BUMwxIRSWx/YJlH7svZc=;
  b=FXoxGGRNXtWiGoN2tb2H0I5OoY/yjkjst1vStOoejtd3NxUdOR3yaXPX
   NA+Q2PFNUd/GqpDe4dxyy0ZDQSinQPKJL2bPiCPtJVS1P6DPgWOlv/Ge6
   3Js3DcH2Xj0aFDFo2gp+MnvmbBVtZyqULqzAh8p12iAjougnG+4J0d9KY
   4=;
Authentication-Results: esa3.hc3370-68.iphmx.com; dkim=pass (signature verified) header.i=@citrix.onmicrosoft.com
IronPort-SDR: GllPV41/79Qfm3pbm33DB67NAG4806KJMntX9qLE9bR6pKfshj1OdKliZWWG3jkFmg5D6u/V/d
 rZEZDh/kRMIYbnI4O4kHpIn7KScUeGKgGLLayJNL1C0HIK9UD7ZV8nhjSCYcs4netoJTClOx3d
 MPUheDRt915GHIP05v4nbKU5rBteTTN8KpnFe0ZQW4AxRHk0mdslNDBDDzfRfcV1a8Vyi0jU/6
 DiPq/P0+EgZ90mf96Gd+1ed8mr+gCyeg9odggpSKT+f8MCpHHvsBJVhc9JN+hhMvtnqhLSMQfZ
 xNA=
X-SBRS: 5.2
X-MesageID: 42070821
X-Ironport-Server: esa3.hc3370-68.iphmx.com
X-Remote-IP: 162.221.156.83
X-Policy: $RELAYED
IronPort-HdrOrdr: A9a23:Wcq7d6oX+PlNnfGGy9dT6kIaV5ubKtV00zAX/kB9WHVpW+SivY
 SHgOkb2RjoiDwYRXEnnpS6NLOdRG7HnKQb3aA4Bp3neAX9omOnIMVZ7YXkyyD9ACGWzIJg/I
 9aWexFBNX0ZGIWse/T/BS4H9E8wNOO7aCvgqPkw21wSBxxApsA0y5SIG+gYypLbSNBAoc0E4
 fZy8pcvjy7eWkWaMPTPAh+Y8HoodrXmJX6JSMcDxk85wWUyR+u4rj2Ex+Xty1uLg9n67Ek7G
 TDjkjF9ryu2svLsSP0+k3yy9BtmNXnwsZeH8DksKYoAxjllwrAXvUCZ5SspzYwydvfjWoCsN
 6JmBs4OtQ21nW5RBDInTLI+y3NlAkj8GXjz1jwuwqSneXcSCghA8RMwaJ1GyGpknYIh9133K
 JV02/xjfM+Znmh7UeNleTgbB1kmlG5pnAvi4co/gRieLATdaNLqsgn9F5Vea1wbR7S0pwtE+
 VlEajnlZBrWG6dBkqp2lVH8ZiHW3Q+GQq+WU4SusCZ+Cg+pgEG82IogOMYhXsO75Q7Vt1t4P
 nFKL1hkPV0QtYRdr8VPpZMfeKHTkj2BT7cOmObJlrqUIkBJnL2spbypJE4/vujdpAkxIY78a
 6xH29whCoXQQbDGMeO1JpE/lTmW2OmRwngzclY+txQpqD8bKCDC1zCdHke1++b59kPCMzSXP
 i+fLhMBeX4EGfoEYFVmyXjRphpL2UEWsF9gKd7Z3u+5ubwbqH6vO3Sd/jeYJD3Fyw/Z2/5Cn
 wfGBfpIsFt6V2qR2/YjBDdV2iFQD28wbtAVIzhu8QDwokEMYNB9iIPj06i282NITpe9ow6FX
 EOZY/Po+eeny2b7GzI52JmNl52FUBO+ojtVHtMuEsvO0PwerAThsWHdQlprT+6Dy46a/mTPB
 9Uplxx967yBYeX3zoeB9WuNX/fqHcPunSQTdM5lreY7cnoPrM0Z6xWFpBZJEHuLVhYiAxqoG
 BMZEsvXUnEDA7jjq2jkdgzH+HQd951hS+xOs5KoXfjtUGRzPtfBUczbnqLa4q6kAwuTz1bih
 la6KkEmoeNnj6pNC8CmugiCUZNb26WGbpCKwyAaOxv6/fWUTA1aV3PqS2Rihk1dGav00kJnG
 TuIReZfuzxDkNHtmpV1bvr911IZnyQFngAGUxSgMlYLyDrq3xz2eiEau6I32ydZkAr78sdPD
 vGCAFiaT9G9pSS7lq4iTyCHXIpytESJeTbFq0kaKyW8GiqMpe0maYPGOJ08J5pOMv1iPICVf
 uSdmauXXXFItJs/zbQimcuOSFypnVhrOjh3wf96nOkmFE4GvjfLT1dNscmCuDZy1KhYfmG0J
 90141o+cSxN3j8cd6Ax+X8aSVZJhbavG6xSKUJpPlvzNYPnYo2O6Oedz3CkExj9lEZCuzfkU
 sFWqR14LzbIOZUDoQvUhMc2mBsrciFKUsgjxf/DeA/d2w8lnOzBaL935P47Z4URnCbrAT+OV
 Oj4zRQ0vfMUSyEz6MbAcsLUBNrQXl5zHRp5+WZcYLMTC2sauFY5VK/W0XNOoN1eeygGb8KqA
 x97MzNt+iLdzDg0ASVmTdgOKpB/yKGRsy1aTj8VNJgwpifOV6WhLGt79P2pDDrSSGjY0BdvL
 Z7TyUrH41+owhnqpY23Ci0QrH2pUxgs2I220AZqnfdnq684GnaGklaNxb+mZs+Z0gLDkS1
X-IronPort-AV: E=Sophos;i="5.82,238,1613451600"; 
   d="scan'208";a="42070821"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=oNY3AsonH6vUsFjvmJK2W+JEub+lNW3g4TqxCbtA9L9ikDcg0uyL3itPfOkMXE7v8Yp6f5mZUFOVjApEU0sXzc7u9OWZDlcAXNVuuap/ueznHKX3kZvQyHHQIwBIDRYinnuWwOpsw/aBxv7U+My7Gliel79f2K9l2pCm2wzf2PrXhUi6TBU0mPDhtrY9Abhm23V/7g7udRqaJxVpb2gkPUysnwQ378a5SyO/qnfw3ALn74ulk+r6wuZw8gWDMcahSaVNCOLuEzz9/nUpE3afLwzy02DIVq8dsyAD6JMTDqrf/urPY3Bq0WA5Z4oeoafffV+EjEsdlSkOMFMcKU5q3A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=i0rv6HCAl+tFxlUdYXYcTMsYDgJDs6qM3Od7H15mVGQ=;
 b=i2e3qhDw96YZPhmcVde/cUKaH/K2f1lTbXer/v9N8Sn8tKupNb/SqGLFEAtRK/ki0jMQ06a59oKKLWuq+5xUlSAkL/XjdIjqFnx3L+czO9COoh/RVpum9BxiSA1JlAVgh03eL+i+PIpnA2KzSYxhQnOhZ/wnOtjda8LmuRMwXRo0UnzYZdahLY4IZbN8uZeJANdmMZyMqUKueJh2EW9uvdPsuytxWTPGjpLSujuewevW+KDBNW1A8vTSkERG7yS7VW4xBuv92UQgZIXVrvATORMBK7x8x2Upq9Qw+Z+Zrxj+8VnZxaLa1Afl683SxpUNbGpcQX79zhpfF+ISk4rNXA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=citrix.com; dmarc=pass action=none header.from=citrix.com;
 dkim=pass header.d=citrix.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=citrix.onmicrosoft.com; s=selector2-citrix-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=i0rv6HCAl+tFxlUdYXYcTMsYDgJDs6qM3Od7H15mVGQ=;
 b=tb5XmC+g4xiXL17ajXPNMggH1MHGsw/njyRqbvi8LP10M7TF2PRcRlM8jqNshB4QaoB1A/zlHFMwiL5X3mcDt+3aJ8pziT5JysRSEnXKymbqq9D+DakcZkKZeUUK6u+w5P/X4tv2TnpM2cdqUWs97WkEsRBeoF6P9lZE+W1fgfc=
Date: Wed, 21 Apr 2021 13:18:59 +0200
From: Roger Pau =?utf-8?B?TW9ubsOp?= <roger.pau@citrix.com>
To: Jan Beulich <jbeulich@suse.com>
CC: "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>, Andrew
 Cooper <andrew.cooper3@citrix.com>, Wei Liu <wl@xen.org>
Subject: Re: [PATCH 8/8] x86/EFI: don't have an overly large image size
Message-ID: <YIAKIx0JuYDzEKqK@Air-de-Roger>
References: <b327185f-db31-50c8-ec76-6ef8f2fcfdfd@suse.com>
 <26ec4a83-cda9-5193-d797-357c05b26ab7@suse.com>
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <26ec4a83-cda9-5193-d797-357c05b26ab7@suse.com>
X-ClientProxiedBy: AM6PR10CA0098.EURPRD10.PROD.OUTLOOK.COM
 (2603:10a6:209:8c::39) To DS7PR03MB5608.namprd03.prod.outlook.com
 (2603:10b6:5:2c9::18)
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: faab6208-4c1f-4725-7118-08d904b7465c
X-MS-TrafficTypeDiagnostic: DS7PR03MB5463:
X-MS-Exchange-Transport-Forked: True
X-Microsoft-Antispam-PRVS: <DS7PR03MB54633614043D7209A0D59FCB8F479@DS7PR03MB5463.namprd03.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:7691;
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: sK+kk+HZzgO/FZz06Rwel3ouNptvswj+RaJeL+l5TOX9L7e9SzQ690eY9PD1k9OQ4Z+3oOsUgg1KRJ2/la4b1SVN5JN3eGgYhvI2sx34VqfeJ9N4oKDnBfwi1XmyTyzOxUEY/xIindm/KkrCGmlAbOcHbYjIju+IYqWGA3yeUx8cRc4ohOyvaWmai98AkKg/WrXuYOca5+PyPd+MhvZVMFVfGXw3eJXQUhJDDSxBrRG+pfRxHTB26hjbgIoSfR0T8ZR6zmxXmmArVQn2K26ckaU2+K02ELD0Z8ng5e+rZi1VqpTt96wEJLGOdN+L6172OKeYe6Ps2i8fKJ75esDEWo+asPR7VislWjDpFoKbGkBieQMrDiRqISuTdqgeqn3PdgZuvJqAAbBzQaCJ0WfYHETOQq+tcCS3YRU0pT/JcZABn+nWERL8g7c96T7uzq+KBdDJtiuFXACQUc3fk42XIdNQ0PY8cZiGAbXVrAdPXFLJ0rUmIVfWAt4iPi0my2pDgSMUkoMpYSpP+FPsKGBsIVVaQNgUV6vb4noHPCSPz9Py7whBeQByQNGyaItMlfQsECufHFkOe/5SOF/lccdYiZk6gxCkXO2VyflEinvoGiY=
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DS7PR03MB5608.namprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(7916004)(4636009)(346002)(39860400002)(376002)(396003)(366004)(136003)(4326008)(54906003)(26005)(478600001)(186003)(6486002)(6916009)(5660300002)(6496006)(6666004)(956004)(316002)(8676002)(2906002)(16526019)(86362001)(83380400001)(38100700002)(85182001)(66556008)(33716001)(66946007)(66476007)(9686003)(8936002);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData: =?utf-8?B?OEF2OEFCOXdjLzRhZDVJbzRvd1Flc3VzSlowb04vNmYwVHZBSXd0NC9TN2ZV?=
 =?utf-8?B?TU8wRG8va1JNdCtCVm92VGZtMWUwTm4rZGo2Wk9MeUtvVHI0QmRzdFYxdlND?=
 =?utf-8?B?N3gyckc5SGgxVHl5cko4aGl1dXZHVXNNMENicGhGSWUwMjFQU21sajJITDNu?=
 =?utf-8?B?VU9Jb0JqZnBuNmc1ODRoTG10dFBtSkVUejIwSTJ3M1c1ZjV1TkhiRlNGMGxF?=
 =?utf-8?B?ZWFrYWdCbXJwcFhteUhqRkd6RzRaZS9oQUs1bUxzeEhkNUQvY1JzaERRSXU3?=
 =?utf-8?B?a1ZjM3ZCMDF3cjlUY251SVdpdVd0WlFMeENBYzhmVE43UEZIR0R4NjgvaU1w?=
 =?utf-8?B?VHlJM1FhdEl0czEzVU1QSDMrQmlKQTRMUHZEc1htektYNUY1Ry9LYTJVWFV3?=
 =?utf-8?B?M1UyS2VmL0MrQnNMWU54dmRPaHZmMUk2eFFYbWRPejh5NGhQOVBzZkdranpt?=
 =?utf-8?B?cjhXUW8xSDFOeUlDSFNVL3ZxY0MzbW9ZT2o2ZUNNQ3VkWkJITVBtaXMzSnhO?=
 =?utf-8?B?ODFGRWZpTHBES3NTODlvTjdDek50M2pYbFEzc3FzSjdpRFBUT0NjWk01aVVk?=
 =?utf-8?B?SjdTSjkwQnhJNzBsTGNIbm81Y3BTdmM0OEY0eDd5NXRWZjVuVWNVUmpQYlV1?=
 =?utf-8?B?anUwRnRzQy9MUEJtM053clZkTnBHMFlhNnBHUDA3RFNMN0hFUmo5TmFLQ3ZW?=
 =?utf-8?B?MWdsNys1THplakpCbjlCRHhFOVVwU3lIc0lucStiNFY2cEtWdkVTcU5pTEdF?=
 =?utf-8?B?dUJhdVdjL2FzblBUajdnOVhaWExGQmRwRmxVd2hmK3hJaXE4OG03SmlabnBx?=
 =?utf-8?B?VFdTZnQ2ZkhkbXRpcFZtMTd0eWUyc2ozZnN3UzJ2eDZaWVVJZ1pxSUpRSjF3?=
 =?utf-8?B?bFNZY3lBcjJKeXdmV0tpTzF2Z2d2OTFvOG4zUDJPNm1XdDJKdk5CczA5aTRO?=
 =?utf-8?B?dG9WVDZYT2tnSzRkMmorc0tPZUlCczYrb3NSVDlzSS9PcFk0V1QxL1oraVY1?=
 =?utf-8?B?Um9NY1d4REd6U3gzaWw2LzlZNUtocE8yR1VnQzBrWlAvRVAzeEllU1pCL3pJ?=
 =?utf-8?B?TnMrMG1yS25iZ0Jqc05YM1pLSS9QRlVTS1lEeGc0VXJZcHNQYTRveDZHN29I?=
 =?utf-8?B?RXZXb2dVa3dpWUZXUlM4Q0pQWDVabzJIa0o5bURwd0JSMkVnOUR2dk1aWGg3?=
 =?utf-8?B?OGNZV0FmcUhkcmp3NS9TTmI0aG1rUnNRY2U2WmRGSFpGRURGa3VUYlVGWlpy?=
 =?utf-8?B?NmlYMkphR0FxR2R5czhUdURNWVErSzJpYUdQL3U0T1JFdlowanp0eFVZQkNP?=
 =?utf-8?B?TTdoTmxwejcxQ2xnc1VpWjJ4aGtXZDJwSU1obXllRjZUVUEwakphc0Q2elE3?=
 =?utf-8?B?c1VMbnJ1TVVYc05LNnlCM0NiV3QzUHZ4VGllYWwvby9sdG94dDZTRWJ3REdB?=
 =?utf-8?B?REJ0OERmQllMa1RqM0lRZ2ZtblJYL2xMeUFTZFRQV3FuZlBpUUZVZ1doK0w4?=
 =?utf-8?B?NllrZTF5cUovQ0E3clF5UXY1d1JKTDd6cFhPYWltSnROQWdDSkdkYkRMU3Iv?=
 =?utf-8?B?Qy9NZjV3d081eGhJS3htVkdpdnZsNDc0aGpZRTFhekZBZUNvWXhsbDZ4SUJy?=
 =?utf-8?B?VW94MTVxZUpWUlRMQXFFUDF5TUswYWhWTk54N3V3UEdTZmpuT3YwV1ZsMC9E?=
 =?utf-8?B?ZDdXTnNUUUxIK0xJcG4xcDhKZ05FcFFETC9NRzZUdDNHY1IxVnQ2OXIyNElY?=
 =?utf-8?Q?NopDi5PzrT4Eu8NVO282aM1KRgtaytFO/4KvaLw?=
X-MS-Exchange-CrossTenant-Network-Message-Id: faab6208-4c1f-4725-7118-08d904b7465c
X-MS-Exchange-CrossTenant-AuthSource: DS7PR03MB5608.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 21 Apr 2021 11:19:05.7756
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 335836de-42ef-43a2-b145-348c2ee9ca5b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: e5JwKZmBnbJU8AOuU/ugGCnwX6eyDK3hMli+NWHnhrGSALCOh6NVUC3RvzKnG1wvrDYS+xQhwhtQ6zD808MjBw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DS7PR03MB5463
X-OriginatorOrg: citrix.com

On Thu, Apr 01, 2021 at 11:47:35AM +0200, Jan Beulich wrote:
> While without debug info the difference is benign (so far), since we pad
> the image to 16Mb anyway, forcing the .reloc section to a 2Mb boundary
> causes subsequent .debug_* sections to go farther beyond 16Mb than
> needed. There's no reason to advance . for establishing __2M_rwdata_end,
> as all data past _end is of no interest at runtime anymore anyway.

So you just expand the load size.

> 
> Signed-off-by: Jan Beulich <jbeulich@suse.com>

Reviewed-by: Roger Pau Monné <roger.pau@citrix.com>

> ---
> This makes more explicit a possible latent problem with the ELF image:
> It ends at _end, not __2M_rwdata_end (advancing . as was done here does
> not have the effect of increasing the image size). Interestingly the
> conversion xen-syms => xen rounds up the program header specified size
> suitably, as per the comment "Do not use p_memsz: it does not include
> BSS alignment padding" in mkelf32.c. I do think this would instead want
> taking care of in the linker script. Commit 7a95e0a2c572 ("x86: properly
> calculate xen ELF end of image address") clearly only hacked an existing
> hack rather than addressing the root cause. Thoughts?

We should likely define _end after __2M_rwdata_end to account for this
padding?

Thanks, Roger.


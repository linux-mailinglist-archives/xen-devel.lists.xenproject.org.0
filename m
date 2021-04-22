Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 00687367AFE
	for <lists+xen-devel@lfdr.de>; Thu, 22 Apr 2021 09:23:24 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.115058.219370 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1lZTg9-0004OY-So; Thu, 22 Apr 2021 07:23:13 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 115058.219370; Thu, 22 Apr 2021 07:23:13 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1lZTg9-0004OB-Pd; Thu, 22 Apr 2021 07:23:13 +0000
Received: by outflank-mailman (input) for mailman id 115058;
 Thu, 22 Apr 2021 07:23:12 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=96sM=JT=citrix.com=roger.pau@srs-us1.protection.inumbo.net>)
 id 1lZTg8-0004O4-Gg
 for xen-devel@lists.xenproject.org; Thu, 22 Apr 2021 07:23:12 +0000
Received: from esa6.hc3370-68.iphmx.com (unknown [216.71.155.175])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id f861bf08-6e79-4c23-81a2-2876dae46bb1;
 Thu, 22 Apr 2021 07:23:11 +0000 (UTC)
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
X-Inumbo-ID: f861bf08-6e79-4c23-81a2-2876dae46bb1
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=citrix.com; s=securemail; t=1619076191;
  h=date:from:to:cc:subject:message-id:references:
   content-transfer-encoding:in-reply-to:mime-version;
  bh=MGU21dcwy4/F/9sttZ5V6hOLNWQ43DsWpoZ8xeeo+4o=;
  b=ih3XoDfYY/JSnK00pZlI5HmD59oncy9na2sS9Yrs7lA42EzskCC7h/kF
   SkT6u4WgmyARfUqqJgj24wYRmaTza6wOj7hcp8SnNJXzvKBqhA6uU29xj
   /6dRLGU3Q+DJmRtCG9yKYZvYRm8qoKwjBBoh5pf1KHZzasFEFmhr8S1MH
   Q=;
Authentication-Results: esa6.hc3370-68.iphmx.com; dkim=pass (signature verified) header.i=@citrix.onmicrosoft.com
IronPort-SDR: jwV2DPrJcKekfuIgK3f76dg/qK9E7zbnH4xPRoRTpML6ONeww0oQaiEzofIgThQzOIE/Y73il/
 oSdXlU0VjI1Mp+S54UWM4iPDfDbU8NByOynDPKLwA/rPSbNabAXXzzNewv2iCMajNHH97GPdHR
 9vuATVun+AxCW7rd+ax+xp7jDN9d4MI5ui5vAmFkbhnMJCmI8zKCBZMxiJlkd+8NQw/pBV/VQF
 rwP5/iXlxBhXxJ1e14iEdmdjnfruCUZC3JrwoIf7LJJXQD4Qgb5Bs32LCNnAjVE6M4US5u4ZrR
 VlQ=
X-SBRS: 5.2
X-MesageID: 42275012
X-Ironport-Server: esa6.hc3370-68.iphmx.com
X-Remote-IP: 162.221.156.83
X-Policy: $RELAYED
IronPort-HdrOrdr: A9a23:8hcHxKCLVTndyVflHegetMeALOonbusQ8zAX/mhLY1h8btGYm8
 eynP4SyB/zj3IrVGs9nM2bUZPvfVr1zrQwxYUKJ7+tUE3duGWuJJx/9oeK+VLdMgXE3Kpm2a
 9kGpITNPTZEUV6gcHm4AOxDtYnx529/Lq1gPrFpk0McShBQchbnmFEIyycFVB7QxQDKJoiDZ
 yH5tdGoT3IQwVrUu2QAH4ZU+/f4+DRnJX9bhIcQzIh4g+CjTSngYSKbySw9BEYTj9J3PMe4X
 HI+jaJnJmLntOa7lvn12HV54lLg9eJ8Lp+LeGFl8R9EESIti+Gf4JkMofy2AwdgObq01oylc
 mJnhFIBbUN11r0XkWY5STgwBPh1jFG0Q6Q9Xa9jWH4qcL0ABIWYvAx/b5xSRfS50o+sNwU6s
 sitAj1xvknb2K0oA3H69fFTB1snEavyEBS6tI7tHBDTZAYLIZYsI13xjIkLL47ACn45Io7ed
 Medf302fA+SyL8U1np+kNrwNCqQ00pGAaHTkUoqqWuoklrtUE84E0CyMMFmHAcsLo7Vplf/u
 zBdp9ljbdUU6YtHO1ALdZEZfHyJn3GQBrKPm7XCVP7FJsfM3aIj5Ls+r066MyjZZRg9up9pL
 3xFHdj8UIicUPnDsODmLdR9ArWfWm7VTPxjulD+plQoNTHNfnWGBzGbGprv9qrov0ZDMGece
 20IohqD/jqKnarMZpV3jf5R4JZJRAlIY0ok+d+f2jLjtPAK4XsuOCeWu3UPqDRHTEtXX66LW
 AEWBT1OcVc/mGmUnL1m3HqKjbQU3262ag1PLnR/uAVxoRIHJZLqBIphVOw4dzOCTAqiN1zQG
 JOZJfc1o+rr2i/+mjFq09zPABGM0pT6LL8F1dDpQoANVLIYa8O0u/vPlx67T+iHFtSXsnWGA
 lQqxBc4qSsNaGdwigkFpaBPn+FiWAQ4FaHVY0VlKHGxcqNQOJ4Mr8WHIhKUSnbHR18nghn7E
 1ZbhUfe0PZHjTyzYO/jJIVA+nbX8JmgBiiJPNVrX63jzTfmegfAl8gGxK+W8+ehggjAxBOgE
 dqzqMZiL2c3Qq0JXAHm+Q+Ol1UYGGxCLZLZT71Irl8q/TOQkVdXG2KjTuVh1UWdnDx/0sfvG
 DnMBaZYOrGGFZbp3Be3Jv76V8cTBTuQ2tALlRB9aFtH2XPvXh+ldWGYae+yEO9QFoPyON1Ck
 COXRIiZidVg/yn3h+cnziPUUg8zpI1J+rHEfAIaLfIwE6gL4WOiIALF/JZ54xeKdjrq+MHON
 jvIjO9HXfdMacEygaVrnEqNG1Is3Eii+rvwwCgw26i3nIzaMCiaWhOdvU+GZW74GflTfrTj8
 k8otIxoOeqMmL+LvSB0rraajZfKhXV5U66JttY3qx8jOYXjv9UGZKebB7jkFdg9z86JN3vlE
 wfTL9giYqxcbNHTog3QWZh4lEtlN6zN0MlvQz9P/8mcTgW/gvmFuLMx4CNlKEmDUKArjbhIF
 Wz8yVS+PHeQiuIvIRqfZ4YECBzaEIm7m5l8/7HX4rMCB+yf+Urxiv2DlaNNJtcQrOCA7Mes1
 JT5MyJhfaec27d1BrLtTV2ZoJI/GDPe7L/PCu8XcpJ+ce9I1KCn++D59Oyli7+TX+DUHsj7L
 c1PXA4X4BkkTktjIo+zyi0ROjWmyse4iVjyAAisEXs1Iig6HrcBmdcP2Ti881rYQU=
X-IronPort-AV: E=Sophos;i="5.82,242,1613451600"; 
   d="scan'208";a="42275012"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=WbS/MzI47bgLGBLlrO4Wu8m4J789EPXIKa7oWPLyR93C/h+Kd8uT+keV9vxmnNk8cNk6o2WQYkyPyxu532UpT/3GvbBLubQqoux4PY0FMRC3p2neoP5NvWSD7ps6JhPr+rUWbuCXup0l0iefoIjBO8zemO/Qis1iT2HTPB4sV9l3dBQz/yjX11QQVzTX4+f4vcoD8fX1dWKfvwIDbH+Z46fPnKDJ2mVh0RecpmkIQojCxnkzn3Q1+8WvVisKVCFPJHL38k4jmGB9KEuQUPz0R6XF9cUnq8aFioNhaRfLYoj2L5yOORQj1A5R77DCg6EPSvSDSPngBGrHWeg4b9AY3A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=ZGL4S4c0BZuBJAU++1R4375StHhL2YMgVWF2It/ew2I=;
 b=FfbI3YMCQo6rNXWhfXC5d/kHjkvwjOfyEpE2fIxOlmw7KaeUtXxOINp2r9FUg1xmJsgiJz+lKvOwHcJXbcIDoI1W4ayBlrcoruZpWhm5fnGFZvW1CRP6eewcejvHRh3LHyngHjsJIdSvd3FNvbJApruj+evb9rGF2EdD5WBKCaLgIzNtdzxiAQHyUTenbMlF6qzn8DwWZzluBUm7B3vGqGbcMV20fr9oqXd4RADebklUiiVM3f6SDgiUoyUOWSuyKLgKYjV8Uf2erV4WVkMEpIRop7AdlDbV/B+7iavT/1KB4N9rwBAvOiHORGvbJaZsJnnCU0Ktu01L6//HPSo3tg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=citrix.com; dmarc=pass action=none header.from=citrix.com;
 dkim=pass header.d=citrix.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=citrix.onmicrosoft.com; s=selector2-citrix-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=ZGL4S4c0BZuBJAU++1R4375StHhL2YMgVWF2It/ew2I=;
 b=ZClla/MP2V23oN8wBuKlKkulKh+uQ9FT7MX/6k/zVJYKSAjNHSrH29QMkNPbIKT00/m1WLEpfHhRX10mr2Q4VGZwzPM97sgy/dZimaw72tRFPSeCzpis+wNeDebnqqbEeTE+sfCeQJl5HnPNUbiGkjAKPX/LKU3QH+0Z36ixkQI=
Date: Thu, 22 Apr 2021 09:22:38 +0200
From: Roger Pau =?utf-8?B?TW9ubsOp?= <roger.pau@citrix.com>
To: Jan Beulich <jbeulich@suse.com>
CC: "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>, "Andrew
 Cooper" <andrew.cooper3@citrix.com>, Wei Liu <wl@xen.org>
Subject: Re: [PATCH 6/8] x86/EFI: avoid use of GNU ld's
 --disable-reloc-section when possible
Message-ID: <YIEkPorW1vEibACD@Air-de-Roger>
References: <b327185f-db31-50c8-ec76-6ef8f2fcfdfd@suse.com>
 <ff15338a-ca10-ff38-3c2a-459303ce9d68@suse.com>
 <YH/8rb0aENMqOLAn@Air-de-Roger>
 <dada98e8-3e4a-94df-0678-bdd2a0e8de04@suse.com>
 <YIBC1XWTQzjykk1k@Air-de-Roger>
 <fa822374-ce07-473d-b6b6-2d8073ff83a6@suse.com>
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <fa822374-ce07-473d-b6b6-2d8073ff83a6@suse.com>
X-ClientProxiedBy: MR1P264CA0016.FRAP264.PROD.OUTLOOK.COM
 (2603:10a6:501:2e::21) To DS7PR03MB5608.namprd03.prod.outlook.com
 (2603:10b6:5:2c9::18)
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 7671afaf-d28a-451a-1616-08d9055f6cc8
X-MS-TrafficTypeDiagnostic: DS7PR03MB5606:
X-MS-Exchange-Transport-Forked: True
X-Microsoft-Antispam-PRVS: <DS7PR03MB56060E22ABA042E124E8BA7C8F469@DS7PR03MB5606.namprd03.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:9508;
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: fZydBOjYoy4WopUhVEV4yDVV+GvPRdud6rnpZNHBoNuJIr84+Yyi8JvvGCMK9J1I/UnDXRynaYI0x3iE6h6alh80h+ty47g6kgs+V7ASEUkALWaIOdMnOctA9pO0aU8pRGK2Wzw71GNPM5hD9cVeQFdtHDDLWkPoZe7xnrX0wPV0P0dts1ZWP8neC+rNNG4Dzogc4XY6r4dy307+YWa5eu+usrstbhT5sUwbagTyl86+jJEMSrWLOjn+/3Aof9lcVu+kM8pEdpq5UcvSxRc3hVLcGv0bnWJCDIgygWPlo+NlqcudXrv3Yicb6vLcw3lMuk+EB0VFLVN8wZbSSdp4TCFhe4oqM6gv6CmWwbiYksZ7TE38QYoAMH4Q/qPRSgZhmNLS2bi7p/lpRlYK16ioFV10SZqcCkp/JQynY0f4mHRULtZUXqNlRDud2J16XK03jKnJUkRaIxDenlGGPSPIWC23+LgK9arGBzeciObo2MWia+uPI++I4/uP2L9irnjJdK4fjjxLrcB4bnqtq/LOLTobUmfxNQtKRIsOWzggDw5fHdkjkVJOUyK7QUlGo+zJM0bdplUe9fF2YnfqhwF0x68S+G3TStgXkcTUNr2GOZY=
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DS7PR03MB5608.namprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(4636009)(7916004)(346002)(396003)(39860400002)(376002)(366004)(136003)(6666004)(6916009)(6486002)(4326008)(86362001)(66556008)(478600001)(66476007)(66946007)(5660300002)(2906002)(33716001)(9686003)(956004)(83380400001)(186003)(16526019)(38100700002)(26005)(8676002)(54906003)(8936002)(6496006)(53546011)(85182001)(316002);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData: =?utf-8?B?UUpkL1A1OHRJNXVjYkRyNVdNVUpZV09jWFYxdTUvMFZMaEh2OTJZQ1NpN1M5?=
 =?utf-8?B?NTRJQnpzRXFRemt4UWZzWVpLVVVUZVNhK3FmVU1JQytXSmVxdnIvZWZ6cm1X?=
 =?utf-8?B?SG5YK3VhM3NsSS81eVlSYm5pNzFnYW9LTjlIUkhtVmNGQnhyNDZubmpQS2Va?=
 =?utf-8?B?QjV2Z2JJb3g5ZDBiTjVVOHJaNk5lUEFEOG1UMVZlN0hIREtSQzN6K1VuWEo4?=
 =?utf-8?B?R2lwSlpLRXk5QXc5VXllMTY5UkxtSG1objVMOVF5YTF1ZUNaN0xNRm1yYTND?=
 =?utf-8?B?Rjk0UUhEMjEzZlRab0RibU9vVXRweWg1RHlxWkdvUVd2MGRUcUVNWHpjK1NM?=
 =?utf-8?B?U254SkI0SmNSYzZsRkpxUHoxOTFFSGpSSGdpSEdmUXpwb0FMZ0hQTG9jTks0?=
 =?utf-8?B?azl2OTREc0I3NlZIcmFpTEY4UW9yUzV4ZitqRnFsWTRoVDU5bGN6M25pV01a?=
 =?utf-8?B?aTJTUmUyQjgxc1BsZnduc0U4SXErdXhrSkV6R05oVlg0T2VqUDQyVU5tZ1Fj?=
 =?utf-8?B?QllHUjlNaDVFNWh6SEZYYTZKb1lOUGs2WFFsa2QrNG9uNDA0NW44WVNNeTls?=
 =?utf-8?B?VjQ3elhlcjVDUWI5L3dGd0Jwb3d5N0t2NHNhbjZ5MVNic2xnMHBzMFMydUVN?=
 =?utf-8?B?b0J4OEsydUN6ZzB6VXQyRkVrSGFrWGpVOUdEbS9nRXdlUXNBYXFFNWlWZG5C?=
 =?utf-8?B?SUl6TlkzandOemJMODFvbkhWcE5hMStJYXlsb2V4NE1GU1VycUx5NnZBV3hn?=
 =?utf-8?B?Znp0NHRyTHN1bjM2em81Vm9DWFB3MVVaRVJNak1NNlZJVFVCeFd0NWhHYzVx?=
 =?utf-8?B?WmhQMWRnQVZJRXBlWW5lK3dUc1FRU2d4Sy9BUWRJNDdJSWUyOHp5ZTNiaHB3?=
 =?utf-8?B?K0hmRFpURndkbXNjdmlVRWlNTVJEQnlZZnoybnY3aDQ1Nk9BTzVuSENkUHYw?=
 =?utf-8?B?blBEWlRwUUpnS1lieTh1djRQVDhWdmgxT2k0MGlHdU8wbEpHQ3hkalJFeDBs?=
 =?utf-8?B?L3hETmJPWHZjZk5mNTFZUTZ2aVVuWGNTOUprcVVXTHBsZC8zV01ZRFpyRWdS?=
 =?utf-8?B?RzN5R05iSjhiUVlMY3V4ZUNiOW9PUEZUbkhUQ1I4NUN4cWV3b3ppM1N6TXFC?=
 =?utf-8?B?N0FIb2J5U3QvcHhOeXNBZ1FGd2RhaWlodGN6WTdlQVppMXZ1SlhQUU1CYkp5?=
 =?utf-8?B?OXlFMW5RTXc4WUdWNW5EeVZ6dm1HZFVmZHBCcllaSzRDODRyajRsaExHVlg1?=
 =?utf-8?B?bHNLZUVibkFXQzd2MmFpb0V5WVFQSFBiNVYrck9OTEVWZmVHNnk4dzZ4dlRn?=
 =?utf-8?B?RkR4WkN1bHpWR0hocEowS1hqbDVkM2tTRmZlOUcwYy9FQWNnUHB3MmN4clY0?=
 =?utf-8?B?YlA2ckUraGp1c01SaGJYaW1hMFZRQmxVNlRKTDNvL1R1YUl1d0ZvbnBZUWdr?=
 =?utf-8?B?MEszTWh0Wm1qV0dBcW9iRVBybGZ2K1dhME5CNXRsTHExYWlSZDI1eGVEa0RP?=
 =?utf-8?B?cXlpdzlsVkRzOFJRcjJXQ2pQTFVETGNQN1lFeG1seGdPUWdQbUw5QnNvaXdx?=
 =?utf-8?B?REIxdjhPdUx5WHlWRWFnRENndHdneDBWVmZPSktBUVNUdDNOTE0zQWRUY2Q3?=
 =?utf-8?B?K3YrZXVqdnJ4L2pKd0NkVDBZOWlwT0t2Z200RXlFUTR1ZHlTZWlCaDZ1WFE3?=
 =?utf-8?B?ZXUvVjNpZWgrdjYzcVRxMkFiYnlPaXo4REZqUlVtQUh1eDI2eHk2aCtKQkZY?=
 =?utf-8?Q?luKNs+G8QO3Zykp+JaHoo9tqkCICCoD2AOfA5dg?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 7671afaf-d28a-451a-1616-08d9055f6cc8
X-MS-Exchange-CrossTenant-AuthSource: DS7PR03MB5608.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 22 Apr 2021 07:22:45.6581
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 335836de-42ef-43a2-b145-348c2ee9ca5b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: rE/Yx8dJqJOMv8Qf2flhlCyRo8AHMphM7YhhfZ2oeJB9b/uOVaCnru8pRgVCS7VO3o8AD6SL8El4UAKcnwnbOA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DS7PR03MB5606
X-OriginatorOrg: citrix.com

On Wed, Apr 21, 2021 at 05:34:29PM +0200, Jan Beulich wrote:
> On 21.04.2021 17:20, Roger Pau Monné wrote:
> > On Wed, Apr 21, 2021 at 02:03:49PM +0200, Jan Beulich wrote:
> >> On 21.04.2021 12:21, Roger Pau Monné wrote:
> >>> On Thu, Apr 01, 2021 at 11:46:44AM +0200, Jan Beulich wrote:
> >>>> @@ -189,7 +208,11 @@ EFI_LDFLAGS += --no-insert-timestamp
> >>>>  endif
> >>>>  
> >>>>  $(TARGET).efi: VIRT_BASE = 0x$(shell $(NM) efi/relocs-dummy.o | sed -n 's, A VIRT_START$$,,p')
> >>>> +ifeq ($(MKRELOC),:)
> >>>> +$(TARGET).efi: ALT_BASE :=
> >>>> +else
> >>>>  $(TARGET).efi: ALT_BASE = 0x$(shell $(NM) efi/relocs-dummy.o | sed -n 's, A ALT_START$$,,p')
> >>>
> >>> Could you maybe check whether $(relocs-dummy) is set as the condition
> >>> here and use it here instead of efi/relocs-dummy.o?
> >>
> >> I can use it in the ifeq() if you think that's neater (the current way
> >> is minimally shorter), but using it in the ALT_BASE assignment would
> >> make this differ more from the VIRT_BASE one, which I'd like to avoid.
> > 
> > Sorry, I think I'm slightly confused because when the linker can
> > produce the required relocations relocs-dummy variable is left empty,
> > so it won't be added to $(TARGET).efi.
> > 
> > But we still need to generate the efi/relocs-dummy.o file for the ELF
> > build I assume?
> 
> Not anymore (after "x86/EFI: redo .reloc section bounds determination").
> We need it, as said, to fish VIRT_BASE out of it. It indeed wouldn't get
> linked into any of the final binaries anymore.

Could you please add some text to the commit message to note that
while relocs-dummy is not linked into the final binary it's still
needed to get VIRT_BASE?

With that:

Acked-by: Roger Pau Monné <roger.pau@citrix.com>

FWIW, it would also be nice to add some comments to the $(TARGET).efi
target commands, as it's quite impenetrable right now.

Thanks, Roger.


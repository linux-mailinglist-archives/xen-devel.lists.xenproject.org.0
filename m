Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 0A12B309D21
	for <lists+xen-devel@lfdr.de>; Sun, 31 Jan 2021 15:46:43 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.79326.144425 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1l6DzG-0004DS-Me; Sun, 31 Jan 2021 14:46:02 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 79326.144425; Sun, 31 Jan 2021 14:46:02 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1l6DzG-0004D3-JY; Sun, 31 Jan 2021 14:46:02 +0000
Received: by outflank-mailman (input) for mailman id 79326;
 Sun, 31 Jan 2021 14:46:02 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=6ECZ=HC=citrix.com=andrew.cooper3@srs-us1.protection.inumbo.net>)
 id 1l6DzF-0004Cy-PF
 for xen-devel@lists.xenproject.org; Sun, 31 Jan 2021 14:46:01 +0000
Received: from esa1.hc3370-68.iphmx.com (unknown [216.71.145.142])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id ea8f08e6-2913-4e1b-a8d1-85dc2a55fa14;
 Sun, 31 Jan 2021 14:46:00 +0000 (UTC)
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
X-Inumbo-ID: ea8f08e6-2913-4e1b-a8d1-85dc2a55fa14
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=citrix.com; s=securemail; t=1612104360;
  h=subject:to:cc:references:from:message-id:date:
   in-reply-to:content-transfer-encoding:mime-version;
  bh=xRYnSXPYBibPJi+U9YBc7V4ek1oUjS+3e+O22NblTyI=;
  b=ii9GOdKBMty0E0EVFMeMjpBhVaGJo0fMgU6yMinTUqgJS2lMu/qz6C5d
   npaGFZ5U23xU4MHbYVqcEvQ66K8fBmzTn18Z9Go4Tr1nRKs0rFC07lNDb
   FI488cucbT1AIGJL+p8YoUH3KYkXK6vlWgYqE2zVJMtI5Ps2wYSlqZMLX
   Q=;
Authentication-Results: esa1.hc3370-68.iphmx.com; dkim=pass (signature verified) header.i=@citrix.onmicrosoft.com
IronPort-SDR: QyjeHV3mBdF5z1vqk/bdp1ciVTJe+UiQhBcREfRFcO1JmStmvdIDg4HeHhwzFayatFisrALeuC
 LNzImbSbvVjrEp52vlNQotLR5pg0krKLQDtgdW+XsDZzwXuZgQPY12ZhyCX0G9bgYkmbeyw3il
 Sy7rVgBdaRi1l0m1rhEF9gFOfcREsykzycEl2/pqWd8yS/Ps9LBkvLI1Up+mTa7agPHrOl3gNo
 LqCdsTqj/1aJeR8vfsGe7XKV/Z/dKiG3UZqFP9aDOXkjGn0tw3Vo2e8UBG6SwRxF31AnIhnG5V
 t+8=
X-SBRS: 5.2
X-MesageID: 36608856
X-Ironport-Server: esa1.hc3370-68.iphmx.com
X-Remote-IP: 162.221.156.83
X-Policy: $RELAYED
X-IronPort-AV: E=Sophos;i="5.79,390,1602561600"; 
   d="scan'208";a="36608856"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=nn5zwYXNkb0ef6AeKir10oSGopnDnntn6uuwYjgfHT6R9U0JzXY1v6PKSGxgFHwt3h2dbu8xbE0sX0XLpXYFj4wAD9jni+vRL1T8pVyeXztqa4UQJvyJWda6Enw0aOBWyYmT56ykjnq+zemPM/Ku8+YlaKsmfz3aFYQJVVB8JYR0rNXsAkmZnmO/SUPMXkqxa7VC9rojMHXwY0fh/qOZD3XXN0InAp+Gr9oNN7cIwFBnMQn9q2GhGguGB1G57pyjUxnV202bBFSMASUMaiR9u/sljzfT7KNA/TCeNDxZxYvLJ+CBs9O1dAsTOCzlvwzcLip2OTCInlTEFBPFbb/Clg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=xRYnSXPYBibPJi+U9YBc7V4ek1oUjS+3e+O22NblTyI=;
 b=gZAStSSFytpiY+HazkpVyFYfJrA5k9Iz4/JOsgq67/1tZ7J9SgpvSo9GrL2G1lC7jzNHjpIydceXqY7KBBaqHe6tLlUUtUfNv9cITk4Wkf+hnm7jhfzkhz+nXDmjkO8LUJKb7mjm2D+xjrLjOeaPSQMDrspsKS09CLFz+j1F2M/dLggNyku5GduyiNMelKQRHqferPnHg7AM7tVGVxgFogqqFylPHXL+zCBx9sOPC3o++XSQgWgJ5QGwgP8ZLyBc8WlRE/lujEHNPDySKcKfuleIsq+dLozsinS/4RoUPw2WPAfVYIJOKju4Z57nprYcUMyBLd2dgaPXXmyNG6BGGA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=citrix.com; dmarc=pass action=none header.from=citrix.com;
 dkim=pass header.d=citrix.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=citrix.onmicrosoft.com; s=selector2-citrix-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=xRYnSXPYBibPJi+U9YBc7V4ek1oUjS+3e+O22NblTyI=;
 b=xhWhBzTYCxQfzS3V03pstpC39MJvnSCSbsfwl9554egcajrgqpJ8Fdqh04r6VrEmbUC8PAV9jDdI5OAwEGlfgV3VVkZfETkmatuQ5xEQgEvsP61vzytPnaFmJikwRVZMmpvl5sEry8wfsr0LZTOAajyZiyxiaTpQSNiUbcktc+U=
Subject: Re: [PATCH v2 1/4] meson: Do not build Xen x86_64-softmmu on Aarch64
To: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <f4bug@amsat.org>,
	=?UTF-8?Q?Alex_Benn=c3=a9e?= <alex.bennee@linaro.org>,
	<qemu-devel@nongnu.org>
CC: "Michael S. Tsirkin" <mst@redhat.com>, Paolo Bonzini
	<pbonzini@redhat.com>, Richard Henderson <richard.henderson@linaro.org>, Paul
 Durrant <paul@xen.org>, Marcel Apfelbaum <marcel.apfelbaum@gmail.com>,
	Stefano Stabellini <sstabellini@kernel.org>,
	<xen-devel@lists.xenproject.org>, Anthony Perard <anthony.perard@citrix.com>,
	Eduardo Habkost <ehabkost@redhat.com>
References: <20210131141810.293186-1-f4bug@amsat.org>
 <20210131141810.293186-2-f4bug@amsat.org>
From: Andrew Cooper <andrew.cooper3@citrix.com>
Message-ID: <6ea50cf0-344d-cf9b-0a20-0444b3764f2d@citrix.com>
Date: Sun, 31 Jan 2021 14:45:41 +0000
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.6.1
In-Reply-To: <20210131141810.293186-2-f4bug@amsat.org>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 8bit
Content-Language: en-GB
X-ClientProxiedBy: LO4P123CA0020.GBRP123.PROD.OUTLOOK.COM
 (2603:10a6:600:151::7) To BYAPR03MB4728.namprd03.prod.outlook.com
 (2603:10b6:a03:13a::24)
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 4cc97031-42b0-46d0-713e-08d8c5f6e667
X-MS-TrafficTypeDiagnostic: BYAPR03MB4536:
X-MS-Exchange-Transport-Forked: True
X-Microsoft-Antispam-PRVS: <BYAPR03MB45361DE73317E3CB0D99CED2BAB79@BYAPR03MB4536.namprd03.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:747;
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: qf2yaeaHlEjAl/c9GN0/ec6NyVU1/2zSr30YmKay+IVHCEE8Il9CrI197efGjCl7QbnKgkg/YUdyO8yoNz0WLl1XNU7mEhSNR6ieEVYOTehO+X4LXmCOW3j44mldituxWPwVsF864YLSicPX+JaA9SHrcvyBp4m54rjRov3xlDCT5yTWa7+I8gtCdA2+Z/WRMci0EDOd5BwOwtX6B52bsk1MZvsx9Dpso/5S94IzputawOa2uk9Ex1Lz7aRWbjbbQ+g4zhCIgz8RySB4N2ljxT5RxBs0J2OSBibe0qLPwbrYtXzRuqD3Kj/3u96TjIAJUcvQ8gmEB1kDuaVH92GXisyd1mlRL0LvhRgOhEJjM6rv7RBPZctVU6jAFymoFjOEGYt6VnNt2q+6bGqP38zUaJwtDt4rYP40PaXjQKU46o+KNnibbTFQYbLyjfVTY9W81V8iENGD3lUdXKVkqujD3lkXVMUpnUsOMsZQqbnNXmh/9d1VmZR+Ab3xeHsX1fhPtTyfNoYMTUwTVNxNlMWA9v9uSy0L/znEHPg6og3sQkNfgQOMYN/XlZ5ytRI22KndK0hydCGGrFMDYzNTbciYyQLlPzAXwOpQcw6aXBGv4b4=
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:BYAPR03MB4728.namprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(4636009)(366004)(136003)(346002)(376002)(396003)(39850400004)(8936002)(31696002)(316002)(36756003)(7416002)(6666004)(478600001)(86362001)(66946007)(66556008)(66476007)(4326008)(5660300002)(4744005)(956004)(2616005)(16576012)(110136005)(54906003)(53546011)(26005)(186003)(16526019)(6486002)(2906002)(31686004)(8676002)(43740500002)(45980500001);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData: =?utf-8?B?M1c3WFpJa2VQVmxHbUE5L3lnMVpUcXEyNzAzWWxrUHkwaXdFdkxkb0U2WGpD?=
 =?utf-8?B?TnM3TEx5bmlLUHhPSm1MNGdjTGFKU2t0TUxpcVM4MFZ6MWVidjR1Y2l6bmhr?=
 =?utf-8?B?YzQ2ZVBxQWtKejhFNWZmeGN4MDN6ZC9mcC9PWXE4eUxjSUZ1aGdFN3FsRzNH?=
 =?utf-8?B?b0g0NEFZVGRwY2JGaUlRaEZSVzdXckJFSS8xeDkraVFGMTZKTm50OVBIODBQ?=
 =?utf-8?B?U1piYjBLUllJVCtJQmVBamNvdVNaQThLcU1HTVVLdFAxSkFwOXBXbHovODlC?=
 =?utf-8?B?THhRVC8rZUFuSGN4endkbGNCd0ZaR0o3T1FEa2UzbzFXaThQT2lhbFFVbmZN?=
 =?utf-8?B?R3ZCcHB0V0xxeFBqNXlaZis4dnU2bENpK21IcTFvMnJjb2FYbTBUVDhCOWpn?=
 =?utf-8?B?bW9UTHpsdm1MWTZvQnRmMit4RzNoc0I4blZXYmV0dVBBRzVSek83WXlzcFpN?=
 =?utf-8?B?ZFpDRW1rQkdPT0QxUC8rWWxtZ20zeWNvWU8wMFZLUDdHeW1UampWMmN3ZEhN?=
 =?utf-8?B?eE43Qzd3TVdvNDN4cmNlUkpRYVl3d1laVXhIRkp6TFg4SXg5R2UxMkl5YkhG?=
 =?utf-8?B?WEh4L05tWG12cWhGK2xZSFkweXZoODhWWGpZaTU3YzM3UkVPNXVUelhnNWZI?=
 =?utf-8?B?WFArQzhHT0JacTEvek92QkZ1dkJYVE1rWDBXOGZIWlZsa3hheS9ENWZyRGJ6?=
 =?utf-8?B?ZnpTeWVhUXJNcFEvV0tROEU0a0Q3M04zQ21VZy9qOW43U3lGNWg0ZGxESWpU?=
 =?utf-8?B?YVpRSmJYNEk1ZFl4c3lJOFloOThNbEhsQkNKdGRtZlZhcnMxOVdsUEZhWTUx?=
 =?utf-8?B?ZU96TUc2eFVnUUNVNmFFTjZHNHV5K3NpT0tRUk1oOVp5cXBOaVpPWmFCSE1v?=
 =?utf-8?B?emhmQ09iUXF6S1dydlExc0J1ek0vZXFYWnFjMFZQaExlbHpRZXlNekxZNnZM?=
 =?utf-8?B?T0xPcmRtRzRNSUh1c1pXWjh6bnErVHRHSTNybVlnMTNWcmxKYVRCLzBuam5Z?=
 =?utf-8?B?N1VWYkRxYVBiU1ljeHIrS25PcDRzM1Vod0ZabjA2NkQwckVHSHdobXFtZVlh?=
 =?utf-8?B?bzhnKzRnREtSNHpnQ1NnNEI0eHRNd2Fqc1diQzE4OFYwYU1xa1R4T1JIeUhW?=
 =?utf-8?B?NSt3YU5JMFJ3Z1V5MlJDY2hRUzBDWDdWeVdhYUpkaXN4WWd2VllGbXZ6RUZY?=
 =?utf-8?B?cHpWUVJlQmRwS0RUZUJpOXk5SURNZ2R6eERVWXE1VEJjc1BwbHI3cEpNZUNi?=
 =?utf-8?B?UzVQMWpqVWsvRU1yZmZKcHl0QW9wNmhlS3kvWVg2REk0QzVRMVJOMnpYZWpn?=
 =?utf-8?B?ZkdUNDJCa0dEeTNLeWhSbUJER292bzBLa3UrUkxsOFJnaXl5MjF0clBIVkxl?=
 =?utf-8?B?NHNSZVdxT2tkMmNXYU9SSHNTRUJtZ3FWOWlWanZvMzBLdjl1RW1KckJ0YTNQ?=
 =?utf-8?Q?vyzZs7+V?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 4cc97031-42b0-46d0-713e-08d8c5f6e667
X-MS-Exchange-CrossTenant-AuthSource: BYAPR03MB4728.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 31 Jan 2021 14:45:49.6177
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 335836de-42ef-43a2-b145-348c2ee9ca5b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: C8vrcQ8ldGMiBiFUK9uqzm56cEyrZxlDO/5JIHFgTjn3c0seHs+NY9BTTnesZgSzM29lXuHbTCDWmL3R8mQWLaFoHj1bOvAVG/Tfx5EwSc8=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BYAPR03MB4536
X-OriginatorOrg: citrix.com

On 31/01/2021 14:18, Philippe Mathieu-Daudé wrote:
> The Xen on ARM documentation only mentions the i386-softmmu
> target. As the x86_64-softmmu doesn't seem used, remove it
> to avoid wasting cpu cycles building it.
>
> Signed-off-by: Philippe Mathieu-Daudé <f4bug@amsat.org>

As far as I understand, it only gets used at all on ARM for the
blkback=>qcow path, and has nothing to do with I440FX or other boards. 
i.e. it is a paravirt disk and nothing else.

xenpv should not be tied to i386-softmmu in the first place, and would
remove a very-WTF-worthy current state of things.  That said, I have no
idea how much effort that might be.

~Andrew


Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id D24CB415BF7
	for <lists+xen-devel@lfdr.de>; Thu, 23 Sep 2021 12:32:30 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.193625.344897 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1mTM14-0000O1-F5; Thu, 23 Sep 2021 10:31:46 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 193625.344897; Thu, 23 Sep 2021 10:31:46 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1mTM14-0000La-Bl; Thu, 23 Sep 2021 10:31:46 +0000
Received: by outflank-mailman (input) for mailman id 193625;
 Thu, 23 Sep 2021 10:31:45 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=qmWf=ON=citrix.com=roger.pau@srs-us1.protection.inumbo.net>)
 id 1mTM13-0000LU-1F
 for xen-devel@lists.xenproject.org; Thu, 23 Sep 2021 10:31:45 +0000
Received: from esa3.hc3370-68.iphmx.com (unknown [216.71.145.155])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id 7100ac42-1c59-11ec-ba28-12813bfff9fa;
 Thu, 23 Sep 2021 10:31:42 +0000 (UTC)
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
X-Inumbo-ID: 7100ac42-1c59-11ec-ba28-12813bfff9fa
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=citrix.com; s=securemail; t=1632393102;
  h=date:from:to:cc:subject:message-id:references:
   in-reply-to:mime-version;
  bh=w4wXSGWdH9fRfy2+tUQaMA8SXmauZ2tsLoU+bZJrnBw=;
  b=Bv0hLcnM+5hGX6VqIg2tm2YNGkBbj08sINYZwvrqzv2uODNJSCvUgL78
   uNuMlbgRbkBamQhHRNUxSMA59VuUFoFqqzjL/MzAHOeaPHJ8PhQkCj7nF
   ltTJkzn6Oe3lLdyucqiS9DCg1nnq0GLULYpfk2jxDajywxINz2SGSUnJD
   o=;
Authentication-Results: esa3.hc3370-68.iphmx.com; dkim=pass (signature verified) header.i=@citrix.onmicrosoft.com
IronPort-SDR: 4wDtFBSorgUvQZhrBievh8Cv31VdzqJq0xlYbB4Z81U7Oeh686ocEpJIL6c8oKExRfemfdFJKV
 R06++WMwn8EskYfBUdpEdrXe+qaF0sdWVc5bZGaVrxQ0w6zOADwj582Zvpyq9SV+gwJ5LNy9NT
 22bK4a6wfpubjAm/D3gbBAXgLG0ldF2lxlIw/n44h1cwmRUgqe2JKyrN30EUS9xQ8clkw0FGQ9
 iMKQhLYfYg7fpz/x/eeEgcscI4JWkpIGyNoPQIzM6Kj46aI5jtbKfSukRYraL3XSp92KsRP/uz
 qifeMh4PD9cgCeb28xDz0jfr
X-SBRS: 5.1
X-MesageID: 53442998
X-Ironport-Server: esa3.hc3370-68.iphmx.com
X-Remote-IP: 162.221.156.83
X-Policy: $RELAYED
IronPort-Data: A9a23:kz9+N6v9Og86gtVw1e4a3Bd5eufnVLdZMUV32f8akzHdYApBsoF/q
 tZmKWnQP6zZNjGhct91at7j9k4O6MXdm4BgHFFqrCBgRXkT+JbJXdiXEBz9bniYRiHhoOOLz
 Cm8hv3odp1coqr0/0/1WlTZQP0VOZigHtIQMsadUsxKbVIiGHpJZS5LwbZj29Y524PhWmthh
 PupyyHhEA79s9JLGjp8B5Kr8HuDa9yr5Vv0FnRnDRx6lAe2e0s9VfrzFonoR5fMeaFGH/bSe
 gr25OrRElU1XfsaIojNfr7TKiXmS1NJVOSEoiI+t6OK2nCuqsGuu0qS2TV1hUp/0l20c95NJ
 Npll727dj8gHY3wxMcwDSJkDzleAYpsweqSSZS/mZT7I0zudnLtx7NlDV0sPJ1e8eFyaY1M3
 aVGcnZXNEnF3r/ohuLgIgVvrp1LwM3DJoQQt2sm1TjEJf0nXYrCU+PB4towMDIY25sSQayPN
 ppxhTxHYgrDbiRUG0orUq19ruethHDPKxpApwfAzUYwyzeKl1EguFT3C/LKfvSaSMMTmVyXz
 krW8mK8DhwEOdi3zTue7mnqluLJhTn8Wo8ZCPu/7PECqF+Zy3EXCRYWfUCmuvT/gUm7M++zM
 GRNpHBo9/JrshX2EJ+tBHVUvUJooDY+etFvK+QZyD3R6YeK2DqFHkg4aRR4PYlOWNANeRQm0
 VqAntXMDDNpsaGIRX/1yop4vQ9eKgBOcjRfP3FsoR8tpoC5+dBu0kunosNLTfbt5uAZDw0c1
 NxjQMIWvLwVkcdD/KGy51mvb9mE98WRE1ZdCuk6WAuYAuJFiGyNO9fABbvzt68owGOlor+p5
 iNsdy+2trxmMH11vHbRKNjh5o2B6fefKyH7ilVyBZQn/DnF0yf9JtoLu2kmfxkzY5dsldrVj
 Kn741g5CHh7ZifCUEOKS9jpV5RCIVbIT7wJqcw4nvIRO8MsJWdrDQllZFKK3nCFraTfuftXB
 HtvSu71VSxyIf0+lFKeHr5BuZd2lnFW7T6CHvjTkkX4uYdykVbIEN8tKkWVVOkl4cus+UONm
 zqpH5DRkEs3vSyXSnS/zLP/2nhQdiVkWcCq9ZYHHgNBSyI/cFwc5zbq6epJU6RunrhPl/eO+
 Xe4W0RCz0H4i2GBIgKPAk2PopuwNXqmhX5kbyEqI3iy3H0vPdSm4KsFLsNldrg77u1zi/VzS
 qBdKcmHB/1OTBXB+igcMsah/NAzKkzziFLcJTehbRg+Y4VkG17D9Oj7c1a97yIJFCe265cz+
 uXyygPBTJMfbA1+F8KKOum3xla8sCFFyuJ/VkfFOPdJf0Do/NQ4IiD9lKZvccoNNQ/C1n2R0
 APPWUUUouzEookU9tjVhP/b89f1QrUmRkcDRjvV97e7MyXe71GP+44YXbbaZy3ZWUP15L6mO
 bdfwcbjPaBVh11NqYd9TepmlPps+9v1qrZG5Q14B3GXPU+zA7ZtL3Taj8lCsqpBmu1QtQesA
 x/d/9BbPfOCOd//EU5XLw0gN7zR2fYRkzjUzPI0PESlu3MnoOvZCR1fb0uWlShQDLppK4d0k
 +4utfkf5xG7lhd3YM2NiTpZ9jjUI3ENO0n9Wkr23GM/ZtIX92x/
IronPort-HdrOrdr: A9a23:iWzKOazdQI8gAe7Z2VCvKrPxseskLtp133Aq2lEZdPULSKKlfp
 GV88jziyWZtN9wYhEdcdDpAtjnfZr5z+8J3WBxB8bZYOCCggqVxe5ZnO7fKlHbaknDH6tmpN
 tdmstFeazN5DpB/L7HCWCDer5KqrT3k9HL9JfjJjVWPHpXgslbnnlE422gYzRLrWd9dP0E/M
 323Ls5m9PsQwVbUu2LQl0+G8TTrdzCk5zrJTYAGh4c8QGLyRel8qTzHRS01goXF2on+8ZszU
 H11yjCoomzufCyzRHRk0fV8pRtgdPkjv9OHtaFhMQ5IijlziyoeINicbufuy1dmpDi1H8a1P
 335zswNcV67H3cOkmzvBvWwgHllA0j7nfzoGXoyUfLkIjcfnYXGsBBjYVWfl/y8Ew7puxx16
 pNwiawq4dXJQmoplW82/H4EzVR0makq3srluAey1ZFV5EFVbNXpYsDuGtIDZY7Gj7g4oxPKp
 guMCjl3ocVTbqmVQGdgoE2q+bcGkjbXy32DHTqg/blkAS/xxtCvgwlLM92pAZIyHtycegD2w
 xoWp4Y4I2mdfVmH56VMt1xN/dfOla9Mi4kD1jiVGgPNJt3cE4l+KSHqonc2omRCes1Jd0J6c
 38bG8=
X-IronPort-AV: E=Sophos;i="5.85,316,1624334400"; 
   d="scan'208";a="53442998"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=Ed6+vWV+hTVZv12jarhkajVQTlsGpC5ziOcFCYLFj/L7+EZkp1qx2LC3h3u812qjkZDrAHHNUf2W47b70gLtOoFmOA4PeewFDLF8sIWO5q+VSNZyI6wSpS7A3rGfd5fswc1ibONlRi9BlAXPMQhqAKfJIOgu/wML6nbs+r0sGPQTrSaU1a2r9e8k1L9AOAz4qev0rgJYko5l409wtMl/WGCOEWyHKHcClya5V7FScXe7xWJqtMUy7zBHKUQm6mlMBogLYRLJqoBiBnUDAPz5TCzR296bMVkMG+S7Mq9+4MRN7qPOgm4jQLkpPxXS1dP9w52dzexawnKpCYc9fDqRvA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901; h=From:Date:Subject:Message-ID:Content-Type:MIME-Version;
 bh=7GQI1cTIkFaS2g0GrtYec+AGREcjYeMRkGmLhZEcrjc=;
 b=E+NsjRiwNzKZmGCcYC0syerilK4+Heo8Jvr0NwEEGRcgUksbsq/ilv9GfQw0yi6/+Y+tInKNPN1u0m6rqLloJDD3SJ4TQnDs3a2okH1HLzvaXTf6WwTuyM7muu5ouViwXzI+cW4YcrB1kkyM42ecZYLWuQawGuJBi86+Xc+29okmwWs0uLQlbC8/C+JcIoi+mXEN3fGwSq1fvghRYukTI/Gn9NXr1pEapTlC2kAJ9H+D1+TFixIXNbQ65gx1SfkxcUTN57VPt6wlg4KweLWeEMGbBmALuKLu7DjSoVLySBcOipXssTZuDHjyr6v0jHi31ELVVBnHC886p3q6LPCWVA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=citrix.com; dmarc=pass action=none header.from=citrix.com;
 dkim=pass header.d=citrix.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=citrix.onmicrosoft.com; s=selector2-citrix-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=7GQI1cTIkFaS2g0GrtYec+AGREcjYeMRkGmLhZEcrjc=;
 b=mFka8ZJH8HaNXXRpuOLXAweUPUuUVqEA1k0ageoIrQEKqNmI/y5yJiGq5p2W7BbnjShTfV/1uN39zOAHUiXXjNvNuAb2tUCFAGII5KD+reWMiFTZWoTtiZ+cCHchtaWtchwzzjVAaHP4eGdh5ZesadkWBDIMnVo+pCVpq64RVv4=
Date: Thu, 23 Sep 2021 12:31:14 +0200
From: Roger Pau =?utf-8?B?TW9ubsOp?= <roger.pau@citrix.com>
To: Jan Beulich <jbeulich@suse.com>
CC: "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>, "Andrew
 Cooper" <andrew.cooper3@citrix.com>, Wei Liu <wl@xen.org>
Subject: Re: [PATCH v3 7/9] x86/PVH: actually show Dom0's stacks from debug
 key '0'
Message-ID: <YUxXcrMiPDiGkdw9@MacBook-Air-de-Roger.local>
References: <e4959bab-0e0b-1037-c5da-3d2f14592c20@suse.com>
 <ca129fa5-7165-a9ef-4e57-75c43a708960@suse.com>
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <ca129fa5-7165-a9ef-4e57-75c43a708960@suse.com>
X-ClientProxiedBy: LO4P123CA0452.GBRP123.PROD.OUTLOOK.COM
 (2603:10a6:600:1aa::7) To DS7PR03MB5608.namprd03.prod.outlook.com
 (2603:10b6:5:2c9::18)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 4de520e1-f6ef-44e0-ec01-08d97e7d48de
X-MS-TrafficTypeDiagnostic: DM4PR03MB6094:
X-MS-Exchange-Transport-Forked: True
X-Microsoft-Antispam-PRVS: <DM4PR03MB609458C06AE26CF981BE9E478FA39@DM4PR03MB6094.namprd03.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:8273;
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: /fyPj4fpYbI9W7wMW32pF2InD1oLpsm0lY4I2HDs+Oq13Dg62ISfvokA1UgyVbW5Rea/WcHY2hAL5HRJ0Xfam7icg9D6TOVxsgoi3VIM9vhCQ9kX+KgYyLAFKEvK5OwUrbfm2pyNYBqej2jtDQD5DnZaH/qU9PxILvHFHifRfFIomgp2JQbIZaHK0UWqS80UFhkmE3lbx0Kn7fYNLQScec0KBvzSiL2ij4RR+md+RS4+51ikcsJrswGv4kBf2v1kqQrAuDfYvF5z/XP91pMf7gUAPXr4Q+MTH3lcL+462tKF2UEeopRBJ0ubDRtSxxdEKg5RwbzgNoySZQDruVE9V1bOUqUf2sdIl8lfV+YNxaTiNnwDlMF6DXeuYPG+y/ay/Awd8U4b/6Q2Ty/B14s4CINXnmUcdwvrut+VZiCR6AGlTEg3fycimLfTeV+wet0hWjQMMK6o8BVok8p2TmbITqTU2iiAEwkrBpeTsPnPmMAW98lCbBLxraoWflfBeuM7uLxnCjytSQlyNZJzJJHLe7/03GkhKBJrC0IiOucLRELbRgRe40yf492/NngzijBygGAMBGHEbSGZcQfTnTF9kOvmhdjLaMcyln7UIYtW8j7hu/zGL3TEAOt6fx12R+weAb2YT51gPFW190mVzPUG/g==
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DS7PR03MB5608.namprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(4636009)(366004)(6486002)(38100700002)(86362001)(186003)(2906002)(66556008)(6916009)(5660300002)(66476007)(66946007)(26005)(956004)(6666004)(4326008)(85182001)(8936002)(54906003)(316002)(9686003)(8676002)(6496006)(83380400001)(508600001);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?S3ZvQXVWWkFjTTRGZy94V2laVnNKTEJpS0pjVkNtZlRXZlBGUmd5S2xCV0FD?=
 =?utf-8?B?Wit2eTVJVzF6a05vTjRpVWpkMllXMTFSenc4NVRVeC9NczVPc1dRUENYdWhI?=
 =?utf-8?B?RTJSZ2tjczNad2JwVW9nUTBaZ2V6VjBaa0thdktPcW0yaDh2eG5RR0I5ZzNT?=
 =?utf-8?B?cTl2YUJ1RkdRVzNWWEtQM0cwZ0NvTGpqSWt5VEZGUCtVeG1xOUNBS0NSbFcy?=
 =?utf-8?B?ZUF5aG1wM2RmV2l6S1hXYU42TDlDWUJvaUtQcStKZnc5VW5xSTJKUVU5V0tQ?=
 =?utf-8?B?ZEl0T3dnZXJkTE9WUWFIOUl5R1BkWm91cDdqcm5KQmtGU3ovQm1lMGhwd2pN?=
 =?utf-8?B?TUQyaUxpd1Rwd0NtSlhVRjNxTUl2eWJ2MGZzMmJNN201NnBXRTZFQ2krZ08y?=
 =?utf-8?B?ZC8zWjlJZFJESXh2a0QzNS9wcVoySXlLdlhLRk15NDlPN0hJUXE5ZGtsRWVJ?=
 =?utf-8?B?SGdIY2g0TGpDL013a1NRQ3QxZHJXNnpDcTdNZzJFQW41aCtjWjhyK0E1YzA0?=
 =?utf-8?B?TldoQmFwejFjUXZIMi9wWTA2UDh2VWpZY0lDczJMNThHUDZ6b3BPL1dmWEQw?=
 =?utf-8?B?c253dTU0NjBZSmVOTy9nNnZsVW5Da1M5WVRiU0llUGxGc0xIK0RtSW1RQitk?=
 =?utf-8?B?Y1dkUUdCQW5ON0IwZ2w3cWZOZ3I3eWthcTJtb3poem5LeWtNRmhlbzZOQnZy?=
 =?utf-8?B?bEJLdGNyZ2gwYU9vTXlmeUtWcTJOd3dJZjZSOC9HOEphSFJPNS96SXRDaktV?=
 =?utf-8?B?WGtOakZ2djdlWlFqdGRKVE9zc01tSGE5ZVUzN1NLbDkwUUZIb2JqbEpSc1Zu?=
 =?utf-8?B?dko2MXFKcWhJRVlkMGYvOEJrUTRtOHRPVGlPdk9ldTVPSVVMR1ZpbWQrd0NW?=
 =?utf-8?B?MjEyUm1zNGJFSXNLY012NXVhMENzd3hGUDVJQlA2U0xNQnhiOFUzMVB3bTVW?=
 =?utf-8?B?MnRIcHZrcG8vNkhkSmsrYXNhak4zS3BoakUrbWNOZURhLzJVUXB2OUhLWVBC?=
 =?utf-8?B?dTdGZHBkL2Q1N1ZSTEtxbjQ1SFpTV3M4dmV6YWpBRnFxaFhRdnNMQmozTmlM?=
 =?utf-8?B?cEI3Mk4vdFlCSzNnUzhrMEVvLzc4enNvakQzU2Z1VWxoRnVFWkh0cklwY0Fl?=
 =?utf-8?B?bGdvWkE2OFlWZUVlN2RwbUJkSjc5bFBrdS8zdjdlbXFqS2hrSk1ONUZDVHhy?=
 =?utf-8?B?a28rSUpPT1JDcFUyOXA2eENRRU9QL2ZRRmtkZElyYWZQT09KM05nM0RFVG1u?=
 =?utf-8?B?WWYwUVlZRkJ5UGREaGVWUTY5ZkJwbVRNbkFNaUpseDBWdTN6SzJoOUs1Ymow?=
 =?utf-8?B?VVlENUJOeWRMTzl2NTE1alJUcjNxd0NHMVRZcjdkUjBlKzRwV3cwdXJwUWd5?=
 =?utf-8?B?WkxQVmpPRXB3TjVPdWhRaWxQWlVvM204cklCRFJ4NEJpRzU0VzNTcUNhdndG?=
 =?utf-8?B?czdSbS9uNkhkY0ZTWU1KTDR5UmxZbWpWMFJiMTYrems2d2hneEx2d0EyUXIw?=
 =?utf-8?B?M1gwYnd1TXlsakphYUtBdHV4QmNyL0dIclh3S0ZiMFRsMmRKS0FhRXVvQ1Yz?=
 =?utf-8?B?OU9qQzBvQWpjbjF0RCtUWlpHbk5YcVJWeXpzVHNDdFV3bU5uWVRzRy9JRHl3?=
 =?utf-8?B?cmZJZmw3aTU0ZVV0ZEE2eUJOYmU4MExnQ0NuQS9qN2ZhdDN2N0N5RGRKbW50?=
 =?utf-8?B?byt2WVBtckI1UXpWR0ZxMWFIdnYxN0tBWjZOQm5pM00wdnVNREdDY0I3S3g4?=
 =?utf-8?Q?Jbkv+bXLYOEUrULIVu/0SP3Ht4pWVTFAme2b0qp?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 4de520e1-f6ef-44e0-ec01-08d97e7d48de
X-MS-Exchange-CrossTenant-AuthSource: DS7PR03MB5608.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 23 Sep 2021 10:31:21.0008
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 335836de-42ef-43a2-b145-348c2ee9ca5b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: ceQKcTGqjsw4ECHExZ8eSaRK0pYEC5i+obkHAjLCLtVC8y59cq6j5lWqikQ9kkOSCriB22Ls03d17IJwcOlgqQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM4PR03MB6094
X-OriginatorOrg: citrix.com

On Tue, Sep 21, 2021 at 09:20:00AM +0200, Jan Beulich wrote:
> show_guest_stack() does nothing for HVM. Introduce a HVM-specific
> dumping function, paralleling the 64- and 32-bit PV ones. We don't know
> the real stack size, so only dump up to the next page boundary.
> 
> Rather than adding a vcpu parameter to hvm_copy_from_guest_linear(),
> introduce hvm_copy_from_vcpu_linear() which - for now at least - in
> return won't need a "pfinfo" parameter.
> 
> Signed-off-by: Jan Beulich <jbeulich@suse.com>
> ---
> TBD: The bypassing of the output interleaving avoidance isn't nice, but
>      I've not been able to think of an alternative. Avoiding the call to
>      hvm_vcpu_virtual_to_linear() would be in principle possible (adding
>      in the SS base directly), but one way or another we need to access
>      guest memory and hence can't sensibly avoid using the P2M layer.
>      However, commit 0996e0f38540 ("x86/traps: prevent interleaving of
>      concurrent cpu state dumps") introduced this logic here while
>      really only talking about show_execution_state().
>      vcpu_show_execution_state() is imo much less prone to interleaving
>      of its output: It's uses from the keyhandler are sequential already
>      anyway, and the only other use is from hvm_triple_fault(). Instead
>      of making the locking conditional, it may therefore be an option to
>      drop it again altogether.
> TBD: For now this dumps also user mode stacks. We may want to restrict
>      this.
> TBD: An alternative to putting this next to {,compat_}show_guest_stack()
>      is to put it in hvm.c, eliminating the need to introduce
>      hvm_copy_from_vcpu_linear(), but then requiring extra parameters to
>      be passed.
> TBD: Technically this makes unnecessary the earlier added entering/
>      leaving if the VMCS. Yet to avoid a series of non-trivial
>      enter/exit pairs, I think leaving that in is still beneficial. In
>      which case here perhaps merely the associate comment may want
>      tweaking.
> ---
> v3: New.
> 
> --- a/xen/arch/x86/hvm/hvm.c
> +++ b/xen/arch/x86/hvm/hvm.c
> @@ -3408,6 +3408,15 @@ enum hvm_translation_result hvm_copy_fro
>                        PFEC_page_present | pfec, pfinfo);
>  }
>  
> +enum hvm_translation_result hvm_copy_from_vcpu_linear(
> +    void *buf, unsigned long addr, unsigned int size, struct vcpu *v,
> +    unsigned int pfec)

Even if your current use case doesn't need it, would it be worth
adding a pagefault_info_t parameter?

> +{
> +    return __hvm_copy(buf, addr, size, v,
> +                      HVMCOPY_from_guest | HVMCOPY_linear,
> +                      PFEC_page_present | pfec, NULL);
> +}
> +
>  unsigned int copy_to_user_hvm(void *to, const void *from, unsigned int len)
>  {
>      int rc;
> --- a/xen/arch/x86/traps.c
> +++ b/xen/arch/x86/traps.c
> @@ -364,6 +364,71 @@ static void show_guest_stack(struct vcpu
>      printk("\n");
>  }
>  
> +static void show_hvm_stack(struct vcpu *v, const struct cpu_user_regs *regs)
> +{
> +#ifdef CONFIG_HVM
> +    unsigned long sp = regs->rsp, addr;
> +    unsigned int i, bytes, words_per_line, pfec = PFEC_page_present;
> +    struct segment_register ss, cs;
> +
> +    hvm_get_segment_register(v, x86_seg_ss, &ss);
> +    hvm_get_segment_register(v, x86_seg_cs, &cs);
> +
> +    if ( hvm_long_mode_active(v) && cs.l )
> +        i = 16, bytes = 8;
> +    else
> +    {
> +        sp = ss.db ? (uint32_t)sp : (uint16_t)sp;
> +        i = ss.db ? 8 : 4;
> +        bytes = cs.db ? 4 : 2;
> +    }
> +
> +    if ( bytes == 8 || (ss.db && !ss.base) )
> +        printk("Guest stack trace from sp=%0*lx:", i, sp);
> +    else
> +        printk("Guest stack trace from ss:sp=%04x:%0*lx:", ss.sel, i, sp);
> +
> +    if ( !hvm_vcpu_virtual_to_linear(v, x86_seg_ss, &ss, sp, bytes,
> +                                     hvm_access_read, &cs, &addr) )
> +    {
> +        printk(" Guest-inaccessible memory\n");
> +        return;
> +    }
> +
> +    if ( ss.dpl == 3 )
> +        pfec |= PFEC_user_mode;
> +
> +    words_per_line = stack_words_per_line * (sizeof(void *) / bytes);
> +    for ( i = 0; i < debug_stack_lines * words_per_line; )
> +    {
> +        unsigned long val = 0;
> +
> +        if ( (addr ^ (addr + bytes - 1)) & PAGE_SIZE )
> +            break;
> +
> +        if ( !(i++ % words_per_line) )
> +            printk("\n  ");
> +
> +        if ( hvm_copy_from_vcpu_linear(&val, addr, bytes, v,
> +                                       pfec) != HVMTRANS_okay )

I think I'm confused, but what about guests without paging enabled?
Don't you need to use hvm_copy_from_guest_phys (likely transformed
into hvm_copy_from_vcpu_phys)?

> +        {
> +            printk(" Fault while accessing guest memory.");
> +            break;
> +        }
> +
> +        printk(" %0*lx", 2 * bytes, val);
> +
> +        addr += bytes;
> +        if ( !(addr & (PAGE_SIZE - 1)) )
> +            break;
> +    }
> +
> +    if ( !i )
> +        printk(" Stack empty.");
> +    printk("\n");
> +#endif
> +}
> +
>  /*
>   * Notes for get_{stack,shstk}*_bottom() helpers
>   *
> @@ -629,7 +694,7 @@ void show_execution_state(const struct c
>  
>  void vcpu_show_execution_state(struct vcpu *v)
>  {
> -    unsigned long flags;
> +    unsigned long flags = 0;
>  
>      if ( test_bit(_VPF_down, &v->pause_flags) )
>      {
> @@ -663,14 +728,22 @@ void vcpu_show_execution_state(struct vc
>      }
>  #endif
>  
> -    /* Prevent interleaving of output. */
> -    flags = console_lock_recursive_irqsave();
> +    /*
> +     * Prevent interleaving of output if possible. For HVM we can't do so, as
> +     * the necessary P2M lookups involve locking, which has to occur with IRQs
> +     * enabled.
> +     */
> +    if ( !is_hvm_vcpu(v) )
> +        flags = console_lock_recursive_irqsave();
>  
>      vcpu_show_registers(v);
> -    if ( guest_kernel_mode(v, &v->arch.user_regs) )
> +    if ( is_hvm_vcpu(v) )
> +        show_hvm_stack(v, &v->arch.user_regs);

Would it make sense to unlock in show_hvm_stack, and thus keep the
printing of vcpu_show_registers locked even when in HVM context?

TBH I've never found the guest stack dump to be helpful for debugging
purposes, but maybe others do.

Thanks, Roger.


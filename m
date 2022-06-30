Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id B4366561582
	for <lists+xen-devel@lfdr.de>; Thu, 30 Jun 2022 10:56:48 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.358346.587552 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1o6pyc-0000Tc-4P; Thu, 30 Jun 2022 08:56:42 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 358346.587552; Thu, 30 Jun 2022 08:56:42 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1o6pyb-0000Nw-WA; Thu, 30 Jun 2022 08:56:41 +0000
Received: by outflank-mailman (input) for mailman id 358346;
 Thu, 30 Jun 2022 08:56:40 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=fPik=XF=citrix.com=prvs=1738a98a4=roger.pau@srs-se1.protection.inumbo.net>)
 id 1o6pya-0007Q3-1A
 for xen-devel@lists.xenproject.org; Thu, 30 Jun 2022 08:56:40 +0000
Received: from esa2.hc3370-68.iphmx.com (esa2.hc3370-68.iphmx.com
 [216.71.145.153]) by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 8bbf3f56-f852-11ec-bdce-3d151da133c5;
 Thu, 30 Jun 2022 10:56:36 +0200 (CEST)
Received: from mail-sn1anam02lp2047.outbound.protection.outlook.com (HELO
 NAM02-SN1-obe.outbound.protection.outlook.com) ([104.47.57.47])
 by ob1.hc3370-68.iphmx.com with ESMTP/TLS/ECDHE-RSA-AES128-GCM-SHA256;
 30 Jun 2022 04:56:37 -0400
Received: from DS7PR03MB5608.namprd03.prod.outlook.com (2603:10b6:5:2c9::18)
 by SJ0PR03MB6699.namprd03.prod.outlook.com (2603:10b6:a03:402::21) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5395.14; Thu, 30 Jun
 2022 08:56:34 +0000
Received: from DS7PR03MB5608.namprd03.prod.outlook.com
 ([fe80::40af:d5f4:95eb:d534]) by DS7PR03MB5608.namprd03.prod.outlook.com
 ([fe80::40af:d5f4:95eb:d534%7]) with mapi id 15.20.5395.015; Thu, 30 Jun 2022
 08:56:34 +0000
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
X-Inumbo-ID: 8bbf3f56-f852-11ec-bdce-3d151da133c5
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=citrix.com; s=securemail; t=1656579398;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:content-transfer-encoding:mime-version;
  bh=MuxBZdCHcFcLAUSqULIUORd90AHHM71XIXawMiighH0=;
  b=YA3h6A1a5uIAwVqAf8lY82fR6xl3uYbx9nAJUfMkQIcloekQ6D0MYqjN
   jo+oSqzwx9p0x24iicY3FpOGvuOrH6rYVJrlJjC7JHepN8TeklkTGCOx/
   wR1Tb4MP4uUoEoCY7R8d5CL6sFTYhHkaQfTtaD8iKBrWpg+q0YbF91Py/
   Y=;
X-IronPort-RemoteIP: 104.47.57.47
X-IronPort-MID: 74794312
X-IronPort-Reputation: None
X-IronPort-Listener: OutboundMail
X-IronPort-SenderGroup: RELAY_O365
X-IronPort-MailFlowPolicy: $RELAYED
IronPort-Data: A9a23:BlDuYas1MdEeQGOOuIi8qqEmP+fnVCJfMUV32f8akzHdYApBsoF/q
 tZmKTjUaamOZGL0f4x2bY/gpksGusXSx4M2HQc5pSphFi1A+JbJXdiXEBz9bniYRiHhoOOLz
 Cm8hv3odp1coqr0/0/1WlTZhSAgk/nOHNIQMcacUsxLbVYMpBwJ1FQywYbVvqYy2YLjW13W4
 YuryyHiEATNNwBcYzp8B52r8HuDjNyq0N/PlgVjDRzjlAa2e0g9VPrzF4noR5fLatA88tqBb
 /TC1NmEElbxpH/BPD8HfoHTKSXmSpaKVeSHZ+E/t6KK2nCurQRquko32WZ1he66RFxlkvgoo
 Oihu6BcRi9xZLLXlb43TiIfDh99B7YXx6LcASeW5Jn7I03uKxMAwt1IJWRuZ8gj3L8yBmtDs
 /sFNDoKcxaPwfqsx662QfVtgcJlK9T3OIQYuTdryjSx4fQOGMifBfmVo4IHmmtv7ixNNa+2i
 84xcz1gYQ6GexRSElwWFIg/jKGjgXyXnzhw9w7K9PZsujK7IApZ4aHXbODkZvCzYZtQoWayh
 XOF4FnHHURPXDCY4X/fmp62vcffkCW+VI8MGbmQ8v9xnEbV1mEVEAcRV1awvb++kEHWc9BVJ
 lEQ+yEuhbMv70HtRd74NzWnpFaUsxhaXMBfe9DW8ymIw6vQph2fX2ECRzsZMtg+7pdqGnoty
 0ODmM7vCXp3qrqJRHmB97CS6zSvJSwSKmxEbigBJecY3+TeTEgIpkqnZr5e/GSd1bUZxRmYL
 +i2kRUD
IronPort-HdrOrdr: A9a23:hvRtIaCp/pi4YILlHeg3sceALOsnbusQ8zAXPh9KJCC9I/bzqy
 nxpp8mPH/P5wr5lktQ++xoX5PwO080lKQFmrX5WI3PYOCIghrNEGgP1+vfKnjbalTDH41mpN
 hdmtZFebrN5DFB5K6VgTVQUexQuOVvmJrY+ds2pE0dKD2CBZsQjDuQXW2gYzBLrUR9dOwEPa
 vZwvACiyureHwRYMj+Ln4ZX9Lbr9mOsJ79exYJCzMu9QHL1FqTmfbHOind+i1bfyJEwL8k/2
 SAuwvl5p+7u/X+7hPHzWfc47lfhdOk4NpeA86njNQTN1zX+0+VTbUkf4fHkCE+oemp5lpvuN
 7Qoy04N8A20H/VdnHdm2qZ5yDQlBIVr1Pyw16RhnXu5ebjQighNsZHjYVFNjPE9ksJprhHoe
 529lPck6ASIQLLnSz76dSNfQptjFCIrX0rlvNWp2BDULEZdKRaoeUkjQ5o+a87bWzHAb0cYa
 hT5Jm23ocXTbraVQGSgoBX+q3iYpxpdS32AXTruaSuokprdT5CvgklLfck7wY9HaIGOud5Dt
 v/Q9RVfcl1P6krhIJGdZM8qJiMexvwaCOJFl6uCnLaM4xCE07xivfMkcYIDaeRCdc18Kc=
X-IronPort-AV: E=Sophos;i="5.92,233,1650945600"; 
   d="scan'208";a="74794312"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=hKMoYwiuOBrPBGOsHks/k1bkr+JOm6b/OGpp8DKsMck1VUg04RdWyAd9vE+h/ap0ezHIgq9y1EWkmUCQt0D1ZJVIXoiylMnTvFeU/3gwnv3GPdBho0oIr0KABH/iJCK+GJ6eK2Q9ZF3Zu2vMQ2OPqYgkWgZWO+4NDShA9QPXhQx57FUvupY2X0XhkQqPC3FRkQ/hjTLtYfnG+mDmy0fRHUwlUecNZin6mGpGGu+JaeVC0aFIt2MzDKi/VEzRiJxJWkjThI1rEkCfB2GD9yoImO45Nv10w+zJ2kWsD4MP1xn3Uc8D580NS1tqo79PmWmZ3T4TrUduQZFoXLy0Ac/1XA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=dsP+mK1T59nSfzkuyerDtNZDx7JRlt36zNeR2aRBE2k=;
 b=jjO+XFvqOR2TaMpRwWR3C3VhS2L4QgOBMSd8obP9aUL72iVCFtmLVO3h/wYLsD1d5xep4rp2YBS6QdFXBZJpRWIQI0kJm5gQ/jne1AilQKb/Wpr2NM/hIC1JfSMcM36TRWvo7O/2h5kYeXnSMXsnukJ1pbKCu/zGDvpp4mbxWolukkF0PVOrLdg/SCFfb9ZfVbpIp+BuwJMWs1hOIzECYrtT9IPcgPl/78rMxL1D7Pp7/2HLVYo2/I5dj0VyLCy31ksogK7sAcHtUV0/mo2IL4cFSQtiESeMjw3zL/slf/r3AwY2sD4bi0/d91N5t2QWkhGvRcHB6xuEIU//BY5uvQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=citrix.com; dmarc=pass action=none header.from=citrix.com;
 dkim=pass header.d=citrix.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=citrix.onmicrosoft.com; s=selector2-citrix-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=dsP+mK1T59nSfzkuyerDtNZDx7JRlt36zNeR2aRBE2k=;
 b=b/vhfOnMuuCg/YAD7SH0SKyL/ElIcIlAQNwrrs/OKhaKeehUtDfwe+JTWVY/lBKld+biqIuU34tSlZGjofeQoMtCOnGAGU4Xe5shzF8tXc71ytzylVA9FLRLtxzXphu3JHywo1U3KDaWT7LGRi29QVfXdOl3jF1vlx8fHU2kCgk=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=citrix.com;
From: Roger Pau Monne <roger.pau@citrix.com>
To: xen-devel@lists.xenproject.org
Cc: Roger Pau Monne <roger.pau@citrix.com>,
	Jan Beulich <jbeulich@suse.com>,
	Andrew Cooper <andrew.cooper3@citrix.com>,
	Wei Liu <wl@xen.org>
Subject: [PATCH v2 5/6] x86/irq: print nr_irqs as limit on the number of MSI(-X) interrupts
Date: Thu, 30 Jun 2022 10:54:38 +0200
Message-Id: <20220630085439.83193-6-roger.pau@citrix.com>
X-Mailer: git-send-email 2.36.1
In-Reply-To: <20220630085439.83193-1-roger.pau@citrix.com>
References: <20220630085439.83193-1-roger.pau@citrix.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: LO4P265CA0201.GBRP265.PROD.OUTLOOK.COM
 (2603:10a6:600:318::10) To DS7PR03MB5608.namprd03.prod.outlook.com
 (2603:10b6:5:2c9::18)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 8f1c599f-42a5-4511-8392-08da5a766f40
X-MS-TrafficTypeDiagnostic: SJ0PR03MB6699:EE_
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	0EyF2/svp9Fvgx6hTxYI/V+mX9UsybS8u7hW0D88rGtXwMNFkJkym1Yv9/ZnWEw88rNKp69sctD0wT01cXCW8MwD8AqguXp+Ud1NmETRQDsHR+YfhFSGqArfhuKr6f3iR6Zu8R2db7dVBVtHWQphFFKyGQicJeDIGUIKy1rqvvnrqfkQGCDKgZPvJbiYRypeG9f6Rc8fayh4rP2c8d9WbVMD5HIayQCtpY2YIFv65X7jyiMxDGIjD0gD8dUVCxwUm1Z2VJFEdsYw0YL0UgA1oe5nWr9P1Grsh5XOyrc4sGKrirO5rVdP8t/YK7xJ4C76Ub38DCyPEqVLdMkK5fe1mbdben9VIbCVl/WXA7Ysd/bhAZ2xi17z8Av9Yh0ZMW4P6ontyZdzMl8MF0ZRCM8lRu7Wm3qDDoQHvZeAbN2Vv3XENGMqNr82P4NMdYUmi+PbdLpODiT7WIFtjQf3fHUke9tRNPKWZBUhIDbA/L3CVfCFdd0ms31vOLHHC6PJFW5Eg6he8zaJOXORqhGX3FUspz9QiW+iy3a/22POPtKfDPDulRzMZ8VWH1hG2dPebXxdDT++eipEMOTtYCynAT/6HdF6eS3kbFdV2lt18q7JfW8D3f37SbgVvlsiPJ2PSLRclUyHFjK76dCLENJ4NJZ/9SNRqOvZFrXho5lu02zh2WztGmoke2HJweknSXPwz3XDRQSIxU/hmQiz6UeOV0J4AzPJN6+3I9Eb6HwXvhflBjdWDLEouxBAdvShXgvcuPD35vvC7AfNH6Hw27qfYJA8xw==
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DS7PR03MB5608.namprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230016)(4636009)(39860400002)(376002)(396003)(366004)(346002)(136003)(186003)(36756003)(316002)(2906002)(6506007)(86362001)(54906003)(41300700001)(2616005)(4744005)(38100700002)(6916009)(66556008)(66476007)(26005)(66946007)(4326008)(5660300002)(8936002)(8676002)(6512007)(1076003)(478600001)(6486002)(82960400001)(83380400001);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?MVo3cGdpQXpHNGJiQlJNUFh3OVpQQ2J3eTFXTitVSDNMcWdDeEFja3c3akVP?=
 =?utf-8?B?dWJiWGczRmNPZ1kvSjNLaitYSHljTlNPaGJ1V2hhUGJNOEtncXk4d2pQZ1k2?=
 =?utf-8?B?SXJzdmRoT3hEVEZoZWx1N2ZxdkVnNGdTSVhNUEh4c2pKcDJqY2lUSHN2ckdM?=
 =?utf-8?B?dXA3b1pPTm5McS9malNxOHovWmgrQklheWgrTkpyeXIzT0JIQmx6eXcyMVlB?=
 =?utf-8?B?VU1VeVgyWXk5aFZYekFBQkVSc0hSWXlBWGViVTRsYWc3Q2YrL08rM2xJN3ZH?=
 =?utf-8?B?RTQ1MytJVm80R2t6Uk55SzdwQjg2b0NJQjVVVnB6d1J4S1dtTUlHZUFGTmdm?=
 =?utf-8?B?aHplOCsvbWdqbWQ1ZkFqNHQ4dzQxZmZ5akdqbk93NGxKT2RLY0pEaEplRklB?=
 =?utf-8?B?b1FreHZqVEw4L2tkRDlrckxCdDVucENEUWwwRElyMGJONHhWNER0eGRvZnFo?=
 =?utf-8?B?bWFYMUtuVUI5V2tOSWgxZWFHWHJkdWNVa2doSFk1bkFaNXVsUG5pNHgzVjFp?=
 =?utf-8?B?NHNsbUttVWRjZ1hLcnN1ZW9HV0ZGcGl2SVc5WGhyUEFyeU5RVWppd2lFL283?=
 =?utf-8?B?SE5OS29VSGZ2d3NGN0ZYTjROY0hocW1iL2FuU05hcCt2TExwNzFjOTE4dWg1?=
 =?utf-8?B?RzlzeEpmclI0a3RwMkNTaVVnRkxkOXhPSEw2dXc3N3duWWxVbzVab05DZzVw?=
 =?utf-8?B?aG5VYmhsZi9RZTZZNHhMRHBHeGVZUmNITzdxYUVFaGxCZ1VxZ3UrMEZrMVcv?=
 =?utf-8?B?Q3AxaUZJMkZIeUpDaldhSzhNQ2swNDFZS1hvNHhLNmpqQlZwbWNKbkRCYmhR?=
 =?utf-8?B?ZCttZUwxd1ArNnF1K3I1ZVJUNHJidEN2WUtqdDZYQlVxdXQ4NTFEOHMzWmFR?=
 =?utf-8?B?TEhhT3lBeW1yaC9JUllCU2FwVXN1QzFQd2M5VDFBWTlIdzBvdnBLRzNuek5N?=
 =?utf-8?B?dkVFbnJFODNsUzV6NFcwbDI3azZVZlVuWGdNYUdPY0N1eHdKMkdic24wNlpQ?=
 =?utf-8?B?YnNiWk9EaGNBWDlKdldhMjhQRk91U2s5UkdDYWh6TEZnRW1acC8yb3ArWWxj?=
 =?utf-8?B?SGV2dmRWVGI3NXlCWUJCOEVha1kxSzBFRUdtYlBuTUxMdzJRbFVndk5pMDYw?=
 =?utf-8?B?ZG5EZmhnTzBkcUZXVVpFb0lzV3VVMXJEN3JFNHYrSFdXOEpnNjc0Z08rYTFL?=
 =?utf-8?B?WVoyY3V4OE84bUVhemcvMjlLOHovekt4ZzV2L2hLWmsra2hWb1JmQ3lpUGo5?=
 =?utf-8?B?dGhYWllxWlI2eHk3VkNvbVhVZnVadkFPbHF5aDE2VzBpSUxZQjhCaG1MMHVL?=
 =?utf-8?B?NnBNc2l0WWhvdVczUWtmTGNySklDMEV5Zi9wWVB3R1krNlhXa0ZZb3JoZ0Zw?=
 =?utf-8?B?eWZKWDZBVFVXcUNSS3VtR0tWYmNPYWNPN0pxU2sxWUNDY09XWnNBbWgrZG9X?=
 =?utf-8?B?WVRLNUEwVWRNYUN5ZnRDOGZkaDFpWmZkTzM3ZmtBcXBVRVY2UDYwOEppT2Fm?=
 =?utf-8?B?M3hSdnZoVkpxamZrTE9GcTJYT0szNWJVVkM5RmdWYzR0UFVwb3JxRTM5VGkz?=
 =?utf-8?B?aGtpUnUyL0R6Sm5QTUhaQmdxNldLSGdFZGtMM3c3VkpLaWhuWTNYc0pOYzZM?=
 =?utf-8?B?QXgvMkxlOTBuV1NKWkJjcjRWbDZtNTFhRVl6RGFyNWVEZlQrbVg2MXVRamhr?=
 =?utf-8?B?ZzhrNGZIWGIyeWoxc3AveFlFNnQzUkdXREJMR1c0TFArNXZNYkxsZnhoWWVE?=
 =?utf-8?B?N05RWUZjbVUzeGFWL2FwVmQ0ZVMxSmhJbEp0cGY4UTZscytpalkrOTRwd1Vr?=
 =?utf-8?B?UnBLT29NY1VKTlIwVnZzaklnRFROY0l0S2ovZXdObVFodGp0SXcxU2hpU2RH?=
 =?utf-8?B?TG53aWVRb3FqeG5tQ3RpTyt2WlBFbWY3RytjSWpQZ1BYQ256cnZpTmxyQzJZ?=
 =?utf-8?B?UFJBNE55NVZia1RhYVJ3M3VzdytndGNSdkc2RDUwVXZpR2s1dlZsSWdXaWVo?=
 =?utf-8?B?Yi9zWXk1YVNSaS9zMzdpM0IvbllFMFRnVW9RRWVPYXJkQlhhVTUxcWVyNXFM?=
 =?utf-8?B?c3VyMnQxeWlEY3JORmlic1MwVzFScVVFM2c2NkFyU1BNZkl4c1poOVVsdmVx?=
 =?utf-8?B?aFR1L3lmZWQ2U2krOHd2NjR4eE42eFRoT3EyTERKWkNFclNIQkNONXlIUDg0?=
 =?utf-8?B?OVE9PQ==?=
X-OriginatorOrg: citrix.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 8f1c599f-42a5-4511-8392-08da5a766f40
X-MS-Exchange-CrossTenant-AuthSource: DS7PR03MB5608.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 30 Jun 2022 08:56:34.6736
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 335836de-42ef-43a2-b145-348c2ee9ca5b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 4xFg4qZKlk1Tg4Theh8+zFCFjQ+N+X5oPIzhPVweVNfWwtNUulhtg6/QQCzA8U9tf77MFDapCoZvujjnd5sBNw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SJ0PR03MB6699

Using nr_irqs minus nr_irqs_gsi is misleading, as GSI interrupts are
not allocated unless requested by the hardware domain, so a hardware
domain could not use any GSI (or just one for the ACPI SCI), and hence
(almost) all nr_irqs will be available for MSI(-X) usage.

No functional difference, just affects the printed message.

Signed-off-by: Roger Pau Monné <roger.pau@citrix.com>
---
 xen/arch/x86/irq.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/xen/arch/x86/irq.c b/xen/arch/x86/irq.c
index b64d18c450..7f75ec8bcc 100644
--- a/xen/arch/x86/irq.c
+++ b/xen/arch/x86/irq.c
@@ -434,7 +434,7 @@ int __init init_irq_data(void)
         nr_irqs = 16;
 
     printk(XENLOG_INFO "IRQ limits: %u GSI, %u MSI/MSI-X\n",
-           nr_irqs_gsi, nr_irqs - nr_irqs_gsi);
+           nr_irqs_gsi, nr_irqs);
 
     for ( vector = 0; vector < X86_NR_VECTORS; ++vector )
         this_cpu(vector_irq)[vector] = INT_MIN;
-- 
2.36.1



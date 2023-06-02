Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id E1191720448
	for <lists+xen-devel@lfdr.de>; Fri,  2 Jun 2023 16:23:49 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.543159.847876 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1q55fo-0007Og-MI; Fri, 02 Jun 2023 14:22:36 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 543159.847876; Fri, 02 Jun 2023 14:22:36 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1q55fo-0007MP-Jc; Fri, 02 Jun 2023 14:22:36 +0000
Received: by outflank-mailman (input) for mailman id 543159;
 Fri, 02 Jun 2023 14:22:34 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=c0ON=BW=citrix.com=prvs=5106ed88e=Andrew.Cooper3@srs-se1.protection.inumbo.net>)
 id 1q55fm-0007MJ-MR
 for xen-devel@lists.xenproject.org; Fri, 02 Jun 2023 14:22:34 +0000
Received: from esa2.hc3370-68.iphmx.com (esa2.hc3370-68.iphmx.com
 [216.71.145.153]) by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id e8013fc3-0150-11ee-8611-37d641c3527e;
 Fri, 02 Jun 2023 16:22:31 +0200 (CEST)
Received: from mail-mw2nam12lp2042.outbound.protection.outlook.com (HELO
 NAM12-MW2-obe.outbound.protection.outlook.com) ([104.47.66.42])
 by ob1.hc3370-68.iphmx.com with ESMTP/TLS/ECDHE-RSA-AES128-GCM-SHA256;
 02 Jun 2023 10:22:28 -0400
Received: from BYAPR03MB3623.namprd03.prod.outlook.com (2603:10b6:a02:aa::12)
 by MW4PR03MB7012.namprd03.prod.outlook.com (2603:10b6:303:1a7::17)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6433.26; Fri, 2 Jun
 2023 14:22:26 +0000
Received: from BYAPR03MB3623.namprd03.prod.outlook.com
 ([fe80::10bb:98bc:e36d:36ab]) by BYAPR03MB3623.namprd03.prod.outlook.com
 ([fe80::10bb:98bc:e36d:36ab%3]) with mapi id 15.20.6455.020; Fri, 2 Jun 2023
 14:22:26 +0000
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
X-Inumbo-ID: e8013fc3-0150-11ee-8611-37d641c3527e
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=citrix.com; s=securemail; t=1685715751;
  h=message-id:date:from:subject:to:cc:references:
   in-reply-to:content-transfer-encoding:mime-version;
  bh=RTQQXz0CdsasnZBTkyMnFyTYpc3MSjySdr1fmUM7CE8=;
  b=A1vtgZlNKAw6fj1PSScW5iZ7cNIdMn5MNpRjN0xhC9wn3tGrYrSu9f+k
   EZrUkXr+aGSzXwpLA0qZ9aGghQaZ50yLux0iDmCu+fuF3PvH1rQPtuOj4
   hi3XaYYC56URFF2SFt9yAw7rvr97RWDihJTFTqXX9GethA/TZNvXzjWjR
   8=;
X-IronPort-RemoteIP: 104.47.66.42
X-IronPort-MID: 111260361
X-IronPort-Reputation: None
X-IronPort-Listener: OutboundMail
X-IronPort-SenderGroup: RELAY_O365
X-IronPort-MailFlowPolicy: $RELAYED
IronPort-Data: A9a23:xTjO4qB/c6VUoBVW/+jiw5YqxClBgxIJ4kV8jS/XYbTApGgh0WEAy
 GdJCz+EOvjYYmPyfNhxbt6+p0gO75bUztNqQQY4rX1jcSlH+JHPbTi7wuUcHAvJd5GeExg3h
 yk6QoOdRCzhZiaE/n9BCpC48T8nk/nOHuGmYAL9EngZbRd+Tys8gg5Ulec8g4p56fC0GArIs
 t7pyyHlEAbNNwVcbCRMs8pvlDs15K6p4G1A5ARlDRx2lAS2e0c9Xcp3yZ6ZdxMUcqEMdsamS
 uDKyq2O/2+x13/B3fv8z94X2mVTKlLjFVDmZkh+AsBOsTAbzsAG6Y4pNeJ0VKtio27hc+ada
 jl6ncfYpQ8BZsUgkQmGOvVSO3kW0aZuoNcrLZUj2CA6IoKvn3bEmp1T4E8K0YIwo8s0WyZz0
 v0hGhNWUgmq3tiS+6C1Rbw57igjBJGD0II3nFhFlGucKMl8BJfJTuPN+MNS2yo2ioZWB/HCa
 sEFaD1pKhPdfxlIPVRRA5U79AuqriCnL3sE9xTL++xruQA/zyQouFTpGPPTdsaHWoN+mUGAq
 3id12/4HgsbJJqUzj/tHneE37aWx32jA9xLfFG+3qFHhWKQ5X42MjQfD127/f/60nSxHM0Kf
 iT4/QJr98De7neDR93wXRS+rGSD+AAVX95dEeoS4wWK16aS6AGcbkAUQzgEZNE4ucseQT0xy
 kTPj97vHSZosrCeVTSa7Lj8hTG4NDURLGQCTTQZVgZD6N7myKksijrfQ9AlF7S65uAZAhn1y
 jGO6S0h3bMaiJdR073hpQydxTWxupLOUwg5oB3NWX6o5R94Y4jjYJG07V/c7rBLK4PxokS9g
 UXoUvO2tIgmZaxhXgTUKAnRNNlFP8q4DQA=
IronPort-HdrOrdr: A9a23:9v5c/aA5WBjKLvzlHelw55DYdb4zR+YMi2TDtnoBMiC9F/byqy
 nAppomPHPP5Qr5G0tQ/exoQZPgfZqEz/5ICOoqTNWftWvdyROVxehZhOOJ/9SHIVyaygc378
 hdmsZFZOEYQmIK6voSTTPIdeoI0Z2syojtr+Hb1nJsRQZhZ+Vb6RtjAArzKDwUeOADP+tBKK
 ah
X-Talos-CUID: 9a23:ySZCWm88SpN9F21v/KKVvxc5WZpiT1rc9UXzeHOhID9TbIaHR1DFrQ==
X-Talos-MUID: 9a23:ttLCNQig8a+K/ov1vEvodsMpa+pt3KeNGmU3uJxcvcnYM28oATjak2Hi
X-IronPort-AV: E=Sophos;i="6.00,213,1681185600"; 
   d="scan'208";a="111260361"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=CNvgfXVtrjmxdxS5O18YkfP1kh8lIsh/eckW6Q2mS9uvbaxIem2vdxAtVP3cXaaBzS/jSXcObR3Dn3Ysg3O/PfmE66Xp0XplQPFzwaQjtPnqtsOx871Sbc2Y/KbIpsFVfP8HXsyLtrExSSc2atMrmzR9f6eBgjooTL/78zDIPHg4LwdIDp57sJvM0NW7wzF049kyBnfmivZ1ZPZLARcQ35GMEOvtbIucc8tpeywDQkR6hqYlC0YtG3UkhlJZXshf/uqqbui4Nr0jMjrxdiiXNXLK2SpBuxxOHZfqGPHKBaREdtusQbST956pAvvPkFolquHlFCeGP8IdX27Yzy4ufg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=lZQRs8n01FgUcTdtldb14zaD/VwkgPSJCxa4eRxeYXk=;
 b=ex7DCj1u5B7Lx0v80d0nUQ77SxZJwVZiRxY7IYgGCZsn06CdW9cnEQ+pWoE/i4FDl242pT01kUxEbumUPt5DhCql5iDIFADS7Fi9qw0HtXEJw1M9qci6IlLESK4C1NFQulfNXWZgBwZcuxtL+YqFQa5y2jWX296JHKaAUazwJgiv6hLwq9aTyN4xGEQ8ZD7K/GCMUGxKr96VdEhpHvUXKKFCbkzDtKagJM3kWmG3Q/lbfxiGrhFNfbsMRqYVvMTgAwX65rj+hnoTxTebX3CNwyzwzNkO3TdfdaCTikKsDo4fVqiHH49Qx2BfEAhL/gM6AaFbIJNQ1i5sjoNw0lra+Q==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=citrix.com; dmarc=pass action=none header.from=citrix.com;
 dkim=pass header.d=citrix.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=citrix.onmicrosoft.com; s=selector2-citrix-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=lZQRs8n01FgUcTdtldb14zaD/VwkgPSJCxa4eRxeYXk=;
 b=uzTjELtk9nt/4NPa9r59mhwhGuEa60TYUlwA2bTjeN66qZ/0ws/yCrBIUicuDlqHUg3lAtK4BDWi2k6DLy2smcl9rOp9nomRsssL2DvckR++QV0gZKFp0/nBOjq/7DVicuHkoaEGdCr4KZo9pRgeLycIPM37LoHrbE5si29EZC0=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=citrix.com;
Message-ID: <55945272-58d8-3dd3-19a4-0dea9be1db6d@citrix.com>
Date: Fri, 2 Jun 2023 15:22:20 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.11.0
From: Andrew Cooper <andrew.cooper3@citrix.com>
Subject: Re: [PATCH] x86: Add Kconfig option to require NX bit support
Content-Language: en-GB
To: Alejandro Vallejo <alejandro.vallejo@cloud.com>,
 Xen-devel <xen-devel@lists.xenproject.org>
Cc: Jan Beulich <jbeulich@suse.com>, =?UTF-8?Q?Roger_Pau_Monn=c3=a9?=
 <roger.pau@citrix.com>, Wei Liu <wl@xen.org>
References: <20230601174327.11401-1-alejandro.vallejo@cloud.com>
In-Reply-To: <20230601174327.11401-1-alejandro.vallejo@cloud.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: LO4P123CA0063.GBRP123.PROD.OUTLOOK.COM
 (2603:10a6:600:153::14) To BYAPR03MB3623.namprd03.prod.outlook.com
 (2603:10b6:a02:aa::12)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: BYAPR03MB3623:EE_|MW4PR03MB7012:EE_
X-MS-Office365-Filtering-Correlation-Id: b2737d2c-ce50-4572-7cb7-08db6374ca30
X-LD-Processed: 335836de-42ef-43a2-b145-348c2ee9ca5b,ExtAddr,ExtFwd
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	/xgzyLDMeT2T8cF35a/ccZ+hH0Ia7N3tLd+ONlaS+CIDI0C/R4ynKT7/YNxFh3KAuqRpZrh2h6dnsd5OnCbRQV6vmhE3JpomdOhxzB8++NchUkwKf0fRD9C+sn0O/Vm5fOM2cDPV6ULVAlrKyqaQ03Y2BMH8uJ2RTY1h+tAG4bm8+6rqnIZj+RRPM/l9NCQi3DbMo6cblH9aSEam9lKmPKlE+bU6fORHK7O7bdm6DhrJ6GIVuaFLllFFr4efp+KqEe1sRltZUOmV8E2zXFbZtXbHMatZBa0nRlejpEUokGYw9zvdMOb/cBo1vaOeOLnHL+DZ6kMWC4GpX1nc4pjfo0PVODHg0MSv67eo0L0JcbzTu+Mw44ew4SlryrBBNlI5T/NlcLbaPwu4yu/BYaSNoKQ5zlWwzouVYyd2SDsSzRKiI/f4glf+GSfkWQPA6uNE/7LDcGr3cvHxXQk4BFXUir0oGAZ3m5SQs3Pycavflek+a5eedCrRTLKhWqc31z/Zd1pOkiOeucUSxISzCCmDLIkiP/JB8uJ1Fo/3JFXOfc00MGhACoiOXVQFEBQplDY50+AObsk/nMw8uW+b0MEqBHtf0sSC2py9hLP9jI5tpEk=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:BYAPR03MB3623.namprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230028)(4636009)(39860400002)(136003)(366004)(376002)(396003)(346002)(451199021)(26005)(5660300002)(8936002)(6512007)(8676002)(82960400001)(38100700002)(53546011)(83380400001)(186003)(2616005)(6506007)(2906002)(316002)(6666004)(6486002)(4326008)(66556008)(66476007)(966005)(31696002)(66946007)(41300700001)(86362001)(36756003)(110136005)(478600001)(54906003)(66899021)(31686004)(45980500001)(43740500002);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?a2RRbDgxUzR5eTlEVGNSanlKQmpkS3J1ZFdRZlJ5dmpoQ3kyb201TnBkb0Q2?=
 =?utf-8?B?SWNPQTMzd21VRGVUYUczaFNrdnVleFNTZklGckhiSjVRbnZMT0ZLblJ4blI4?=
 =?utf-8?B?U0tGK29zTDc2NHk4aHlNQ3VRSDNidmJ6bExtNXRRV3FGU0h3TXVVRURFa1Ux?=
 =?utf-8?B?bGI0b1JwTlN5ZlhYVC9Ba1RSWXpYUVhNa1R1VzZJaGY4ZW84SlVtZzMwYk5m?=
 =?utf-8?B?NXk1amJnTUtSd1ZLWkozVHNLUUd5S2FQUXlZbm9TeEt5TzRocWVWOXZUUjNV?=
 =?utf-8?B?akViSjVQQXB1YVpjWXpqVFh1ZE5oSC8yWTZ2UUcvN0JTV3BiSlplZWpDSHpO?=
 =?utf-8?B?TDBveGVoUjkrQ1N4cGFqZG0zOWRBQlk4c3pXdFFQc2FkWDNxMUh5QzIvaU5j?=
 =?utf-8?B?VEFLL3A0UFo3WjBWM1dzUWNFVEp3OHFONnZoVFJKQ3dMa3FWbXd3dU5lNThU?=
 =?utf-8?B?YmZ3Z3NtZkhnYWloV1ZLTUpmYUFmdVBUc1NKWkp1TzJTc1h2WXMwV2lBVGI1?=
 =?utf-8?B?MEM1SWNCMVkxL2xHY0pvYmJMTnAzTHZRcGJ2ZkJGR1BjU3RabWR1Z1JlVkRI?=
 =?utf-8?B?cnZtQk1NV3Rzalk3dWlvb0ZlSnIxYlN1RkcwRDdwSXVhMXZpUmQvN2ZpaGx6?=
 =?utf-8?B?TTRPeHlwMkFSNENuQWNqa2hOelViUjJNZjhSS1AxRHNuZ3VOZW5xVHpybmFl?=
 =?utf-8?B?SUZzV3J2dnBXbmhVd2Y2YzFKMm5xWW83YVZJTnJlVmNkVmtIOXlqWHpJSHdM?=
 =?utf-8?B?ODdZV3BhMWdiMldkbnRQZW9BbUR5VnVyQ3JCeTYzSStPK1dNMXpZL0ZybGRW?=
 =?utf-8?B?RFQ4TkloYjlOb0Z1YzJlSTF0SXg3dGFjOTdzcG1NQ3NYSUlydGtzZUh5bmNo?=
 =?utf-8?B?UGRFbUk3NllVSnRzKzBSaTdXbExnNU9lSTJ6RisvK210ODZNOENkSHZneUUz?=
 =?utf-8?B?cjRmUjZNUlVwNWdZdFpjYUdsRVc4aTFQdUNWRG1VY1N6bytmcHR2SG9WSlRG?=
 =?utf-8?B?bng5MHZwWE5OeSs5V3pBcEhDYjd5OWYvRVZIQWNuQU9SU0hMQi94TWp5TGhK?=
 =?utf-8?B?MmFBRVlremY2VElnbGFQaHhFNG41cWM0Z2ZCSVo0Qkx6ZHVsaDllMzJCTStx?=
 =?utf-8?B?SXNLK0hvYUQyS2hlSnFyOVhpRkdLZzVxdEtNVTR6ei9USytmTUNYTE1vNENO?=
 =?utf-8?B?R0VTU25KS0krYlBhUWFRRE5JR3M5enBIekxocktIWTJBMkx3THdVR3BzTnEy?=
 =?utf-8?B?cWdiUGV3cFdwZmZ4Y0Z6M0VTZE9JYi9aanNnOE40QjlZa3hXcmQxRFc0MmFk?=
 =?utf-8?B?d0JzYWVqMDgxS0RLVHpEc2FEK3k3ZW9EdSs4ZjJ6S3lVMS9XWHovWFdTUUdk?=
 =?utf-8?B?czRCMlBuY2JFQkxYTTZJTDlzcSt0SGpjbTdqTW9wcXFCL2JYTDlDT1Rrcmcr?=
 =?utf-8?B?Ly9DYUE5QWJUT1hhQ2loZkI5TVFkNk44Z3FNVmVnVHBBOXRxczJ3R0twdGJu?=
 =?utf-8?B?TTZKUmFkeUNXejBLUnRYdncxTW5mQ3dyUzJyR3B5aS92SEVXU2pEalM1aThG?=
 =?utf-8?B?ZVBaR2JvVnU5bGJrVTN5SlZEMmdQdGgyZDArOHVvL3JNbTNvcXFCaG00SVhX?=
 =?utf-8?B?TjErdHhEQ0dqbzQ5N2FVS0RmT29sOEFWbVkrODdwamExN0NuWkV1OThjdkVw?=
 =?utf-8?B?S09EVHdKWldBTGZjcm9yUUJ6c05hZjRaSjRiVnJaV0RaYS9FUWMzaUdLeTR2?=
 =?utf-8?B?WXFtYVowQ0NoK3BmODVDZ2U5OW1WYnc2UEduZ0h5K3hsVFc0amJDWnpYSUFq?=
 =?utf-8?B?MEVTODlwOHJGZkJxVHhCV2NadnlvcGw1cTRiaGZjTU9jM3lLWW5keTJGdC9x?=
 =?utf-8?B?WUtMZXdGM3FmalNLRGl5bHl5TmMvUGVQZkQzUGZnVzlsZWUyODRtUG5zSkxC?=
 =?utf-8?B?SkI0Mm5qZHBxbGpXRWI2b1hwWmhKUVpPRk1GWG9tcUFTM0RMaGVxVDl3Q0Uz?=
 =?utf-8?B?WW14MkFZVDRxRnl1WDRkc3ZISk9TdG4wQi9mQ2dSRlZYWlNCZGNhTWZMS1Nv?=
 =?utf-8?B?amxoZkJ1SzBvbngvSHc2NHR2Mnl3WThHV3UyWXlZVzhTLy9mOForYkRuelZ0?=
 =?utf-8?B?bk9HK3QweFc1SjRHQ1RHVTEySmg3TThaYkxCc2hEcWsrWG1tWVZ3V2RZTWNO?=
 =?utf-8?B?ekE9PQ==?=
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-0:
	+eC/fZcm7RmsqVPMbhGNZjAWN7LM39bH0Mc6guceGvxF6lcs1vxQUQYCVLQCBV5w2UISdrjZccQR7hJLU7XdE858uoM0EeQtXlCifGtRVvAtx8Xu0fNbfd0PX3szHBKVF3RLLyIdJ8RcyQRCcjr/bHFhAO4L8oxrULsK29mD3btrequeNqscMo2dPwOxI29R7/h6PUH/fZc4FCyIgFC3CJsSVyiruXY//PpMTxPUvOPhV0E5csi1xkGr9c/ypHFzms4KKpW3JJftmmbbjjkICji58kFiVTsOI9/vLJgUBQo+leLQpCkHvNfUxCltRbtt3fnFSf042VcpKteJTyuGEKEFsaj9ZsNfvbyW5rFV3CKETmPYOW158Q9yH89b0urWBioh02njZoMjVZnLFylwVy408cx/AYVQZwhciv9YToklXskuSL9YhFZrfSNNzs8M8elzIhVO2TNdJsIStFaE/vpdXOT1Es+/tIxH+4a/J8vSdxbZdHMkhQj/xoNr18oyfj6PPUYMBTHqNUl8zApY7UQ0r9nZaRf8dKHy06VM0SiRLpzxY+TfmfHXhSz4JLJHUgecN7599kewwXng3W7UgQF5v8cX9X3CHrlmMSsCvx8VRrxvsdis9KiFP7r5yyf7ML63Q5dxJQlsHJaoA3HvuboPczZcJLmzWHQng9vhAcKsZWdLhsRvBNil2q4hdt2b4/TKt6Vns2Uwb6FcY8sDHSwUW+XxHuz4PicsPuMTjYkJbrxT6JGCd/YEHRFe9ZkX857B169QHHVjvDXGDOCfg/RoEncWKmZL+ZYa4YCSaQ49ENmy5h1a49vMgE4BnNYAiYUDWxAcROMdSUYBkI7aufOw9llrAKm7/tKjCP/3nfk=
X-OriginatorOrg: citrix.com
X-MS-Exchange-CrossTenant-Network-Message-Id: b2737d2c-ce50-4572-7cb7-08db6374ca30
X-MS-Exchange-CrossTenant-AuthSource: BYAPR03MB3623.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 02 Jun 2023 14:22:26.5831
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 335836de-42ef-43a2-b145-348c2ee9ca5b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: UZCLl8WssbH0UvPVcyKRgVPfM/G4t9PhpfOsWHl20biyj4EKh2hZiaJUOUHJ52iW88Fz5EpV2BOThf1rLpGOZPBdXXA8dTAyQxh3Q7SwnoI=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MW4PR03MB7012

On 01/06/2023 6:43 pm, Alejandro Vallejo wrote:
> diff --git a/xen/arch/x86/boot/head.S b/xen/arch/x86/boot/head.S
> index 09bebf8635..8414266281 100644
> --- a/xen/arch/x86/boot/head.S
> +++ b/xen/arch/x86/boot/head.S
> @@ -647,11 +653,18 @@ trampoline_setup:
>          cpuid
>  1:      mov     %edx, CPUINFO_FEATURE_OFFSET(X86_FEATURE_LM) + sym_esi(boot_cpu_data)
>  
> -        /* Check for NX. Adjust EFER setting if available. */
> +        /*
> +         * Check for NX:
> +         *   - If Xen was compiled requiring it simply assert it's
> +         *     supported. The trampoline already has the right constant.
> +         *   - Otherwise, update the trampoline EFER mask accordingly.
> +         */
>          bt      $cpufeat_bit(X86_FEATURE_NX), %edx
> -        jnc     1f
> +        jnc     no_nx_bit
> +#if !IS_ENABLED(CONFIG_REQUIRE_NX_BIT)
>          orb     $EFER_NXE >> 8, 1 + sym_esi(trampoline_efer)
> -1:
> +no_nx_bit:
> +#endif

It occurs to me...  This will prevent Xen booting in firmware
configurations where XD-Disable is active, despite Xen having
unconditional logic to turn XD off later in boot.

Linux deals with this in verify_cpu() (early asm) along with a FMS check
protecting the access to MSR_MISC_ENABLE, rather than using rdmsr_safe()
and catching the #GP.


In terms of which CPUs are a problem, we almost got very lucky.  NX is
part of the AMD64 spec, and all AMD, VIA, Centaur and Intel Atoms have
this property.  64bit and XD were both added midway through the Pentium
4 era, and appear in the Prescott E0 stepping.

However, it appears that the prior stepping, D0, had 64bit but was only
unlocked for certain OEMs.  (At the time, Intel were still trying to
push Itaniaum as the future, and were trying hard not to go the x86_64
route.)

Specifically,
https://en.wikipedia.org/wiki/List_of_Intel_Xeon_processors_(NetBurst-based)#%22Nocona%22_(90_nm)
is the suspected problem set.


So, I think this does want to turn into a series, with the first patch
moving the XD-disable logic into this path, after which I think there is
a strong case to be made for defaulting CONFIG_REQUIRE_NX to yes.
 
~Andrew


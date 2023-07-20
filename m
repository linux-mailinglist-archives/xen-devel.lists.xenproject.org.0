Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 1D28C75AC63
	for <lists+xen-devel@lfdr.de>; Thu, 20 Jul 2023 12:51:45 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.566539.885484 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qMRFn-0007HE-Qf; Thu, 20 Jul 2023 10:51:27 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 566539.885484; Thu, 20 Jul 2023 10:51:27 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qMRFn-0007Eg-Nd; Thu, 20 Jul 2023 10:51:27 +0000
Received: by outflank-mailman (input) for mailman id 566539;
 Thu, 20 Jul 2023 10:51:26 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=kV2r=DG=citrix.com=prvs=558cdb244=Andrew.Cooper3@srs-se1.protection.inumbo.net>)
 id 1qMRFm-0007EW-1U
 for xen-devel@lists.xenproject.org; Thu, 20 Jul 2023 10:51:26 +0000
Received: from esa1.hc3370-68.iphmx.com (esa1.hc3370-68.iphmx.com
 [216.71.145.142]) by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 5c1e8dda-26eb-11ee-8611-37d641c3527e;
 Thu, 20 Jul 2023 12:51:21 +0200 (CEST)
Received: from mail-sn1nam02lp2045.outbound.protection.outlook.com (HELO
 NAM02-SN1-obe.outbound.protection.outlook.com) ([104.47.57.45])
 by ob1.hc3370-68.iphmx.com with ESMTP/TLS/ECDHE-RSA-AES128-GCM-SHA256;
 20 Jul 2023 06:51:06 -0400
Received: from BYAPR03MB3623.namprd03.prod.outlook.com (2603:10b6:a02:aa::12)
 by BY5PR03MB5048.namprd03.prod.outlook.com (2603:10b6:a03:1e8::11)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6609.24; Thu, 20 Jul
 2023 10:51:04 +0000
Received: from BYAPR03MB3623.namprd03.prod.outlook.com
 ([fe80::ea9c:844:91b8:a780]) by BYAPR03MB3623.namprd03.prod.outlook.com
 ([fe80::ea9c:844:91b8:a780%5]) with mapi id 15.20.6609.026; Thu, 20 Jul 2023
 10:51:04 +0000
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
X-Inumbo-ID: 5c1e8dda-26eb-11ee-8611-37d641c3527e
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=citrix.com; s=securemail; t=1689850281;
  h=message-id:date:from:subject:to:cc:references:
   in-reply-to:content-transfer-encoding:mime-version;
  bh=xBiZllQ1ymSMddPnEAVyxLTZp6lUIpuNJ5zv/DmQQSI=;
  b=YvliZKejwuoAJBTLsGRf5QQ5PCA4uF5Vexik53pOHmXrv2CEooH9xF9n
   /V9eMPl/putJmKMff816zoHICdbN1qlDzdGNfUsN5yFLqUVExFm9VBZw/
   8bQ6fgQcucSmJ3DtIsrzuXSQDShEtA3Y0eiaW6AIZsTM9ckKnoGJZuxqN
   8=;
X-IronPort-RemoteIP: 104.47.57.45
X-IronPort-MID: 117283739
X-IronPort-Reputation: None
X-IronPort-Listener: OutboundMail
X-IronPort-SenderGroup: RELAY_O365
X-IronPort-MailFlowPolicy: $RELAYED
IronPort-Data: A9a23:AyUlwaCV2Aab3RVW/+riw5YqxClBgxIJ4kV8jS/XYbTApDIh0mRSy
 zYZXT3QOfqINjHze4p/bY+19ElQuMXTx9U1QQY4rX1jcSlH+JHPbTi7wuUcHAvJd5GeExg3h
 yk6QoOdRCzhZiaE/n9BCpC48T8nk/nOHuGmYAL9EngZbRd+Tys8gg5Ulec8g4p56fC0GArIs
 t7pyyHlEAbNNwVcbCRMsspvlDs15K6p4GxC5gRnDRx2lAS2e0c9Xcp3yZ6ZdxMUcqEMdsamS
 uDKyq2O/2+x13/B3fv8z94X2mVTKlLjFVDmZkh+AsBOsTAbzsAG6Y4pNeJ0VKtio27hc+ada
 jl6ncfYpQ8BZsUgkQmGOvVSO3kW0aZuoNcrLZUj2CA6IoKvn3bEmp1T4E8K0YIw5PZ1Lz8Rr
 PsjDxcBPxC/ufuMmJWEVbw57igjBJGD0II3nFhFlWucNtB/BJfJTuPN+MNS2yo2ioZWB/HCa
 sEFaD1pKhPdfxlIPVRRA5U79AuqriCnL3sE9xTI+uxrvgA/zyQouFTpGPPTdsaHWoN+mUGAq
 3id12/4HgsbJJqUzj/tHneE37aQx3OgB9lDfFG+3sFSi0/P4mswNAE5dEaEn6XggBKcVM0Kf
 iT4/QJr98De7neDTNPwQhm5q36spQMHVpxbFOhSwBGAzO/Y7hiUAkAATyVdc5o2uckuXzso2
 1SV2dTzClRHr7m9WX+bsLCOoluaNyUZIHUDbihCVgYf6tfipoAbhA/AVdtlH+i+ididJN3r6
 zWDrSx7nLNKi8cOj/+/5Qqf32/qoYXVRAko4AmRRnii8g5yeI+iYcqv9ETf6vFDao2eSzFto
 UQ5piRX18hWZbnlqcBHaLVl8G2BjxpdDADhvA==
IronPort-HdrOrdr: A9a23:eNH5CqH7cNZBoPHmpLqF9ZLXdLJyesId70hD6qkvc3Fom52j/f
 xGws5x6faVslkssb8b6Km90dq7MBThHPlOkPQs1NaZLXPbUQ6TQL2KgrGSoAEIdxeOk9K1kJ
 0QCJSWa+eAc2SS7/yb3ODQKb9Jrri6GeKT9J/jJh9WPH5XgspbnmNE42igYytLrUV9dPgE/M
 323Ls6m9PsQwVeUiz9bUN1LdTrlpnurtbLcBQGDxko5E2nii6p0qfzF1y1zwoTSDRGxJYl6C
 zgnxbi7quunvmnwluEvlWjo6h+qZ/E8J9uFcaMgs8aJnHFjRupXp1oX/mvrS04u+am7XctiZ
 3prw07N8p+xnvNdiWeoAfr2SPnzDEygkWShGOwsD/Gm4jUVTg6A81OicZwdQbY0VMpuJVZ3L
 hQ12yUmpJLBVeY9R6NreTgZlVPrA6ZsHAimekcgzh2VpYfUqZYqcg68FlOGJkNMSrm4MQMEf
 VoDuvb+PFKGGnqJEzxjy1K+piBT34zFhCJTgwrvdGU6SFfmDRDw04R1KUk7wA93aN4b6MBy/
 XPM6xumr0LZNQRd7hBCOAIRtbyInDRQDrXWVjiYWjPJeUiATbgupT36LI66KWBY5oT1qY/n5
 zHTRdxqXMyQUTzEseDtac7sywleF/NHwgF9/suoqSQ4tbHNf7W2Gy4OR4TevKb0rYi6paxYY
 f1BHpUa8WTWVcGV7w5mTEWYKMiWkX2YPdly+rTZGj+0v4jCreawNAzI8yjbYbFIHIDZl7VJE
 clcXzaGPhgh3rbL0MQxiKhFE/QRg==
X-Talos-CUID: =?us-ascii?q?9a23=3AG2iXyGhAx76oLREre3LM8tbOKjJubG3f4imPeki?=
 =?us-ascii?q?DLkFlGb2pd0aqoIRbjJ87?=
X-Talos-MUID: =?us-ascii?q?9a23=3AzNaZwQ1yGSVZbrXxBO8H8DeUfDUj3JylGhwplrY?=
 =?us-ascii?q?6p+alKBNOZ26X0Ba4Xdpy?=
X-IronPort-AV: E=Sophos;i="6.01,218,1684814400"; 
   d="scan'208";a="117283739"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=nXMHw7ujK7RM5qbgtCVyiQG5Zrix6aypOZpupOeReWXNopQS59fDe4jqHtqy5ffUFvPBNzmH8EHzDhkb1CXpRCQXLhWC7OoasIsMGVsfdAuEruIARdxO8tbuS6RFsmlsRB7TggC95YiRUi/xUys8chFggrcgomD1CoZngMszDQLSfvLi4taNEXunJ6C8vhx4vGTPc+VLzc1/84YuI93Ek86KUDkUb4S5tdXqmLE4qOVJPIM8qcwAhum3Obi5KAcOQWlP17mEQMMZjgi32qhZVIqb+cTAzEr/YlC4YCpFys9+Yc0VqPEgHv9sWNZzugtmtHLaOylMaMTUAturi0v/OQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=xBiZllQ1ymSMddPnEAVyxLTZp6lUIpuNJ5zv/DmQQSI=;
 b=PleXQ86UOq973ew1gowj30H14FP/CHFsb4sGYJeCtgseg96IVZTZ0D2OinXRf8TzMzpylKcYTh5w6V6twGEZbJTRQ0azZp/nkcrMVU+UGaCQbWnQYf8Q38NXjGUbA9Dn3q09mN8lrVWj/3zE23JYC7TEam0GAhyXcWJZTwLyBV+BfZcDAUOxV8daU0k4uK/fmXlLe9BQzRaUEvSQAy6vCV/M5TdqwztlEng4a9KwrSOvplMg1ymnY3zFmFtxd+WDnIbbWHnvU6pVFq1apVV1PGAOQJem+aWij2f+oodAgUpY41smAujL6b8YaaKTeS3rC57VufDSc4N/VfOFkdsfJA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=citrix.com; dmarc=pass action=none header.from=citrix.com;
 dkim=pass header.d=citrix.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=citrix.onmicrosoft.com; s=selector2-citrix-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=xBiZllQ1ymSMddPnEAVyxLTZp6lUIpuNJ5zv/DmQQSI=;
 b=ToewWTIrvHohIrYs6oM3rg+G8W7FNexpaJmblox3W65S+O0xyziiHD5vKkB2JLVHecpWKD1eBgw/Oq+PAAcYHl+KcovEPSw4w+lU/tMLm2x85RmqCVEw2HwepZCf/nrA4s/KUeaD6TXcjrDYrMI133zPzWnSFSPLzwUEm8iDB6A=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=citrix.com;
Message-ID: <c8e4396a-78dd-52c1-6cbf-26263f2456cc@citrix.com>
Date: Thu, 20 Jul 2023 11:50:59 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.13.0
From: Andrew Cooper <andrew.cooper3@citrix.com>
Subject: Re: [PATCH] x86/vRTC: move and tidy convert_hour() and
 {to,from}_bcd()
Content-Language: en-GB
To: Jan Beulich <jbeulich@suse.com>,
 "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>
Cc: Wei Liu <wl@xen.org>, =?UTF-8?Q?Roger_Pau_Monn=c3=a9?=
 <roger.pau@citrix.com>, Federico Serafini <federico.serafini@bugseng.com>
References: <e983103a-be32-7a77-4d7e-6d5559443f56@suse.com>
In-Reply-To: <e983103a-be32-7a77-4d7e-6d5559443f56@suse.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: LO2P123CA0011.GBRP123.PROD.OUTLOOK.COM
 (2603:10a6:600:a6::23) To BYAPR03MB3623.namprd03.prod.outlook.com
 (2603:10b6:a02:aa::12)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: BYAPR03MB3623:EE_|BY5PR03MB5048:EE_
X-MS-Office365-Filtering-Correlation-Id: 135cf575-00f1-4f4a-a0e9-08db890f36de
X-LD-Processed: 335836de-42ef-43a2-b145-348c2ee9ca5b,ExtAddr,ExtFwd
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	iEf0TPjmcuNU5b2lTyn3cjgUyTLC6T6WB5QbcaDStnEOcsJ3mvSYQe8GiKtI4oASlvwi5YNXVw1pxmfqUSy5Xukood2FMfXUA31YUNZGFJ4VJ2eKn5uxoG0L4r6gM9n2e9IFHD3Tbq87zztJ7OFwFnOMpR4+zvIzRyu8Xfv6CsB6MZet4sEgXmF1PcGQmGjmFfBZLwXBI0fU/bZdIHNiuTkmAzKsjEDkTQaZzXiepvIK7AlYKvyeFAIM/FXbYWW5usytC0poHc3hapDyr4J/6DBthlluXB4QB7nJvC7RbyTGbtP9AZf+p4eL6lcQebO2xnvmxocWvQvjmqfAsq9jbe42qPKjzc84++1Vm36o0WKzWSxxsy8mo/chcKxYcLK+CbezFHX2Xknr3YQLZjNrNejSr7OxJojgO54gUEjsDGUieUs8JU7jvQSDAMJVIsT+m/7xDMVsBjZlnyueAtMfZDd7N3GksbkRo0Vbk3vQfcHI9aQ7Qyc/9FXzRTPyi5LyIMawhLFRfJdfRtQNIggDPsQJY39OcM9RhITNlfOrkJ+tQyMDvumdxtjHUa55ded0IBLJZkePLJxfKEGPp79gLgPkHZR0GpvAzCIrDTeYKMlqlWnX7KZaDLMknl11Gy8JY8we3sMdBIeh0s3ga+i0EA==
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:BYAPR03MB3623.namprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230028)(4636009)(376002)(346002)(39860400002)(396003)(136003)(366004)(451199021)(82960400001)(38100700002)(53546011)(26005)(186003)(6506007)(2616005)(316002)(66476007)(66946007)(66556008)(4326008)(8676002)(6486002)(6512007)(5660300002)(6666004)(8936002)(41300700001)(4744005)(54906003)(2906002)(478600001)(110136005)(31696002)(36756003)(86362001)(31686004)(43740500002)(45980500001);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?Y2lJbFJlTFR6R3gwSTQ0T2krVDBNQnVWUEZlcXhnOVlWWkNrNGlxM3ZGNi9Y?=
 =?utf-8?B?eklyUTZDajVzM0doakd1U3c2eTFlcjBzZHB0d2hzWlZmaDU5bHU2ZjRwZWx2?=
 =?utf-8?B?ajVuNkRiQUIxazhsU0ZpdGllOVFlL0d6N0V1YUN1UVd3SlZGN0xiSzZ5bnkz?=
 =?utf-8?B?YVA1a3piODdheU9zRWdlRU5VNGs1ZFJFNzM5SFdFOWpZZHo1dXpLR3hOVGVi?=
 =?utf-8?B?b252SUZCMmRyelVmZXJSVW5iV1lLTGsyZkJ4N3FwdW80aHdxamtTdjRtQjJT?=
 =?utf-8?B?VUpiaDFQa3BTOGY3bUg0M2lYaldUU2NKNW01UUordHpZM2Q3NzFzeUdnL0pO?=
 =?utf-8?B?U0hlZ3VTSDJDQVpUeEhBeDIrbW1JU1ZwWmFSeEcrcmdYYlU0cVJiQTF1WVor?=
 =?utf-8?B?NVRkZUN5QTh5aEIvcndOOFVrNWwrM2o5TFlYYjhra29WQi9IYTVGTE1WSFJI?=
 =?utf-8?B?bzFzR3pmSWRQY2VzdWdoa1NaOEJUOUVOQXdmYXVybmZWRU92RkJ3M21OaTJt?=
 =?utf-8?B?OVRLVmpMbExMSE1uQVY5M2JhaEFuanVzYU9LOEdWanNBMk5UbXFXVEZDay9S?=
 =?utf-8?B?MlQ1THVqWGYzWHc3MTZGU3JvNXdBOFlTWjJKZmZXT2RGQ1BVQktiVGpvZ2VO?=
 =?utf-8?B?YjdDajBsZGt6QlNBRnZWdDgrMlNzWS9udzRVY3ZQQnBVdTBJQUVQSHFWUVR0?=
 =?utf-8?B?VzFPYWVDNXl3M1RyelRlaXV4WEtOcGQ2Z3JmNjRkK1VtZ1k0ZjF6Qm5FZkl6?=
 =?utf-8?B?RFR2Z2k5YXRxRThPbFB3VkNPckRPbTN4TGYvczNEdEFEVVloR0xtMTg3RkR2?=
 =?utf-8?B?Z2dyVk5wMGJSaEI4WitrUkw2aUJyajUweS9ZR2hndHJDTlpzWlAyenhXK0lV?=
 =?utf-8?B?T0hUWXQ2UWJIN1lnYnl5ZjIwdm9pb1A0cklrMXhCNTdsTFU0cDNJSXV5bGFp?=
 =?utf-8?B?Ry83WVV6bEpmNkc1WDdxVGZNaUVoVTFZUnRlSVFKT0ppYVJLVWZVRWVISlZU?=
 =?utf-8?B?dnZkMDJQZjFSNzF1MWF3OTVuYXZ1SzlUNWs4OWZqMkh1TUs1eVFiempQV3d1?=
 =?utf-8?B?aC9JRFBIRmc4dERrNEdiSXNNanZWdGwyT01DQzQ0K3pQeE52R1VMZ083N3Rz?=
 =?utf-8?B?S3FQMzhMZFcwUzZiNGNWeW13ZTRSRTRDd1h2ZHZlZ2VYc1ZaaHQxZHpkYU1J?=
 =?utf-8?B?YnZ2enpGVTBXMm0zc1JvTHFsNEtSSEF4MkNXTDV0RDA2bktxbExYUWpBbUFB?=
 =?utf-8?B?RmhWZm83eUllK3BRNWVpRjRvR21KejBmMWpQTlFlSE53eG1heXJsNEZvOHNW?=
 =?utf-8?B?SFVydnRDdldobktyeWFGdlhvajB4ZlA1SmY1dFkwY2hOT0E5aXBZNmF6aTAy?=
 =?utf-8?B?dEJyVXNLVkFaQXR3T0pyTWhqem9HVFFRd2VpL0xXWEpPOVFFSEJnSVR3eXJ1?=
 =?utf-8?B?cVVpWmlnZGhxZnFzVEFDTGtiWE1NUE1rekZMOERlMlhOQzh4VGFQdXB2VzZQ?=
 =?utf-8?B?am5pb0RTVi9xb3R0WDJnVkdGcmorZ3JqeTc2eTg5OWpXbkVGVEFMM0hneStv?=
 =?utf-8?B?YkpxL1k2aGNhazd5TFhSdUo0ZWF4ckhRMFh1WVUwNk5HNE1qcDFNQVJyaTc5?=
 =?utf-8?B?aExzUHBjUXJQMHVZamNWRXZFY21LWWI1aHg0YjMvWHR2RlBrTHFkZkRsbWpa?=
 =?utf-8?B?UTdWRVNsMTRtSGticDlxdFhxcit0YklLVDkzcXVpd3QyMWdZSC93K3RHRVpD?=
 =?utf-8?B?VU9pQ3FwNmlhVUN2T204RTB1L1lHL3lxaDhFMU1Qa3Q1citOOFRWUGl0WHRr?=
 =?utf-8?B?bW5vV2VjS2ZzV3VRcFhPc0NKbDNsSVJCdzRTTHQwK2FzMDgzNUVMNFkzKy9S?=
 =?utf-8?B?Zm5jRnZHWWhxSXJmY0pDeGxLVmMrT3h6TWM4bkp0VFJ2bVlnYzZKZlV6TFdH?=
 =?utf-8?B?OFpMeE51Snl6QmI5RENzSUI4eUlING9ZZ2NSai9Kcm1XNzNjaGVOTnZXYUtu?=
 =?utf-8?B?VGgxRk5XQmIwUHpxbXlOZUtjcmoxemJDVWM2Ukh1NUxRK29aaVUyUXdUdUNI?=
 =?utf-8?B?bjhDZmtqTU1JK2hyd0ZoNE5oRVJWMkdyaEFxTnR6ZTY2ZG9RTXhmNDlwZlM3?=
 =?utf-8?B?QXdhdEFUZ2F3Zm4vWXZYR2lvQnZuL21Qdk1MVWdZSG1PcHJuck9QZ1gxc3Yy?=
 =?utf-8?B?N0E9PQ==?=
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-0:
	01mz8F0Cf0SaOSA986uYa1g9lgAr5TSwYAHCHMlKk2et/BbjSWXgArLEVkB+7jdM3a3L1Lg50KUAWUkW6+CZBQobkideX+8/Ddvp1PTxFW4OoIYGNtT8UAZGeSLl0MwWTvJ4XqQxvB/2Vc572q14ic+8V44tXgd7bwAegef5OYMI1tK29iIKvso3vwg8T4jZ54NOXceQNEornV2pvLzfk7rLxrrLA7UFt1qXlBs81g5g9+6T590dcprd7hRF+uSeHxZTpyF/fO3Lyi9rpetaGlgel14amRxIHgMm3jb0dAIasI+BiT41eHUIAvhESbChHs7XpGPuZv4yuLRLQlrcx/v8wjmw0psv/oMmHZ5oTgR+dBaXo057kExCAvHWk1iF2l9JikiWp+TXwYPLq6v9h1cGffrYTHsTTxo3edh/NW2LA3lmJY8xY8ttKdrfeRX1/BNrRpFpwtiQzaIfgvNW691PWA4KnRoARICu+SwsW4f1bUsIguevjw2o43b2H9oSx+v9EEK2XXjuwIa8xQgDIDTPZKHr9PTFlPTDomLF8e19xx8+xVrxxJgt0JYwvol7kkKd7z6LuJw7+QB+frb7yWUXc51IcT514e1uItXRJnNV2Bw3xF0KKpEc5tEQeC7D1W3/VbxC1ZWVZMp2vPYW2onbh1YrXjjryKpYEgsmscdeZ+PgY28twGV7xfBk1cZywCe4rVgHgWSnPjoK8JlLSxNG2MBRAKT9t0x0dGc8VqTnGihbFxZra3WcA0qpoDU4P1do3uRBHvlVflFkwwE8cuShsiYmHU4LrNiHDZvgjj7jFonUGt38W+ug56HRG1cn0oZF/lNWIwMLhpr/xhL1Lg6iY4flJ4QzmbWxLE4gOzA=
X-OriginatorOrg: citrix.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 135cf575-00f1-4f4a-a0e9-08db890f36de
X-MS-Exchange-CrossTenant-AuthSource: BYAPR03MB3623.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 20 Jul 2023 10:51:04.5649
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 335836de-42ef-43a2-b145-348c2ee9ca5b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: Mm23hwkvhMEH5EBmiHZxy8B/mgIS0+Rio8ncKgvlx5TjiIc2bwVkbC6sp4KAKI0B57dQZGeis5s6p//FaT7pzWCJ4uO3GBSB+OCB968sxlU=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BY5PR03MB5048

On 20/07/2023 8:11 am, Jan Beulich wrote:
> This is to avoid the need for forward declarations, which in turn
> addresses a violation of MISRA C:2012 Rule 8.3 ("All declarations of an
> object or function shall use the same names and type qualifiers").
>
> While doing so,
> - drop inline (leaving the decision to the compiler),
> - add const,
> - add unsigned,
> - correct style.
>
> Signed-off-by: Jan Beulich <jbeulich@suse.com>

Acked-by: Andrew Cooper <andrew.cooper3@citrix.com>


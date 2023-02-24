Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 0799B6A1DE5
	for <lists+xen-devel@lfdr.de>; Fri, 24 Feb 2023 16:01:25 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.501121.772728 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1pVZZS-0004yD-IO; Fri, 24 Feb 2023 15:01:14 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 501121.772728; Fri, 24 Feb 2023 15:01:14 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1pVZZS-0004w8-FF; Fri, 24 Feb 2023 15:01:14 +0000
Received: by outflank-mailman (input) for mailman id 501121;
 Fri, 24 Feb 2023 15:01:12 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=V4+4=6U=citrix.com=prvs=412e064f8=Andrew.Cooper3@srs-se1.protection.inumbo.net>)
 id 1pVZZQ-0004vZ-LW
 for xen-devel@lists.xenproject.org; Fri, 24 Feb 2023 15:01:12 +0000
Received: from esa5.hc3370-68.iphmx.com (esa5.hc3370-68.iphmx.com
 [216.71.155.168]) by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 10aae71f-b454-11ed-a82a-c9ca1d2f71af;
 Fri, 24 Feb 2023 16:01:08 +0100 (CET)
Received: from mail-mw2nam10lp2105.outbound.protection.outlook.com (HELO
 NAM10-MW2-obe.outbound.protection.outlook.com) ([104.47.55.105])
 by ob1.hc3370-68.iphmx.com with ESMTP/TLS/ECDHE-RSA-AES128-GCM-SHA256;
 24 Feb 2023 10:01:03 -0500
Received: from BYAPR03MB3623.namprd03.prod.outlook.com (2603:10b6:a02:aa::12)
 by SA2PR03MB5913.namprd03.prod.outlook.com (2603:10b6:806:11d::23)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6134.24; Fri, 24 Feb
 2023 15:01:01 +0000
Received: from BYAPR03MB3623.namprd03.prod.outlook.com
 ([fe80::8299:f95f:934b:29e8]) by BYAPR03MB3623.namprd03.prod.outlook.com
 ([fe80::8299:f95f:934b:29e8%7]) with mapi id 15.20.6134.021; Fri, 24 Feb 2023
 15:01:01 +0000
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
X-Inumbo-ID: 10aae71f-b454-11ed-a82a-c9ca1d2f71af
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=citrix.com; s=securemail; t=1677250868;
  h=message-id:date:subject:to:cc:references:from:
   in-reply-to:content-transfer-encoding:mime-version;
  bh=yk/I0+ff3zQkqleLmM7GlYQED0Okn7cLE63Dp6HPuAE=;
  b=QlGQkV+ECZTQWE5CDoi7cMS1xxunkxsEX7TCX2Z+2zCBf7K9Wfk+S/qx
   enLqlDYF0DRzLUNVlvQYxAAV2mr175DCNzs7t97l/zC0UGiyHhUQFFn3s
   RrWeZFr10Ka8wFfIo7hkSwlfl5hFe6r3/Rw+OsMoHygcjKysIUD0U5Wow
   o=;
X-IronPort-RemoteIP: 104.47.55.105
X-IronPort-MID: 97250547
X-IronPort-Reputation: None
X-IronPort-Listener: OutboundMail
X-IronPort-SenderGroup: RELAY_O365
X-IronPort-MailFlowPolicy: $RELAYED
IronPort-Data: A9a23:RwPNwaOP3RxUnw3vrR2clsFynXyQoLVcMsEvi/4bfWQNrUoggmMCx
 mYXWz3Xb66OYWLweop3OdmwpBtS6JOEz4dkHAto+SlhQUwRpJueD7x1DKtS0wC6dZSfER09v
 63yTvGacajYm1eF/k/F3oDJ9CU6jufQAOKnUoYoAwgpLSd8UiAtlBl/rOAwh49skLCRDhiE/
 Nj/uKUzAnf8s9JPGj9Suv3rRC9H5qyo42tC5ABmPpingXeF/5UrJMNHTU2OByOQrrl8RoaSW
 +vFxbelyWLVlz9F5gSNy+uTnuUiG9Y+DCDW4pZkc/HKbitq/0Te5p0TJvsEAXq7vh3S9zxHJ
 HehgrTrIeshFvWkdO3wyHC0GQkmVUFN0OevzXRSLaV/ZqAJGpfh66wGMa04AWEX0vYrEEpE6
 eA3ER8EMDean7iowZHjY+Y506zPLOGzVG8ekldJ6GiBSNMZG9XESaiM4sJE1jAtgMwIBezZe
 8cSdTtoalLHfgFLPVAUTpk5mY9EhFGmK2Ee9A3T+PdxujCOpOBy+OGF3N79U9qGX8hK2G2fo
 XrL5T/RCRAGLt2PjzGC9xpAg8eewnmmAN9OS9VU8NZHsASTmXwcJiFNC3CKs6KLpUCaV+N2f
 hl8Fi0G6PJaGFaQZsnwWVi0rWCJujYYWsFMCKsq5QeV0K3W7g2FQG8eQVZpZdA5tclwWTsw0
 VyhlNfuGDApu7qQIVqC8p+EoDX0PjIaRUcAajUDVhAt+MT4rcc4iRenczp4OKu8j9mwHC6qx
 TmP9XA6n+9K1ZNN0Lin91fahT7qvoLOUgM++gTQWCSi8x99Y4mmIYev7DA38Mp9EWpQdXHZ1
 FBspiRUxLlm4U2l/MBVfNgwIQ==
IronPort-HdrOrdr: A9a23:BgCm4a+1bNx4g7dJxfZuk+HFdr1zdoMgy1knxilNoENuH/Bwxv
 rFoB1E73TJYVYqN03IV+rwXpVoMkmskaKdhrNhQItKPTOWwldASbsP0WKM+UyCJ8STzJ8k6U
 4kSdkENDSSNykFsS+Z2mmF+r8bqbHokZxAx92utkuFJTsaFJ2IhD0JbzpzfHcGIzWuSaBJdq
 Z1saF81kadkDksH4yG7j5vZZmwm/T70LbdJTIWDR8u7weDyRuu9b7BChCdmjsOTj9Vxr8m0G
 7d1yj0/L+qvf2XwgLVkza71eUbpPLRjv94QOCcgMkcLTvhzi6ueYRaQrWH+Bwlve21714usd
 /U5zMtJd565X/9dny85THtxw7j+jAz7GKK8y7UvVLT5ejCAB4qActIgoxUNjPf9kobpdl5lI
 ZGxXiQuZZ7BQ7J2H2V3amDazha0m6P5VYym+8aiHJSFaMYdb9qtIQauGdYCo0JEi7W4J0uVM
 NuEMbfzvBLdk7yVQGTgkBfhPiXGlgjFBaPRUYP/uSTzjhthXh8i3AVwcQO901wg64Vet1h3a
 DpI65onLZBQos9dqRmHtoMRsOxFyjkXQ/MGHj6GyWmKIg3f1b277Ln6rQ84++nPLYSyoEppZ
 jHWFRE8UYvZkPVD9GU1pEjyGGNfIyEZ0Wu9ihi3ek9hlWlL4CbdRFrCWpe3fdIms9vQfEyAJ
 2ISdVr6/yKFxqbJW8G5Xy5Z3BoEwhsbCQkgKdLZ7uwmLO6FmTLjJ2sTB+BHsulLR8UHkXCP1
 AkYB/fYO1902HDYA6MvPGWYQKjRnDC
X-IronPort-AV: E=Sophos;i="5.97,325,1669093200"; 
   d="scan'208";a="97250547"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=bv/aHSRXCY3M1NRE1GVW5bUzLNV6H8TAtVN2y+NKhEQ+PAbHnMANaCvgySo5yEW7SUOuMRu0VrX/yQupSi0zTk7vlFPsDehobkgElq9FwvdJjOPrBBpFFjG2Kjg6y67eXdHZhhEVyXFwf8JV1YjaOkj0GDRMhLK5clmpdBLY2VJH1lp/nyEjKUAiXBAjIHu/yMcElHjGDY7Ad1kVpdWxXM6F/zj5npbldLgqaemnrxfnYiNXIgpNAgJrK8pUp9LAzycE7WhuY47SQ/aXfm1TUWHlPHyzzWi+jxIrJE0wZKX78TOWQTKnH0L69ERKcfQh2PePqxnER+gcnz03whg5Xw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=FMszfW/goHMfjxmUPzM9M3YXrjXP3E0cFLVZ4cZIyMQ=;
 b=n1di9EUwGsX9/JIPt9fZOEel3fmTU89b7BGKTS4Dg+YSMIHq2KAiOrQfClkb56vNkDeiiJYhAf0W2mFEV4bD5HqhAO6eEQAyOrHlpDAnwjrP50BJksTIHqbG8Gl/G23eiLUWCIw8p/00Bps8lJ4Ve7jFxc68VyrL8peBmoQJ8kGElFxx/jkE2sa/B0FH3xYI/wyyXI+3qgV+CsDe+AZ9AftleNZDIkvLu0HpXacuFs3Q+jmc9ST8Drnw18Q7FUgsqC/xiZFPT9cUFDXO3ljGgam7G/omgLrO+ANaeJqzaZpURL09raTtPi7TdXq6HdY/10eJ+onqALaLkcfr+Xl0zg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=citrix.com; dmarc=pass action=none header.from=citrix.com;
 dkim=pass header.d=citrix.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=citrix.onmicrosoft.com; s=selector2-citrix-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=FMszfW/goHMfjxmUPzM9M3YXrjXP3E0cFLVZ4cZIyMQ=;
 b=YfmdiXrr2kEy2wZL6lAeFBO/TU5AoF8VDEM1JJz5GIuDYW6ttRyk0kWZr+hzQDo1GLseVmo7nnSJa6mVpLi0uj6oRoo6rJTf/Yu+TC54X0rACTl1de/bIAc1iCyGosXHI4GdBoLt6hl/u78Vf5o8jP+MMTuht3geAZNR10FUTsY=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=citrix.com;
Message-ID: <7dbd6e34-ec28-5ba9-24ff-cc9e0b7e790b@citrix.com>
Date: Fri, 24 Feb 2023 15:00:55 +0000
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.7.1
Subject: Re: [PATCH v1 2/2] backup_ptes: fix leak on realloc failure
Content-Language: en-GB
To: =?UTF-8?B?RWR3aW4gVMO2csO2aw==?= <edvin.torok@citrix.com>,
 xen-devel@lists.xenproject.org
Cc: =?UTF-8?B?RWR3aW4gVMO2csO2aw==?= <edwin.torok@cloud.com>,
 Wei Liu <wl@xen.org>, Anthony PERARD <anthony.perard@citrix.com>,
 Juergen Gross <jgross@suse.com>
References: <cover.1677245356.git.edwin.torok@cloud.com>
 <2f23492a3861a3ebddbf1f811296e98143b9b8f4.1677245356.git.edwin.torok@cloud.com>
From: Andrew Cooper <andrew.cooper3@citrix.com>
In-Reply-To: <2f23492a3861a3ebddbf1f811296e98143b9b8f4.1677245356.git.edwin.torok@cloud.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: LO2P265CA0209.GBRP265.PROD.OUTLOOK.COM
 (2603:10a6:600:9e::29) To BYAPR03MB3623.namprd03.prod.outlook.com
 (2603:10b6:a02:aa::12)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: BYAPR03MB3623:EE_|SA2PR03MB5913:EE_
X-MS-Office365-Filtering-Correlation-Id: 7fc356ce-30ca-4f63-16f6-08db1677f18e
X-LD-Processed: 335836de-42ef-43a2-b145-348c2ee9ca5b,ExtAddr,ExtFwd
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	nv6hDOpXNpZrNfV5c3vUsX2AGEvPnZu7ZNwgZD9jteBrlHV2XjQzv74hHy72Puz7KHeAbekya2Q3W/5aWnwC73AZh+EA7dK3rnIRz8Plz3wyY01xD9Jg3grnw90N9PyeWTI5VKjayLnWQXZ754h6AUvbvyI98ez4n4LbX9D3MZfI2rUI5TPtomBezsBO2Bfs49ISqtzlgc2YpRXgLOFeRKhpn6Pk1sdorYRJydrzfJs2EdoKf3oh5aNRDXfj+cKol+49XffD5qt3KI6m5gZNHB/bPNQ/4MxVcc8JPZFOtt5vyst723/8tJLtexFBO/F23mk9yjWmP3Dvk6Jh64MMt/V64DiqWAP4Nts58pe87MXYul7GDlO67BT+dNykaNj+KKG6pERDLmzGmX8S8oB7r22FDl7xUIphU+glNm0Rs08vgQEfvAGTOlTE2/CtWRKVkGbv6YUZ7BeuUDbbFblFn0tZQcAXTQD5ux3AQC+GamalbhabIu/QKBPXhgelTXtn61XXqrtKw74+hJGNzlyN2HTl1kh4GnDAeYp5kxPMByekUp2ya1ThwvHiYJtRkxo20Xvh9+2TrOB133JFBJ6M8X/EL3y116nJkl2859k8FGyHF5qEW9tl/t6Bj+mwhy4XzJYJAMv4ZcLrA4RzBmb0eiUHbyZ0pjpVbNpK5Dvp1deA6vJgOgVvwBfaKspzso29/1lESnbmK1622slmsXb9LdpN2dhvCXTZpu5fxnbguTY=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:BYAPR03MB3623.namprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230025)(4636009)(39860400002)(136003)(366004)(376002)(396003)(346002)(451199018)(83380400001)(36756003)(31696002)(66946007)(66476007)(4326008)(66556008)(8676002)(5660300002)(6666004)(8936002)(6506007)(53546011)(41300700001)(6486002)(82960400001)(54906003)(316002)(31686004)(478600001)(38100700002)(86362001)(2616005)(186003)(26005)(6512007)(2906002)(45980500001)(43740500002);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?bEZIRFBZMml0clEySURqQlIyRDcvNWtmblYxaXVQRU1YYjRsZkJPdU5lWXZE?=
 =?utf-8?B?c3Exa21LaUphd0Mxd1ZxOUw2SVlVY29tSS9tUVJQZllwN1FTK1lRSUZiY3ho?=
 =?utf-8?B?Y0FVNnQ1TXozQ1QzVWd5bDkwQTJlMVlTMkFsNTZWSmFmZVJvLzFPSzVJMHll?=
 =?utf-8?B?WitBL0xiTUNDSTZpMUNvYVBVbHVaMVpQUjgvV2p4NDZtelN4NWttVko3ZU9t?=
 =?utf-8?B?QkxJRVU2RUthMFdQazlvU3N2UHJCN0dKc0dZWFA0ZndTRzdVWFZJS3FxT25W?=
 =?utf-8?B?QlJINFRLVkpYVlBjdjFXdUo2NzVPaTlBS0lxL0svcS9zNUl6WnBldjRVWXVX?=
 =?utf-8?B?WnVVZWsvWFBXb3JqYk9rY25kRnlGTnlOajY2VUVtblg5dE8vN0wvK1pXNWV4?=
 =?utf-8?B?VmlUMWsxSmNVQnZNOWlCSUIzcU5PSzNSUTY4SkExVUpVZmw5ME1MM2pOSXMv?=
 =?utf-8?B?a3lXUlh2Ujd2ZUVpSFFpdWxuVEVrOG5uandhUU5CL0NsUTNVMURyWmpqN3Nh?=
 =?utf-8?B?TGtmUmJnUUNvK2pNclR2bjF0OXl1V3ZEVmVraG5Bbmw2V1R4ZGFtSlBXTkpI?=
 =?utf-8?B?OThqRDZzYWpDQlFhbmRJTmNYNjAvZHhRNitFMGxCeFFhS0hlYVpPZzhQM2kr?=
 =?utf-8?B?UFU1UUp5T2ZtM1BFeEwrL2lNR1JZZ2Q0S2V0T1FMdlphMCtHaTluUmJMajhB?=
 =?utf-8?B?R1E0Umg2T3IrTGh5RGNuU1FQclNvUXU1QkpXeUFkeUN0U3dYVlRrNUlEQTJP?=
 =?utf-8?B?cmxIR3g5cW43OXZmcDJ2UnlOQnpiSldyQ0VPaWF4NWZDbnFuM0NENXhPQzF2?=
 =?utf-8?B?SmRnVVJKbEExVndQaU9pM2gxbWU4VXpJaGk3eWZxdm5NV1BNMzhHdkwvOWFj?=
 =?utf-8?B?NVBrcUtEM0IwY0tjcW51VllqL2pOZ0JHVzI1SWk3b0RDTGVSdURlZGd1R01x?=
 =?utf-8?B?TGl0VWJjVHVNRnRpWHo0Qm1ZK21qT1luRFRpY1JJRExvK0Z2enh4aG95RE83?=
 =?utf-8?B?WGl1bUJ1elAyK3M1L09kVjNZQitSLzZvM3A2RGczRThmYzJ4MWxpd2xRMURr?=
 =?utf-8?B?ZEYxQ1d2ejdMeE9iNlhFWlNOdE1SNmwyYWd2N2ROMHJXOER3R2dyOGk4cHFV?=
 =?utf-8?B?QUtkanRGaStabVhhbHQwY1B6L2lpU0NuU3IxNzVzcG51WVVIbm15NVRUa1JJ?=
 =?utf-8?B?MWxEamxvb25RZFk2VTl3c1VJT2ZjOFU4WGhSZmVHT0FMSy93VWFyVnZ4S2U2?=
 =?utf-8?B?SWNRKzdnSnlRU0hvamxtaUhFeGJYVG1IcVBpT2RSRU9KRi81TTR4VmdLSWx6?=
 =?utf-8?B?azlxQ1lWcUUyMVZjQTVXTXZQZGNGb2tJL0RKWmZmV0RPZkZvZUxaY0NjUGt5?=
 =?utf-8?B?M1NyeW5zUjUvaEY0VTZkRjVHWXNXUGNVRFh5VXRFcVROZEYya1lvSlU4aUQw?=
 =?utf-8?B?SDN6cnAzYTFBSWZzeFhFQTRObE5ZWHRqWlczZUlub3FlTHZCUlAxUzlHb29J?=
 =?utf-8?B?WktONGxFc1NaUVBnMzMzZjNuNVJIUUFGUjYvckJqNjRBTzBpUmpLQk5uY29x?=
 =?utf-8?B?MENIOUVxTCtzN2JXc2Y1VndHT3lBRU9Vckg4UENXRlk2NUJuODNQcjZrdEJh?=
 =?utf-8?B?RnBwK05IaGx1SFNnSWJSdFFmNVdqc0ltbFpYWjZpOWdWM2d6c25vZnJQYzhN?=
 =?utf-8?B?LzFMZDBMQ0YyS2lKbEVNQUl1TjA1Z3VjOFBhT3dvSC9UM2FxdGpzeHpSRTRj?=
 =?utf-8?B?OTRZcE5VZURMakY0dHBoQ2ZmNmMxZlVYYmFHL2J0c3AyY1N0SktkQmFnQmx1?=
 =?utf-8?B?VmFwT25wcnBTQi91ZmRzYTZETEhlRkN0TGxkNUo4Y244RGZIcUJQSzhKNytJ?=
 =?utf-8?B?TkpUL1RyalpvNGY4eGhwckFJLzRpSXFhb3dZczhwS0dzTkg4MTFjbGp2V2h3?=
 =?utf-8?B?V0RwUlVxaUJPakpaR3BDb3R3V2JEbVovNGZpUnZsV3NvOWZUWnB3S0FWSUFs?=
 =?utf-8?B?aC9ZZWpPR3ZqTExpaTFDc2lTRy9LQzZuN0p0VU9MVTYzOHk1WDNITzNxajNE?=
 =?utf-8?B?YTJKWEE4SndXdUVkVWJoalkzZlpkNytnSjV0WWF1UGpOMjV5OWZVMG9HbExt?=
 =?utf-8?B?U2ZYa0lIODdjMGRBZmxqWFYvb2F4VWVCbEE0MUJZODhoS014TEVMZ2VmV3FM?=
 =?utf-8?B?WkE9PQ==?=
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-0:
	Gsw+fa4kFiV+uUED5kWIm34UP9PBjgRGNSdKAe8TiSoI2eiXI6i4DZs9DBU8kupkdk+mWen3igrroMucuG18iuKcqw2BKYB/fAH/aGypH5lN1n7iF8iXaxxEUYpzRiXTJ6qiOmxOVkfEy5p+J2JCSShgihU8zHhg68b/VYszjpQnTrpFJxw8g96Hj21H5C6POz2ly+50Y6uLj2PtGAahymVm1yXfnoF1Kw2q0sSYjsy/LcS/sr+MNE5lEEqoinsAYSxsMfgRrTwgE3wNV7Kq08qWcg9q0QtjKb1p6vUSzgFZEwcKzZyNH8vPSoVpSHvMigmkRnxvFsmsK35ZEZWD4pE6TYjAN+hOYJUdyFyIjLabh4qRuyepqXdZMVMUIL4xLfw6bm+VHvA44kdLSDLo49rqGy80vSUCLTBfwZvMGYM4QA9gUx0m1G/B1BnOyfY+HlJFz4cJy9ziOlpq9PAC6hmA6kj+FHi2TT6jHwCnFV478//M8jdWjEmFAMhNUVCq6Yr9756yHXJgwHXtby0rGtcs7ZW1laQTSSE9KlwscJ7mG2zgPe1/5NtNZAct2rtmlLhXaCopEjc55KyJvYSJzJ9JAdVBVRxqkBsZbzKBj+YpSIia30logdk/eonBVi+HbQYUXePIf+LiqDaYbdHqK8f/RJE+h31aA9ppGbPwtqvbnu2DqV38AmvZPTZIz3kRpthKQxbkup3hOcZu58m4apZC/4gIRM9+z7DEV+Axojn9OU6OL9qVpxd/8t1o/abcoLJ3iNT9NhoUazzdxgzDcxEUKI9/WJV/6XfmGuEeRLwFyrWa7DkpneKqggFUkEDdhAdvp/sCZtxLq8rUqUd4IZrwr+I5LUbehL3gff+mcQY=
X-OriginatorOrg: citrix.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 7fc356ce-30ca-4f63-16f6-08db1677f18e
X-MS-Exchange-CrossTenant-AuthSource: BYAPR03MB3623.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 24 Feb 2023 15:01:01.5722
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 335836de-42ef-43a2-b145-348c2ee9ca5b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: SOa+09IRHOatTe3wZpMlZlgXKEoP0UPBoZ1wEjtSLWkHGVsP9i8Zb+Ub0HdqHPY30GGIp+Dn7k6USug8gdRV1Uyztp4Sx0Xdpx21Io4NX6s=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SA2PR03MB5913

On 24/02/2023 1:36 pm, Edwin Török wrote:
> From: Edwin Török <edwin.torok@cloud.com>
>
> From `man 2 realloc`:
> `If realloc() fails, the original block is left untouched; it is not freed or moved.`
>
> Found using GCC -fanalyzer:
> ```
> |  184 |         backup->entries = realloc(backup->entries,
> |      |         ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
> |      |         |               | |
> |      |         |               | (91) when ‘realloc’ fails
> |      |         |               (92) ‘old_ptes.entries’ leaks here; was allocated at (44)
> |      |         (90) ...to here
> ```
>
> Signed-off-by: Edwin Török <edwin.torok@cloud.com>

In terms of the fix, Acked-by: Andrew Cooper
<andrew.cooper3@citrix.com>, but

> ---
>  tools/libs/guest/xg_offline_page.c | 7 +++++--
>  1 file changed, 5 insertions(+), 2 deletions(-)
>
> diff --git a/tools/libs/guest/xg_offline_page.c b/tools/libs/guest/xg_offline_page.c
> index c594fdba41..a8bcea768b 100644
> --- a/tools/libs/guest/xg_offline_page.c
> +++ b/tools/libs/guest/xg_offline_page.c
> @@ -181,10 +181,13 @@ static int backup_ptes(xen_pfn_t table_mfn, int offset,
>  
>      if (backup->max == backup->cur)
>      {
> -        backup->entries = realloc(backup->entries,
> +        void* orig = backup->entries;

void *orig, and a newline.

> +        backup->entries = realloc(orig,
>                              backup->max * 2 * sizeof(struct pte_backup_entry));
> -        if (backup->entries == NULL)
> +        if (backup->entries == NULL) {

Newline.

Can be fixed on commit.

~Andrew

> +            free(orig);
>              return -1;
> +        }
>          else
>              backup->max *= 2;
>      }



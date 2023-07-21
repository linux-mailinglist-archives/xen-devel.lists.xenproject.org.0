Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id DBE2E75C806
	for <lists+xen-devel@lfdr.de>; Fri, 21 Jul 2023 15:41:06 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.567555.886771 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qMqNG-0003Qm-AG; Fri, 21 Jul 2023 13:40:50 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 567555.886771; Fri, 21 Jul 2023 13:40:50 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qMqNG-0003Np-6U; Fri, 21 Jul 2023 13:40:50 +0000
Received: by outflank-mailman (input) for mailman id 567555;
 Fri, 21 Jul 2023 13:40:48 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=dNy0=DH=citrix.com=prvs=559993d03=roger.pau@srs-se1.protection.inumbo.net>)
 id 1qMqNE-0003Ng-Gc
 for xen-devel@lists.xenproject.org; Fri, 21 Jul 2023 13:40:48 +0000
Received: from esa2.hc3370-68.iphmx.com (esa2.hc3370-68.iphmx.com
 [216.71.145.153]) by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 31e03b40-27cc-11ee-b23a-6b7b168915f2;
 Fri, 21 Jul 2023 15:40:47 +0200 (CEST)
Received: from mail-mw2nam12lp2049.outbound.protection.outlook.com (HELO
 NAM12-MW2-obe.outbound.protection.outlook.com) ([104.47.66.49])
 by ob1.hc3370-68.iphmx.com with ESMTP/TLS/ECDHE-RSA-AES128-GCM-SHA256;
 21 Jul 2023 09:40:44 -0400
Received: from SJ0PR03MB6423.namprd03.prod.outlook.com (2603:10b6:a03:38d::21)
 by DM4PR03MB5968.namprd03.prod.outlook.com (2603:10b6:5:38b::10) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6609.28; Fri, 21 Jul
 2023 13:40:38 +0000
Received: from SJ0PR03MB6423.namprd03.prod.outlook.com
 ([fe80::38aa:4814:3c7b:78ea]) by SJ0PR03MB6423.namprd03.prod.outlook.com
 ([fe80::38aa:4814:3c7b:78ea%5]) with mapi id 15.20.6588.031; Fri, 21 Jul 2023
 13:40:38 +0000
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
X-Inumbo-ID: 31e03b40-27cc-11ee-b23a-6b7b168915f2
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=citrix.com; s=securemail; t=1689946847;
  h=date:from:to:cc:subject:message-id:references:
   content-transfer-encoding:in-reply-to:mime-version;
  bh=3yh8hYuwQ8o1a0owTvMPwwglVH12b3x0vYMNscXzw7Q=;
  b=fQpklQzOruBitEzt/jvm5fmmmkuV56wHp81jk3MX81fwON9eDp5Ze5LL
   ei7/mR8nejMZw2G1e2vPhVBqM7m4UQmppjntKCBRpNDOjpm05diVyOnK4
   n6NJX6O0kBgU1hRxZWEdP9kTLFyseOrvUwa6M/tsi/bb9HK7XT6F8YOoU
   s=;
X-IronPort-RemoteIP: 104.47.66.49
X-IronPort-MID: 116878719
X-IronPort-Reputation: None
X-IronPort-Listener: OutboundMail
X-IronPort-SenderGroup: RELAY_O365
X-IronPort-MailFlowPolicy: $RELAYED
IronPort-Data: A9a23:AkySYqjSpAH9Wci8+T9e09OzX161pBEKZh0ujC45NGQN5FlHY01je
 htvWjiDP/vcajD3eo1ybIyxoE0GusXUm9Q2G1c9/ns9FC4b9cadCdqndUqhZCn6wu8v7q5Ex
 55HNoSfdpBcolv0/ErF3m3J9CEkvU2wbuOgTrWCYmYpHlUMpB4J0XpLg/Q+jpNjne+3CgaMv
 cKai8DEMRqu1iUc3lg8sspvkzsx+qyr0N8klgZmP6sT4wWHzyB94K83fsldEVOpGuG4IcbiL
 wrz5OnR1n/U+R4rFuSknt7TGqHdauePVeQmoiM+t5mK2nCulARrukoIHKN0hXNsoyeIh7hMJ
 OBl7vRcf+uL0prkw4zxWzEAe8130DYvFLXveRBTuuTLp6HKnueFL1yDwyjaMKVBktubD12i+
 tQaKzQDTS2Hgt6O+62FE/Bin+99E8nkadZ3VnFIlVk1DN4AaLWaGeDv2oUd2z09wMdTAfzZe
 swVLyJ1awjNaAFOPVFRD48imOCvhT/0dDgwRFC9/PJrpTSMilIvluS8WDbWUoXiqcF9hEGXq
 3iA523kKhobKMae2XyO9XfEaurnxHqlCN1CS+TpnhJsqEyQwzFNCzEubHuqhPbmjnHhfdh/C
 mVBr0LCqoB3riRHVOLVYRq8p3KVuw8GbPBZGeY69QKlx7Ld5kCSAW1sZi5MbpkqudE7QRQu1
 0SVhJX5CDp3qrqXRHmBsLCOoluaHiwYLnQLYyMeeiID78P+u4E4jh/JTdFLHba8i5v+HjSY/
 tyRhC03hrFWiNFR0ay+pArDm2j0+smPSRMp7ALKWG7j9hl+eIOue42v7x7c8OpEK4GaCFKGu
 RDohvSj0QzHNrnV/ATlfQnHNOjBCyqtWNEEvWNSIg==
IronPort-HdrOrdr: A9a23:I2YF1a9sV6mXhAUOMltuk+AcI+orL9Y04lQ7vn2ZKSY5TiX4rb
 HKoB1/73XJYVkqN03I9ervBEDiewK/yXcW2+ks1N6ZNWGLhILBFupfBODZsl7d8kPFl9K01c
 1bAtJD4N+bNykGsS4tijPIb+rJw7O8gd+Vbf+19QYIcenzAZsQlzuQDGygYypLbTgDP7UVPr
 yG6PFKojKxEE5nFfhSVhE+Lo7+T8SgruOeXSI7
X-Talos-CUID: 9a23:6bqjIG0T6KWYUWl1AH8gMrxfGMMhfF7gyHLsG3SnNz9wRqS+F2CQ9/Yx
X-Talos-MUID: 9a23:JJoLmgTGJZnfwEjcRXT9hzQ/asRE252OGWUCzpE55O+OFQ1ZbmI=
X-IronPort-AV: E=Sophos;i="6.01,220,1684814400"; 
   d="scan'208";a="116878719"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=g/lmunof5c6llPo9CTQQQbm84SxSBGuNqWJPnmyRtC2DKqgI0zcEOKHeSiYO0ybFcBnP+mT6y6rHYNBztr4gYlIq4bExWzdLycqz1hqNmkSzAyaI/bFbUcdxcjXLCuKsScckE290ReCNot1TCiM+aaR8uD3AG0Uqsy2SIPE6wNc8Oe5sOErldKhpYgbPycpreVRsOR1/WhXZ9WUujkovFM91uzFTGfvaLLqJzrna61ji4alDQjldlu5ECBF6wD3AMswIDTRDk9yJpD4RpzhNQaFSJiFM12E7rkMI7K6gqiKGpBtHw50KrsGS8JmAJyTL89E78kwGhROqR/Q7a7eoPA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=06usSbsssSaieiqulC9C6s+2i5pIJ9QUgxJTZwMYGv4=;
 b=iZWA7GUasRlpIoz8/7DEQqjU/p9frPtDCaDURQNpywopRmqTFfvIv07/x0KmygdWdRoCM6Tfgsn7/qJIlRB2b6DSPy3hGGOrHe7Q0W2I+/764xnCtDV9GIC2ZxvYAckkaOBkuokuVB40HsoruTPU6WN2EvIcZqQyCQrSP3WH6jWc3kbsDXXRTBwZeIxXwNbjNP90MfCO4HftIAeNNn1E17Hg40txjg2Ptn7SkX4AP3GAdYtX5KAxzAQQZ/C9gHG4G0HdIE6toqVDSzfY2b9XFEs76gf5NM1+cjqEGBL60Hx8HHPeg2aQ/NEopmJsF4+xucsu4tMRoorKt/kVLh4AOg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=citrix.com; dmarc=pass action=none header.from=citrix.com;
 dkim=pass header.d=citrix.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=citrix.onmicrosoft.com; s=selector2-citrix-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=06usSbsssSaieiqulC9C6s+2i5pIJ9QUgxJTZwMYGv4=;
 b=wf0lmLERQIYVGqMl7s4PcSYi/HAQDSDSi6Kcjh4tvqKFhr1HMi0lgW2NtKh9+0E1iLhlrp0XEfN51k/zw2zuV7PL2jpwfsa566FUwkpz22DqGvl8Dwc87+NlpL1JBZ/S4Kz44tpfH+Hd5EdnUv/sXmkucptYl11KK2ETctUipfQ=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=citrix.com;
Date: Fri, 21 Jul 2023 15:40:32 +0200
From: Roger Pau =?utf-8?B?TW9ubsOp?= <roger.pau@citrix.com>
To: Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>
Cc: "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>,
	Oleksandr Andrushchenko <Oleksandr_Andrushchenko@epam.com>
Subject: Re: [PATCH v8 09/13] vpci/header: emulate PCI_COMMAND register for
 guests
Message-ID: <ZLqK0MBwh66qkpJ8@MacBook-Air-de-Roger.local>
References: <20230720003205.1828537-1-volodymyr_babchuk@epam.com>
 <20230720003205.1828537-10-volodymyr_babchuk@epam.com>
 <ZLqI65gmNj1XDBm4@MacBook-Air-de-Roger.local>
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <ZLqI65gmNj1XDBm4@MacBook-Air-de-Roger.local>
X-ClientProxiedBy: LO2P265CA0494.GBRP265.PROD.OUTLOOK.COM
 (2603:10a6:600:13a::19) To SJ0PR03MB6423.namprd03.prod.outlook.com
 (2603:10b6:a03:38d::21)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: SJ0PR03MB6423:EE_|DM4PR03MB5968:EE_
X-MS-Office365-Filtering-Correlation-Id: 16b63c1f-288b-4065-70bb-08db89f01135
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	sTGI46mjLkr5hyiS+uSMl8x6bqVoIPLJJUouiTEbEMvgZjQyj6XP+CmB4EtaTd8AzE94b0lEc7VJE1G69G3p/bwjgImlM3H/kYx39uMPGYk6HG8FETDELApS55yXCjW2aQ39gTQ/n024RjrhODVIzBxNZQzOYGutvEI48hcxfm6tR7aOAouG+9wvM2vTi0t9mzoGzhL2Sb+a0TJygvJjdjJpWOyuOptcTvy6OKqZZhf3DVVuz9ozo60sJYx1SvUWvPZ88dcQIWh8L3s9WM8J6dKw1WA0UvDoHwFBUkbLQcUcaeK93R0NszjdHQF55p4xb83SwY3h86U0GR+m/KSfK8g+TQNsTlVqgFIiqazmtWJqwo54ETpWN/n+O/xmv5WLafCzXrFeYQAtsIRd7/y4SfOd1M56osUMSjl50MDcxvhwIm08iAXJuQ0/6UYj1Z0gR6dDNfCRhWFVQ1Jzz6XCZFOB6ydmy1/RtsjSiKoDKgAaj4k/0sh3kJ1XxcjAwS8skJpCr+RYoiZj+E/vrRpWslIAWuRWsGIsiawyb7WCYyst1Fia/vjI9bFmsgl457Gq
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:SJ0PR03MB6423.namprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230028)(4636009)(136003)(346002)(39860400002)(376002)(396003)(366004)(451199021)(6486002)(6512007)(6666004)(9686003)(82960400001)(6506007)(38100700002)(186003)(26005)(54906003)(316002)(478600001)(66946007)(6916009)(4326008)(86362001)(85182001)(4744005)(2906002)(66476007)(66556008)(8676002)(8936002)(41300700001)(5660300002);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?Z2dxTEdLTkdHbkJheFpzRCsvU2ZGb05ZLzNqcnR2bklGdExTc2w2NDhTbFVI?=
 =?utf-8?B?TyttdE9BMHpCU2pZK0FPblMrRExaazNJRVBLQ2VvcEcvQS9LRys5NXZERkE5?=
 =?utf-8?B?SE1FYjhjdHliM0pxbGw3amYzdUQ1L0RrNEJHdDIrd1krVEVRU0VSQlFlZWdD?=
 =?utf-8?B?NjhJdUJWalN3YUVBOWIwRTJyVXFPRHhWRXV1R21JQ0Uzc3RJbWYwOStrUmN1?=
 =?utf-8?B?ZUl3MndGc1o4bEUzaVQ3RUxmY2h0NTQ5ZzZoakkwU0NMYUM4dUQxcXBZSjh3?=
 =?utf-8?B?QkhwMEJSeER6aXNXSmJEbVRodENVUmhBclN0TFZaYnFNMVpsNXZQckFScXht?=
 =?utf-8?B?cHpjZTB2cmlaNmg3NFcwT0hRNFRWSzdFZzk4UzFuYisrd0l5ai9YZGRIdVRy?=
 =?utf-8?B?Tmx0ZWM2Sy9iRHlDQlJmYytEa1ppbWg5ZzA0aG1DY0xPb2U4T3JRSGlBTFB3?=
 =?utf-8?B?dEY5cGR6TjZCUysyendrcFBXVkh4Y3lLSGUzcXIyNjhtVGNlSmFXOHR6b0dh?=
 =?utf-8?B?M25qenRJbWxsU09rRDNVOHJsNTVVZ3pKWFJnRGJjS0w1bDFoZ0gxTTBVeXpN?=
 =?utf-8?B?RzBsbC94R0pJbUJXc2pXNXFiRWNCS1QwVXd5MzdjK25VZHExeXFoeFg3L3c0?=
 =?utf-8?B?VWlrUWN6NjNVazUvM3NsWUdGK3RUWGNnSUpHVFRhNTdZclFiSE5jUzk5TTF0?=
 =?utf-8?B?U1RZWVYvbThFWThnUTkwQW8xdmI5d29PaVhjK0xkMkc0Q002ejNwVDdXemRs?=
 =?utf-8?B?dnROek1zTWxnZDZTb2NUQXpYbU8wWStodnpjRjNBd0diNW1YNjNiNzQ1NnV2?=
 =?utf-8?B?d0Z5VUFMQUxLVkU0Q0lXazJ1YTU4TEp1enhKNFp0RXd2OFVkcWNTYmRRYUlm?=
 =?utf-8?B?SDViZFFzL1lOaldIU3V6clAxRGlka3l5a0hrczl5bHU4SEhnNFdtVHdpVTFz?=
 =?utf-8?B?N29UZDFYUDY1Ny9ZVUVwTVAxU1ZaZ041azB0QjNFWDdmMlpRMlhzTWJKMnpW?=
 =?utf-8?B?N1FobUhLQ25GVWt1c1o5WC9CM0tsbzJFRnd6dnRuc2w5TDFMditXazlvSCt3?=
 =?utf-8?B?YjFOcU1tWnovL1VQeXg3YjBvdnpJZnhneXJnTVI0OUo3K1ArMkFMRFJJU25z?=
 =?utf-8?B?azNLY3c2a0tWT3JwU2hwd1V3Q1QvT3JObC9FQjlsQTZlZERxaXovTExFVWJM?=
 =?utf-8?B?YS9hYzR5Rk1DSjZZQUJYdlZSWnBzL0JWSkFZZHNESW1HbngrMWNGc0phbDBt?=
 =?utf-8?B?aVJiY3NLVFAvditrcjhKeUxmL0VyOFp1UFlWckt5WVV4c3NRYUJuZlJkb1g3?=
 =?utf-8?B?WDBWUWovZzFWdERML3VVWFZPeUs3VXNSMTlHMDRnWDlDWHhmdDRjaEdmaVVS?=
 =?utf-8?B?ZlB0UG43UEFwMTh6emtIaG1USSt3WkdNOE50S0g4S1FCbkFJeGI2VytRcTJD?=
 =?utf-8?B?U0JQQzFzVDF6T3ZsbVd1VHhJN25BcWdpNUcxTWxTZ044eVFzSkdKeXBFMDRW?=
 =?utf-8?B?cVZIMEdvUGFtemx5b2I4SWZNY2Nub2RENXNxbjlnUUQ0bFRGdE9hT01lNjFP?=
 =?utf-8?B?aHNjSjBVZi9XK1g0YVFyV3lQWXVTeVBsenJENFQ0NTZ0bkJXVjRBaWZ3WjhB?=
 =?utf-8?B?YXB6Sm9SWFVGQWRBQzRtWFhoblhpcnNGMTl1ekZnMVJkMGRmalhnekQySkhw?=
 =?utf-8?B?d0ZKRzI2dllPUDk3SDJkLzhjOFlOaHV5ZVpmQ1JpMlJBN2dQK3RFY0ttaVJM?=
 =?utf-8?B?bTdaTVcxb2dyL2tDUWdXUjdNOUo2dWxxa1BlYUUyN3JuRThzS2s0cWo5VGNw?=
 =?utf-8?B?TDBVUnBKUFVhUVdlS1JKM3dRVW40TnYyazJ2U0JwOWtRMlY1K2o0Q1NPSFdY?=
 =?utf-8?B?eFhGSVRUNUo1VldlL3FIemt1azhwSCtCcFkwMGdzZzhvaTZJQ3ZCWklENTIr?=
 =?utf-8?B?TzZqZ3FnN1h4WGgvWWlFcVQvOTN3Z1VndmZKZDZqcXo1cjNGSFdhWXlUSlNk?=
 =?utf-8?B?eDVpWktscVFLZnZlSHpZNW5XWEFGYXA5ZDB4VElHdVV1QUVVWFpRWXcyUTV2?=
 =?utf-8?B?UkxmRmFOS1M5aTk0SUludjlSL1ZUeXVYclNHS01TbVpkMUR5c0RkVnhkOUk4?=
 =?utf-8?B?RXhJTTE1U3J1VGdWT3lJbk5ud211MVR5QVlpM1VUZVRpZHU3MjBCd3RtTmhk?=
 =?utf-8?B?R0E9PQ==?=
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-0:
	XZbqOxZ4TR2aKAogVxs2yZijF3a/Wob0EtnV+wxIf0c9h7kNg87ztRaKiVriNT8E8E7PZmRMIsXfNNqSXlY8wYIewIVgIqXc0JPwynH5gt5sT91+4ewFzNl1S8tUEiKCEdyOhu9RZ8MxNeE3Qk9YgI0jI9ysm0siKHEPkCb0kakwnUIGNsgQkcGUkTimf9HyytsAynklkQ4ohm+jnUQNzzgMyydrDLKpwREN6Jb/W/JtNaIHHQJyyYMPFwrz9nk7w9mMi/i9aaCkLmAB19OSlrHncymTUJLiIGCKtJOtgI/GH0f8jApoBxk9IXHiMIIZq3+ZL9vb2wMgYqnv4GM3VlQNaWpAA5quMEsgCY6ieYw+RyA3WKKrWPoE0gDWZ4yo93RwNoqm0ixD4KYug/+9NrVHWpUMd/Lf/JnXFRLTSKboDU14HG70djGPjxytT6vowY/O7zjiCHxA26f8ruoJJbAz3tjgc2mIWJTo+Vr+0pjF+UB/N+Lifu6P33fsp3/36b8qGitxyxg8WtsTlJUnlnjHSbUKndyQrGHUgUj92Vw45Fv+iQvq7mpTNi1JaHb4eI7vEDyCa6BUXtSEltllt/HigOUPsGxbUwQQmF2UkNsUNigLIHON4QyWV7SDSNOf+rgJdVTB/qtVqBpy4IIoXHWc+PCI7txVTgiMUByiQB5/H4SY1HvMA5N5Dw6D5/XOoEe9CEDQ3uxNCbmu9XmwOMH2zVjoIuIz+jNYYsRI4f2+NFTr5lvGCIsDMotAvHZGlXXgOaADxSpzb7N9gUruljc/sT2O5UicD/Urm+y80KQ=
X-OriginatorOrg: citrix.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 16b63c1f-288b-4065-70bb-08db89f01135
X-MS-Exchange-CrossTenant-AuthSource: SJ0PR03MB6423.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 21 Jul 2023 13:40:38.1086
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 335836de-42ef-43a2-b145-348c2ee9ca5b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: RRcl+5o8PIjuzSC1Ub5CrNtfUFDwhqcINFAf2LNINVNlfPnxBGh47lIpsvOV0BHqmPZoiX9Mz/biwOAJYhXW9Q==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM4PR03MB5968

On Fri, Jul 21, 2023 at 03:32:27PM +0200, Roger Pau Monné wrote:
> On Thu, Jul 20, 2023 at 12:32:33AM +0000, Volodymyr Babchuk wrote:
> > From: Oleksandr Andrushchenko <oleksandr_andrushchenko@epam.com>
> > +    /*
> > +     * According to "PCI LOCAL BUS SPECIFICATION, REV. 3.0", section "6.2.2
> > +     * Device Control" the reset state of the command register is
> > +     * typically all 0's, so this is used as initial value for the guests.
> > +     */
> > +    ASSERT(header->guest_cmd == 0);
> 
> Hm, while that would be the expectation, shouldn't the command register
> reflect the current state of the hardware?
> 
> I think you want to check 'cmd' so it's sane, and complain otherwise but
> propagate the value to the guest view.

In fact asserting that header->guest_cmd == 0 is pointless, as the
structure has just been allocated and zeroed.  We do not assert that
the other fields are also zeroed.

Thanks, Roger.


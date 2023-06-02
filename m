Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 798A071FE31
	for <lists+xen-devel@lfdr.de>; Fri,  2 Jun 2023 11:46:16 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.543064.847669 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1q51MB-0002EG-77; Fri, 02 Jun 2023 09:46:03 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 543064.847669; Fri, 02 Jun 2023 09:46:03 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1q51MB-0002Bl-2l; Fri, 02 Jun 2023 09:46:03 +0000
Received: by outflank-mailman (input) for mailman id 543064;
 Fri, 02 Jun 2023 09:46:02 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=c0ON=BW=citrix.com=prvs=5106ed88e=Andrew.Cooper3@srs-se1.protection.inumbo.net>)
 id 1q51M9-00026T-Kl
 for xen-devel@lists.xenproject.org; Fri, 02 Jun 2023 09:46:02 +0000
Received: from esa6.hc3370-68.iphmx.com (esa6.hc3370-68.iphmx.com
 [216.71.155.175]) by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 46e54621-012a-11ee-b232-6b7b168915f2;
 Fri, 02 Jun 2023 11:46:00 +0200 (CEST)
Received: from mail-bn8nam11lp2168.outbound.protection.outlook.com (HELO
 NAM11-BN8-obe.outbound.protection.outlook.com) ([104.47.58.168])
 by ob1.hc3370-68.iphmx.com with ESMTP/TLS/ECDHE-RSA-AES128-GCM-SHA256;
 02 Jun 2023 05:45:51 -0400
Received: from BYAPR03MB3623.namprd03.prod.outlook.com (2603:10b6:a02:aa::12)
 by DM6PR03MB4988.namprd03.prod.outlook.com (2603:10b6:5:1e2::14) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6455.23; Fri, 2 Jun
 2023 09:45:46 +0000
Received: from BYAPR03MB3623.namprd03.prod.outlook.com
 ([fe80::10bb:98bc:e36d:36ab]) by BYAPR03MB3623.namprd03.prod.outlook.com
 ([fe80::10bb:98bc:e36d:36ab%3]) with mapi id 15.20.6455.020; Fri, 2 Jun 2023
 09:45:46 +0000
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
X-Inumbo-ID: 46e54621-012a-11ee-b232-6b7b168915f2
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=citrix.com; s=securemail; t=1685699159;
  h=message-id:date:from:subject:to:cc:references:
   in-reply-to:content-transfer-encoding:mime-version;
  bh=93qzKdbPfCEltK/G8bH3U9HmqhAhF4UbQdob1WlSD7M=;
  b=hIge7Nnf+fWE+n4lh9Z55unyzXxdeGh9i9ujkgFSGq2vUSEpZfMNmJ+5
   3XZgqmqCn2y/jBFL9jiUINdeB5emIx2gchkWL1YSBquelqqB0xFt/Pbdk
   XuGHDA/Ipkf1MokofqqUX01WhmoR0LVXU1jcTdWMlnYcN5qzYfyTpMvCp
   0=;
X-IronPort-RemoteIP: 104.47.58.168
X-IronPort-MID: 110672724
X-IronPort-Reputation: None
X-IronPort-Listener: OutboundMail
X-IronPort-SenderGroup: RELAY_O365
X-IronPort-MailFlowPolicy: $RELAYED
IronPort-Data: A9a23:4IPti64ON506XgdFNt/BIQxRtPjGchMFZxGqfqrLsTDasY5as4F+v
 mEcXGmOb/mCamOjfoxxOY+/oUkA68fVx4QwHFc/qXtkHi5G8cbLO4+Ufxz6V8+wwm8vb2o8t
 plDNYOQRCwQZiWBzvt4GuG59RGQ7YnRGvynTraCYnsrLeNdYH9JoQp5nOIkiZJfj9G8Agec0
 fv/uMSaM1K+s9JOGjt8B5mr9lU35JwehBtC5gZlPa4T5geH/5UoJMl3yZ+ZfiOQrrZ8RoZWd
 86bpJml82XQ+QsaC9/Nut4XpWVTH9Y+lSDX4pZnc/DKbipq/0Te4Y5iXBYoUm9Fii3hojxE4
 I4lWapc6+seFvakdOw1C3G0GszlVEFM0OevzXOX6aR/w6BaGpdFLjoH4EweZOUlFuhL7W5mt
 vgqBwonaim6iePo47eyc7RDpss4M5y+VG8fkikIITDxK98DGMmGaYOaoNhS0XE3m9xEGuvYa
 4wBcz1zYR/cYhpJfFAKFJY5m+TujX76G9FagAvN+exrvC6OnEoojuiF3Nn9I7RmQe18mEqCq
 32A1GP+GhwAb/SUyCaf82LqjejK9c/+cNtLTOPnrKEw3DV/wEQRKBhVfH+VisC/sVGBVO5yI
 m8G3ygh+P1aGEuDC4OVsweDiHyOswMYWtFQO/Yn8wzLwa3Riy6QAmUGRzhNcttgqsYyQTEo0
 XeCm9T0CXpkt7j9YW2Z3qeZq3W1Iyd9BX8PY2oIQBUI5/HnoZovlVTfQ9B7Cqm3g9bpXzbqz
 Fi3QDMWgrwSiYsB0fW99FWe2ja0/MGXHkgy+xndWX+j4kVhfom5aoe06F/dq/FdMIKeSVrHt
 38B8ySD0N0z4Vi2vHTlaI0w8HuBvZ5p7BW0bYZTIqQc
IronPort-HdrOrdr: A9a23:wdoCY6+9u5vmfNq6fkduk+AcI+orL9Y04lQ7vn2ZKSY5TiX4rb
 HKoB1/73XJYVkqN03I9ervBEDiewK/yXcW2+ks1N6ZNWGLhILBFupfBODZsl7d8kPFl9K01c
 1bAtJD4N+bNykGsS4tijPIb+rJw7O8gd+Vbf+19QYIcenzAZsQlzuQDGygYypLbTgDP7UVPr
 yG6PFKojKxEE5nFfhSVhE+Lo7+T8SgruOeXSI7
X-Talos-CUID: 9a23:NDW0aG0OxY5sHiTxMriBCrxfWcQXXUf3yE7pLU7mKmNgceC6aVCL5/Yx
X-Talos-MUID: 9a23:D2kCSwX49ojlgc/q/D3MgXJLEOlD2qKVF38CrbgPmNuhNyMlbg==
X-IronPort-AV: E=Sophos;i="6.00,212,1681185600"; 
   d="scan'208";a="110672724"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=aBF58XVv8XqL0HHmjTyRoofNyu6Rz44Ok0+5Q1zH6QIPE1icrc7/BQI/2VEkhZIFl9kWiliX7AyPHmmsASa7yKk/fh4cevBMOf7/M3yf5kGPN+DnECVCVK8wMYUar5er27DcrOtOgsMCu0xahBhmhgpN3UHtvouWRUIXfL/sSXTsa+KAcjgPfe3BCUo7VdAPsOJjYvgvG/CbHVMWaNMh+7AjWZGBftLEaKFqchx9TXPrkGgPmscZjekAJUQ3MJCUgq+MWXGPo0XMfYweqvCjjKptXCnKK6tkis7d0xFE35N9OC9Q1+Ll0IFkLzxc/N24gcfI/ul/hCus/xAjLqElIQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=hYLtv3+czrFgmUApOlfgnmYh9IveRIgCXZjdFCeC2zw=;
 b=G+K53vtS7wgr3UZGRt9moYfHaDQ71IcJk7GA3cihLIf7UuRx7yXxvPORO9EBc06h3mhXu7m1LVOvWlfK48BQZZOkq7DdBzgvANzfJH7cvpgdXV4Tostu32ase4it3v6bd5aqtd1SVriBXd9eLMD4r/Ezl5eGZDZw+4Drmezg88pqulTV64loX3FscV/scrzBS7vGZplJYB4VmhzKK8RtDOVG8+PrITPYXjLpz/QO/x+Qd2y5O8e8lUwa0gXYPVuVicwEfoM12d5CKluC1vbc9pAQAEDueGUjTWtcsK8sC9iN+SG3v44YFNxjcbXxsMePchZUSZFVDfD5NHZlcuQSjA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=citrix.com; dmarc=pass action=none header.from=citrix.com;
 dkim=pass header.d=citrix.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=citrix.onmicrosoft.com; s=selector2-citrix-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=hYLtv3+czrFgmUApOlfgnmYh9IveRIgCXZjdFCeC2zw=;
 b=XT9DMgNbXdc6jpQNL+wl47khKJl8kkvsPw4yMePJgDFhV4o+pPnLrqJZq+ktRsSmk3PRYkBOHEsT6rgiw/gVinCtLnDbgCErC8o4GUbEsKVboobASXvd96xsrbmjmdUx0K8IkzUgfYeUpTCk0U8JFzMa0AahtMVY8LFRfGKsxwk=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=citrix.com;
Message-ID: <72e25567-7d7c-7910-f922-3f100d3e260c@citrix.com>
Date: Fri, 2 Jun 2023 10:45:40 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.11.0
From: Andrew Cooper <andrew.cooper3@citrix.com>
Subject: Re: [PATCH] x86: Add Kconfig option to require NX bit support
Content-Language: en-GB
To: Jan Beulich <jbeulich@suse.com>,
 Alejandro Vallejo <alejandro.vallejo@cloud.com>
Cc: =?UTF-8?Q?Roger_Pau_Monn=c3=a9?= <roger.pau@citrix.com>,
 Wei Liu <wl@xen.org>, Xen-devel <xen-devel@lists.xenproject.org>
References: <20230601174327.11401-1-alejandro.vallejo@cloud.com>
 <619ea01a-2058-c4ed-0f5c-394a82f838a5@suse.com>
In-Reply-To: <619ea01a-2058-c4ed-0f5c-394a82f838a5@suse.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: LO4P123CA0653.GBRP123.PROD.OUTLOOK.COM
 (2603:10a6:600:296::23) To BYAPR03MB3623.namprd03.prod.outlook.com
 (2603:10b6:a02:aa::12)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: BYAPR03MB3623:EE_|DM6PR03MB4988:EE_
X-MS-Office365-Filtering-Correlation-Id: c430027c-c4f3-4ce4-564c-08db634e2398
X-LD-Processed: 335836de-42ef-43a2-b145-348c2ee9ca5b,ExtAddr,ExtFwd
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	gSVb8YMQvxngK21OMfTfeD2kmDxGIDoiJP9JeQdpvd27NZJTl/B8jbzb1s4fmnDycT9LyYvnB+84eduxRoviqxc/nqqTdhwlF+anPrP9Hb3ANyxcxUvZzP/PnR5exsmcu779GwOvq4TM7diXBMlopHkmwZDP7f3PHbsfzrCamTmZB2tEvogu31ye544YRcCDrvu9wKo23dzqXWpSLyOYuKarCYl6gJirUD2jmuV3c0Xc1caHMHaC6/5G14fAHRZKgxqDN1eswuSbJ1HWXgZQKUkrW2BNmQ/VqWhuI9ohrepwuEgY2VPW0MqKZmuIj/5z00gkQQ7XS0dzgC/PG9/H1KUGjywJ1HRjUXWs4RnShYkonDSesnOHVGxY5b2Jju9ljz8AGgPOeVi2qIvY1N0oNG6FJ2NMNDFAr6br1fSVpy3R7XaXp6DN0xvzC7g8XgketU5hP6hG9wNXj5Xdcu/gqjVd/EKV8utT3Q0xKUECuNXtP3y6A/LAokua6tE+4Se0dGl8ReGNMERA18GfH2+f5HEsU8ao1mwnVwQzduYAJtHWE+KigSgwe4jhuVv3nbNSk6ATUXgKr1bl9/zWi+BVr6HRXR8XBhBT76oyf7IY93zw8s1CQDWYENxCZnbofg3LEzAhcoVPBpjne3zBcqGyjg==
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:BYAPR03MB3623.namprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230028)(4636009)(396003)(376002)(346002)(366004)(136003)(39860400002)(451199021)(86362001)(31696002)(8936002)(5660300002)(31686004)(8676002)(2906002)(4326008)(38100700002)(316002)(82960400001)(66556008)(66476007)(66946007)(110136005)(54906003)(478600001)(6666004)(41300700001)(6506007)(53546011)(26005)(6512007)(2616005)(6486002)(186003)(36756003)(83380400001)(43740500002)(45980500001);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?TC9tM2ZuVUw2WnQzL1VsUWtQTnJVMURNRjIydWRZa3cyV3NETmNzTEpSbnNv?=
 =?utf-8?B?TEVYRTJBV3ZmbzFRUmJvdExDTGx2R1Z4Vy9jZmROTXRFMlExcHdPUmpCWk5t?=
 =?utf-8?B?UjMzOXkvVURseFMvc3N3cXVSVTJ0cVEzMm9hZ0xwcU00dGpicE1HeWg5MjJG?=
 =?utf-8?B?WWJ1RXJabmpYcXVVenBERlhCZ2Qvb0RSOW9JWUZ4c1FsYXFVUVRlY01PbGJJ?=
 =?utf-8?B?cXJ5NFUxRmx3REpKK2IzTHhxb3lOY2xPUS9odk14enNBMFdpVC9vWDBUMm9r?=
 =?utf-8?B?RUIvbklDbHczcHJidlNtbkd3RXkwcHU0azhEQ3FJZFFsT2REemJNWnRtTWtX?=
 =?utf-8?B?blR6cDROQmhVNUJ0aGRtOTVaY0RzdGRkZ3dzYkhQU3BRTEJPcVFHeGRoNEJM?=
 =?utf-8?B?TXlmQ2d6U0RBR0thU1V4ZzJWSDBMNGVjeWhhNWszTU9NRzlFY2R3ZVcyYUg0?=
 =?utf-8?B?UXdlSkxacFNpakh4Rk40aFJmdlJjYjZ4Vk12c2hlcEhLbjJzc25VRGhMWUlV?=
 =?utf-8?B?T05OeEh1MzBCWFViNGJ1T1ZhREt1MC9ocDE3NWVIL2t3bHFCN3dvYmRLUk9E?=
 =?utf-8?B?amFHY05XS0xINlRBK0N4aTYyR1Uwb2V0eGNjQ3lPT01nRURvYUdXUmErVmx5?=
 =?utf-8?B?ZzJ2M09JOGd4b1RadW1SODhldStDbDN6M3Y1bGc3SlA4RnVLVnlvakhvNkc5?=
 =?utf-8?B?bVZCT21JR0VESFB0bmZaaXhEY0hrOGd5RlNwZktCajlaSmFSSlZvb1lzcVRM?=
 =?utf-8?B?OVp2U1Nwbm9lcjdZSXVWTzJJdlBSQmVRRFpRSFFMTEpnYUo1U3o0cWZ6YkdU?=
 =?utf-8?B?QU5ITVJZcHhLRy9SYll1amc4M2NyaXBvRmgvbHd5T0RhU0pPUFlLeGtPOVFK?=
 =?utf-8?B?dWpHWnJxTklLSnlTb1ZCSFJlYXVsSmlDK2lTK0N1SWJ4UG94aGdJdkU5RXZB?=
 =?utf-8?B?WUsxQ215UVVlWDZOZlRFalNWMGgzei9acU5IU0FGVUtzQUFYWnNaQW00czZQ?=
 =?utf-8?B?SVJtZVByeHROSkN3NmxnOEpxZ2FQSmdyNWhDdkN3clBYUWZhemdEN2RJeTdY?=
 =?utf-8?B?NVN1T2srOThTVXYxb1ZtdkJxdmQySHZNeUZ4R3FEL0RRUmgzT2lGSHY2UVhI?=
 =?utf-8?B?RmlDV3FuOFZqN3JVYjlWWUFnMzRZKzhaZDhjTXBnNmNza3lKSDBPc1VSVk0r?=
 =?utf-8?B?cjNabUpmeEpxa3RDUm9sVFNSZUdmdmxUK2d5ZmR1c2lVM2Zpc2Fta2pHTHZ5?=
 =?utf-8?B?UFQzS2FkaUwrcmxyald1cW1wRW9QVXNaK29aeEJIeEdPSlh4SUl1R01QQkVw?=
 =?utf-8?B?T2pXWFNpOHBwcDI5LzR3SVptRjZ6UFlqT3JnUTdMVnRSbWVRQXF1aE5TZHdo?=
 =?utf-8?B?SkJ0OVpoU1VwNnczbXpNUklFZUhyQXVYclY4ZE0rdlJyWklSek9IYmxWdlpM?=
 =?utf-8?B?ZlhtcnV6bFdvaUtLcUl4YVJ5VXBDWkFSS3BIT093QnJHU1JRalFpZG1melNq?=
 =?utf-8?B?Y0R1NUpEMmU4WGppUEFEaUx2b0dTRkprcmhjb0JDd0NGZWVIT2gxeFBRNU04?=
 =?utf-8?B?L2hGWVRBY2YzanBoYmYvTWZZRXJ2bVUvejEyNEdtUGVCUjgvbjB6Y09wcStY?=
 =?utf-8?B?SnhQSzE2OXUyK25rUXV0TXhZUDVhSDNmem9uNEdLWUQ4dVBEcE84bXdWdk53?=
 =?utf-8?B?b2V4ZW5RaXJKVWR2NGpaVjh3TjFER0RQcEhXVjUyeXhobDZmZmlDN1Y0bk1L?=
 =?utf-8?B?dlZWWWYrTnMrd1NPQkpKK2g2NllFeUZISGFHZzEvTVpGb25MVlZSbEpvaS9Z?=
 =?utf-8?B?YzdXVkpjVmIxS3pHM1BpVWFDSXJCcndvdmlUZEZzZ2RvTENub290L0hyR1lm?=
 =?utf-8?B?UkhsQ1h3bTU4VWFoVng2Tm56UW9YMkZ5MDB6WDN1b2JEVFFGbFlGS0tZUHlP?=
 =?utf-8?B?ejFRaC9ucTN2WjhET2praWZnejd2bWgxUTFtNVFaMnpxakpGL1V2cmlBRUFl?=
 =?utf-8?B?bjl2eEJiYzhVZFVUazNoc2pLUm51dGtrcHA3eXJNVFYwVDErZmhGT1FRak94?=
 =?utf-8?B?b2d1bkNocUhqTStZSitHbVhzd3NPY3Uyd1BtVXNCQzlSRXVLNUFUbzlZdVZD?=
 =?utf-8?B?cnFaRGREcU5mV1Z2d0ZpV2xDK0VkWlpGc0VRSWdUdUw5TzNyT2dkQTZYM2d3?=
 =?utf-8?B?M0E9PQ==?=
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-0:
	OfI1qu7/bxYYrtFWIvwhhyfIb4MpiG4SCk0E77rb8ONqET7N6WbHSBa/J9i684Hl+dpC+08OZyPrTPUi1rjp7SCXwEJ+dcLknu8t/MaIAJ0NOwbQ1+gJSAXyjHzsca1lq0q5r/HhvCJlDGS/rjyy9qI2+w5/S9e6CFeKbjvpfsuKqxiOZlZmCHbTNd3G6tkcBKLaK8VayM/b8n66PlWhgsu0nV2VCxeSdKM7moasUCM2eDmLci/F4Tx6IazEBgkXu0Bh9sw65A6obRtodLykAi90rANagI6NcZ19U+RqyjWHgjpqneOh/XxTQ2Lt2PfqTOMN0Oa5LCgSsZu7D8zyNM5Oh80LWK6XCwANTmPBtz75jcYkJhpa72eYxvSS2NgS2MtZI9S5wGahfhB5MOCQC4VNw39cxRF8gvK6SRfVlrUmUvrrFI1WxaVCuzdNuD+NWgvLmhnvMiMv9BF1W2kOdNhiC6MmU0aU8NhOfmA+xmpsJuvN9VKWKNKhfLuKUznlT3/EIvHfau7gY7vSwcukbAILki1whTjMrsFR2N242D9lUcM1JB6m6sVReRDGKL6128X5wETKPai7oc5vTiub+TE2T0CL9UMwZtfiD9HRDYwXIQZEcAs/bDu9TvtohmHq7Gzy5BS/y4ASRl5AMtWsJgxaNJ83WLpWdLkF1jT7yybUpb2G4MtveOMBbv+QCW4pDF++AfRF9BUEe1i7WYeeYF5diKKyuZQfxcB/6t3T0eR5iHcW3Yu23rnx+J6QtnGBP1h5UH0qnHBEvDEwNj0Sa+86qJKzL+CbzeXGDuwQ3l1XOTtx/7+tjWpBOMwlujj0eD4IW9Tt0au9lWJiCBLKarEN6uX83EIA/IScS3qYj3k=
X-OriginatorOrg: citrix.com
X-MS-Exchange-CrossTenant-Network-Message-Id: c430027c-c4f3-4ce4-564c-08db634e2398
X-MS-Exchange-CrossTenant-AuthSource: BYAPR03MB3623.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 02 Jun 2023 09:45:46.1980
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 335836de-42ef-43a2-b145-348c2ee9ca5b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: jPL6nUeZCdfUpit61JkswPPm/E1V/DtTt3T0BDynaIhKvKTVcDbjP2HoCqVyvAJPmBpmgiAr8rFTB6JtXaFkW1YZWdiSMEIXwJBud8ZMN9w=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM6PR03MB4988

On 02/06/2023 9:31 am, Jan Beulich wrote:
> On 01.06.2023 19:43, Alejandro Vallejo wrote:
>> This allows replacing many instances of runtime checks with folded
>> constants. The patch asserts support for the NX bit in PTEs at boot time
>> and if so short-circuits cpu_has_nx to 1. This has several knock-on effects
>> that improve codegen:
>>   * _PAGE_NX matches _PAGE_NX_BIT, optimising the macro to a constant.
>>   * Many PAGE_HYPERVISOR_X are also folded into constants
>>   * A few if ( cpu_has_nx ) statements are optimised out
>>
>> We save 2.5KiB off the text section and remove the runtime dependency for
>> applying NX, which hardens our security posture. The config option defaults
>> to OFF for compatibility with previous behaviour.
>>
>> Signed-off-by: Alejandro Vallejo <alejandro.vallejo@cloud.com>
> At a guess this may want a Suggested-by: Andrew?

Well - it was a work item off the backlog, and a one-liner at that.  I
wouldn't have said an explicit tag was warranted simply because I put
the backlog together.

~Andrew


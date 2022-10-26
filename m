Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 3E8B460E52B
	for <lists+xen-devel@lfdr.de>; Wed, 26 Oct 2022 18:01:56 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.430676.682622 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1oniqX-0006i8-BK; Wed, 26 Oct 2022 16:01:37 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 430676.682622; Wed, 26 Oct 2022 16:01:37 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1oniqX-0006fi-7L; Wed, 26 Oct 2022 16:01:37 +0000
Received: by outflank-mailman (input) for mailman id 430676;
 Wed, 26 Oct 2022 16:01:36 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=n4Ky=23=citrix.com=prvs=291e24488=roger.pau@srs-se1.protection.inumbo.net>)
 id 1oniqW-0006fc-5U
 for xen-devel@lists.xenproject.org; Wed, 26 Oct 2022 16:01:36 +0000
Received: from esa5.hc3370-68.iphmx.com (esa5.hc3370-68.iphmx.com
 [216.71.155.168]) by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 75ab924c-5547-11ed-91b5-6bf2151ebd3b;
 Wed, 26 Oct 2022 18:01:34 +0200 (CEST)
Received: from mail-dm6nam10lp2109.outbound.protection.outlook.com (HELO
 NAM10-DM6-obe.outbound.protection.outlook.com) ([104.47.58.109])
 by ob1.hc3370-68.iphmx.com with ESMTP/TLS/ECDHE-RSA-AES128-GCM-SHA256;
 26 Oct 2022 12:01:19 -0400
Received: from SJ0PR03MB6360.namprd03.prod.outlook.com (2603:10b6:a03:395::11)
 by SJ0PR03MB6779.namprd03.prod.outlook.com (2603:10b6:a03:40e::5)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5746.28; Wed, 26 Oct
 2022 16:01:17 +0000
Received: from SJ0PR03MB6360.namprd03.prod.outlook.com
 ([fe80::9f90:6ba5:5b44:c254]) by SJ0PR03MB6360.namprd03.prod.outlook.com
 ([fe80::9f90:6ba5:5b44:c254%3]) with mapi id 15.20.5746.028; Wed, 26 Oct 2022
 16:01:16 +0000
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
X-Inumbo-ID: 75ab924c-5547-11ed-91b5-6bf2151ebd3b
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=citrix.com; s=securemail; t=1666800094;
  h=date:from:to:cc:subject:message-id:references:
   content-transfer-encoding:in-reply-to:mime-version;
  bh=MNhskMjZloTkLeOZVgNHLz79NkqOdYCE8IQZl+2+sR8=;
  b=IePnQW0gVqiA+iDwa00ipoxfZz9OHh9DnpZ+QX520sZsSDVKAml0AUDS
   /j8MgKDbwf8x+Ei3nFaim2LltrfAeecqwVIn0P9Z9Jqp2Z4Nf0hKTZ1ym
   JgZ3dO5Th1CFsic+OjZAmY6Dp6hj5+3d1dLDsAzvqSvDwAXV96yH6fjOw
   I=;
X-IronPort-RemoteIP: 104.47.58.109
X-IronPort-MID: 82657922
X-IronPort-Reputation: None
X-IronPort-Listener: OutboundMail
X-IronPort-SenderGroup: RELAY_O365
X-IronPort-MailFlowPolicy: $RELAYED
IronPort-Data: A9a23:AKjYaqLOqGNknXF0FE+R8pQlxSXFcZb7ZxGr2PjKsXjdYENS12AFz
 2RNCzrTOPmCZGLyc9l0aI2w9U5VuZfUz9EwHlZlqX01Q3x08seUXt7xwmUcnc+xBpaaEB84t
 ZV2hv3odp1coqr0/0/1WlTZhSAgk/vOHtIQMcacUghpXwhoVSw9vhxqnu89k+ZAjMOwRgiAo
 rsemeWGULOe82MyYz98B56r8ks15q2q4m1A5DTSWNgQ1LPgvyhNZH4gDfnZw0vQGuF8AuO8T
 uDf+7C1lkuxE8AFU47Nfh7TKyXmc5aKVeS8oiM+t5uK23CukhcawKcjXMfwXG8M49m/c3Kd/
 /0W3XC4YV9B0qQhA43xWTEAe811FfUuFLMqvRFTGCFcpqHLWyKE/hlgMK05Fc4AwswnJ21Cz
 v07dwIJPyGmrfDu6b3uH4GAhux7RCXqFKU2nyg4iB38U7MhS52FRLjW79hF2jt2ntpJAfvVe
 8seb3xocQjEZBpMfFwQDfrSns/x3iW5L2Ie9QLT/PJmi4TQ5FUZPLzFKt3ad8bMXcxItk2Zu
 njH7yLyBRRy2Nm3mWDbry393LWncSXTZtoTKbuYyt5ToGKK7UANBw0UX2KhiKzs4qK5c5cFQ
 6AOwQIsp6Uv8E2gTvHmQga15nWDu3Y0e9dWCfx81wiLxYLd+QPfDW8BJhZRZdpjuMIoSDgC0
 l6Sg8ivFTFpqKeSS3+W6vGTtzzaBMQOBWoLZCtBQQ5b5dDm+dk3lkiWFoclF7OphNroHz222
 yqNsCU1m7QUi4gMyrm/+lfExTmro/AlUzII2+keZUr9hisRWWJvT9bABYTzhRqYELukcw==
IronPort-HdrOrdr: A9a23:9n+fg6uJe6vp28Qymr+F+1dh7skC7YMji2hC6mlwRA09TyXGra
 2TdaUgvyMc1gx7ZJhBo7+90We7MBbhHLpOkPEs1NCZLXLbUQqTXfhfBO7ZrwEIdBefygcw79
 YCT0E6MqyLMbEYt7eE3ODbKadG/DDvysnB64bjJjVWPGdXgslbnntE422gYylLrWd9dPgE/M
 323Ls7m9PsQwVgUu2LQl0+G8TTrdzCk5zrJTYAGh4c8QGLyRel8qTzHRS01goXF2on+8ZrzU
 H11yjCoomzufCyzRHRk0fV8pRtgdPkjv9OHtaFhMQ5IijlziyoeINicbufuy1dmpDn1H8a1P
 335zswNcV67H3cOkmzvBvWwgHllA0j7nfzoGXo9EfLkIjcfnYXGsBBjYVWfl/y8Ew7puxx16
 pNwiawq4dXJQmoplWw2/H4EzVR0makq3srluAey1ZFV5EFVbNXpYsDuGtIDZY7Gj7g4oxPKp
 giMCjl3ocZTbqmVQGZgoE2q+bcHkjbXy32CHTqg/blnAS/xxtCvgglLM92pAZzyHtycegH2w
 3+CNUZqFh/dL5pUUtDPpZxfSKWMB24ffueChPkHX3XUIc6Blnql7nbpJ0I2cDCQu168HJ1ou
 WLbG9l
X-IronPort-AV: E=Sophos;i="5.95,215,1661832000"; 
   d="scan'208";a="82657922"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=KOggiWP4pFpvRNoTHYnPkPAfFOlCu3dBm89p6c2DcbM6qvk+2pmLkYj8gjFSDbPNH4aZQCBi+K6NJedHmdOy3mYGzmJv1go0AzDVNtQY3kGKbMGDzBWZEvN74WUjlBtXeX71iYvmjfWNAPcZHhWsjGoReuReF1LmrBitYso6acIlKiMeVqp1ScK+O+97gYX0WX+4ztxIFPvdPFoAx3fvpnEX9BCLUR+NpF1DJloyK/hu2cZp3In7l+eK9GwerWqBYbWyUdj8fpYI7PdsiaPx0So5MHOwKwyxYFNium29E7G/KB3X3FhKIShHIZEFFkDD+316GRbZm4ocfOCKLZB94g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=M8nRB5uedLk5esz7w0md7iNePwpVrvFMHRbyl66rIzA=;
 b=EcxcD9RxhNDiE2HrryoHJhMC6Y6MMcqOC1faazB3icAz1w9REXLJgF/PCMsYUmNaLJFZfsloDnOFoUn8kE5anA+hte11nEzMPeKKyGZ0DsSStKIV83Y1HzmtZHvq1DrGIlAz9BJQnjhDLp77MAY3Y2Sf4/B9IH79ngXTorS+tbXmqgrLAWXSjBCkTStNmCRxGc6L6xQVRVa8RxLGMZsKwiavB7I2SoEBFkm/MvB+lND563D8UsjyFL0JbB1MXDVMpNqnXCUynWeohvcAyQtfZWWp9uZrRtGM7IKka0SJ52WEAjmhRadCaqWqUS645WrF2S9ZS6FREVKsmCcE1Ir+rw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=citrix.com; dmarc=pass action=none header.from=citrix.com;
 dkim=pass header.d=citrix.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=citrix.onmicrosoft.com; s=selector2-citrix-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=M8nRB5uedLk5esz7w0md7iNePwpVrvFMHRbyl66rIzA=;
 b=l9CyTDPtQCCxISur+/+Z8MOyJMJc2OI1wyl76SP8g9eeTcYMw7Ez7G1LYdBq7kALvak0APEPmtxtOhSxPktU+p+bJZP7V38U6sWdElVPp/hYPelgoUYsNLeOhr3YiwNnEjDXsU4VxIO+fTq942HOHN3R3zNBmAzFUHAfo9UMww4=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=citrix.com;
Date: Wed, 26 Oct 2022 18:01:10 +0200
From: Roger Pau =?utf-8?B?TW9ubsOp?= <roger.pau@citrix.com>
To: Jan Beulich <jbeulich@suse.com>
Cc: Henry.Wang@arm.com, xen-devel@lists.xenproject.org
Subject: Re: [PATCH for-4.17 v2 5/5] vpci: refuse BAR writes only if the BAR
 is mapped
Message-ID: <Y1lZxldTIWawfpnO@Air-de-Roger>
References: <20221025144418.66800-1-roger.pau@citrix.com>
 <20221025144418.66800-6-roger.pau@citrix.com>
 <666377e8-fe58-bc9f-70ff-2e21d93c691f@suse.com>
 <Y1k88uhbSNdMvsa+@Air-de-Roger>
 <045428b7-9c4d-cbf6-3ca9-157c516399a9@suse.com>
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <045428b7-9c4d-cbf6-3ca9-157c516399a9@suse.com>
X-ClientProxiedBy: LO2P265CA0092.GBRP265.PROD.OUTLOOK.COM
 (2603:10a6:600:8::32) To SJ0PR03MB6360.namprd03.prod.outlook.com
 (2603:10b6:a03:395::11)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: SJ0PR03MB6360:EE_|SJ0PR03MB6779:EE_
X-MS-Office365-Filtering-Correlation-Id: 67b209ce-3b9c-43af-7277-08dab76b506e
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	YDoaJ9FjyYOpz7wxlQsLXaL1BLWGRqkVRMaovMb4SmsHiLTOG6Iz+PCHrtCwOpb56Xe4R1JRmLFGYCsvJVysknP/v34pkcnekh/+2DYnKH8O3gn85xUpUWDxASFA4ulMEals1KjpxEfLRW5ohfpGSYwfIqEWqRl3ObmEZI7kIvoJozrYVoTu+3BPqYUyaDn6IQYlmB3lQ8XNhHgdWoo/yN6cZApcn7O4fLsLx1czW/ul3gbwSLxznRaGh2T2UgvjCF9pgZHH7DnnXQlmCkrTeyK3ElVkKJEwToqBxoS88lIxjf6qleYq+ie5qu6dxkhttTdmOxVl9gWoKQ3Z5ZCyfrwTEbS5KdGz5pa2d2vKPbnWjjBtrfNWBDlNDY9BxEtjMNle888Lh0KZfI2zAGl+FERPHQ+fVOtBAHZtoIrjPY9srtTy4UJInEU/5deqjsrJwwkq6Y9xAk8t4YQq76CvDSI1Z732UUtes9RjgfTYLcNGZTMXtdniewnrERLZ5r9EF6duYCtiLO5aZZCoC6m/iS/MKafqAgBegZk3slxt5HyKDX1KwqOUIJJq3tmTorNyEbvcz/jeo34Bhc2SmFHdgPw7SBHjPXfhqW4WUfyyzpJp2KvC2ui2jH05KlUqIjkPEwpplsCX86LjaR2xu+OdRS2u55PoN3QJ5qJVAnwKCOyw+TAb2rQFApnOfwI5RTx7OS/Zlzy5+akHV7XjJ/U+Uw==
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:SJ0PR03MB6360.namprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230022)(4636009)(7916004)(396003)(136003)(366004)(376002)(346002)(39860400002)(451199015)(66556008)(186003)(6916009)(478600001)(33716001)(41300700001)(66946007)(66476007)(4326008)(2906002)(8676002)(82960400001)(83380400001)(38100700002)(6486002)(86362001)(316002)(5660300002)(9686003)(6512007)(6506007)(53546011)(8936002)(6666004)(26005)(85182001);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?MDhvMUY3VE16NnZiVEdVT0RtS00wcTQxQm9yZ3FpaHJXZGxORzZNdnZQcUk5?=
 =?utf-8?B?U3FwOUM3RlV5QUJJTEhTaThHQURGSkRzczNvREZBdFBaOGdraXFhSFBHbDZs?=
 =?utf-8?B?MmJoL1kwNnZHaUpoWDB6cUkzMG9Kb0JKZ3lVcnR4L3gvcHZZR2g1N0Z2TmNI?=
 =?utf-8?B?ZStjbE1sazdKdXloVk1HbVhYcUZrQzZaOGV2ekFSQ2pMLzl5bkpwNnVWbmdF?=
 =?utf-8?B?cU9SMEZMZGcvc05veERncUdaeHpjMDlmejVzRmE4bjJIaVMyb0tybEN1WkJ4?=
 =?utf-8?B?czFRUU8zWmlNYnYrN0dRQVByVjJ1MVM1Ri9QSmdkVUJWaHhUTDdhYXQxWXlw?=
 =?utf-8?B?L3FPMGxCa1FNc1hCQU82MWl6dTR3T0JrTlhZMHJjaGpyRHJOMXBKK3VZZEk1?=
 =?utf-8?B?YktxQVljbGl2SlQ0UEZpU2dLUTdqT1daZzhEWHdNWlNrcUhkR21CRmVnQUNS?=
 =?utf-8?B?dDRzNTlvMFI4N2tmMnVudFBwNzFFOFhuVk9nUktCR3c1VUlxcHR3Y3Iwbk93?=
 =?utf-8?B?cVd6UXlxTGtqSHA4YkRkK0xKZWh4Zkc3Vnh5YmxWRkNnV29yOVozQ3lpV0U5?=
 =?utf-8?B?dG8xMGg3eUU2NFRMZUZLK1R0YnZjb2RzWERHeWJRdWVJUXc3YXRmVHN3TUkx?=
 =?utf-8?B?ek02K0VDUWs2eWJYdld6dXRYYzBoUjd0WWhzZWJPL2ovRng3VytnV3g2VXRp?=
 =?utf-8?B?aTdkaDFhTElsZnBpK3dOdXB1b2ZjS1VXeWh5OVRxUG1ZMFRwVTVtUDBRWHN5?=
 =?utf-8?B?TWtQeXc0RHVaODROVVY1TDdCL2JESUgyNStCZkp5QjZTaXJkb29qRUhKQitX?=
 =?utf-8?B?Mll4REJuV01mR3F5cXFaclhiQWtYQytDRGdzM05CcTNmZlRNcDJaNzhtcUZX?=
 =?utf-8?B?QVBmOExzL0dFakxkRnFzOEFHQ1VPUWJybTZUaWE2b3hRYTdTMldaTWN3K2Uv?=
 =?utf-8?B?MGNlMEE4ZXZLeEVVNW16aE9uTDFWM1dFamljMUZKV0JFaWJ3NkhQV2JqVTNG?=
 =?utf-8?B?c1NXSVZJdGVzOG1PSldtOEQzeWpJbnVCdlRJUWZjREk5dlo4cUpBQjVNOTA4?=
 =?utf-8?B?WFg3NmZ6SEEyb1FLbGEwNWo0Ny9wTkE5TXhqM1FLR2N1UGhVK3MxbVdsU1pn?=
 =?utf-8?B?a2ZSR0NvSCtvUkRVcW9PREJBL3hVNHJHYVRrRTd5b24rWUFjL2dJMFFEYXJ2?=
 =?utf-8?B?bmxCMEFmS1YwR1lSZWpodzRPQjFaUm1NQlplMjAyUi9oMFcxQ0dRa1I2d0w0?=
 =?utf-8?B?YUVVYUMrSjc1YkVqWHozLzdhNS9sNEl5dXc4UEJiaUFNL0ZWYmprbyswYzFG?=
 =?utf-8?B?OG5Kc0psQ09jM29PdVdEUTBCWnVESGpURkJLWG5IQTFsbEMxbjdkZ2pRN29O?=
 =?utf-8?B?MFREWG1zOWhiRWxTa1RPbC9FYVljYUkxT1pkOHRqdlVLWmVlRFAraUtaNE5I?=
 =?utf-8?B?RlE5U05BczBNRVFwZzVtdnpkMHJIZGNaQkltY0VtWjZpRm9DcjlYanFGWGth?=
 =?utf-8?B?NTFZMjZTY2lHeldQTUttTmd4S0ZybElIVXJxSEpva2kyYjNJQ2RZVFZWTXY2?=
 =?utf-8?B?TGEvMTloYzQ3NGZ0VVlKR3pXSG5jNkg4LzBXdGVZVTRJZGdxRWVDOUFsTmlY?=
 =?utf-8?B?QVBQdk9icVZTdGZFRmUxMEUrQzJSS05yYmVlZmVSZ3lXT0dOSDI1SmlOQW5Y?=
 =?utf-8?B?QVY0K3RCQ1FPZ1FmeExWMzVrOVIwdndQWloySUU3eUtwTW5FNDBhbW5ndm9w?=
 =?utf-8?B?WnBaN0VuZXQ0ckhHb1M0eWV0UjRnSkJZYndtbytjd2JwaFBpVGxOZWNmUXIz?=
 =?utf-8?B?ak5nS0k5eEo0Uzh3eE1ZMDBOS3hRbENySG1xRS9tVWM0dUMyM2NhQU85c0pr?=
 =?utf-8?B?WG1iV0ljMmpQdFZlbkVBek5lSGtBQ2lleTEzRjJrVkFCWHo1Vk1nZkEzV2l1?=
 =?utf-8?B?MERGWGpJU0RkNHdNQUUvamdOVjJIRS9MVDhCV1haTDVncGhYMXdZWGpDbWhr?=
 =?utf-8?B?WHVRcDlFN2VjeXZjTVZ6QURQQ0wxZGdVVTNRcWhuOHlwNWE2RHk1MkVSY0ZN?=
 =?utf-8?B?Q213NDYrSjhDZ3FjVGNZVWNGN2V3cDRiK08rWmo3ZWt6NVhrcmUyNnp5Yyth?=
 =?utf-8?Q?jL+zICLjXAgN6GefmMKXdKrY2?=
X-OriginatorOrg: citrix.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 67b209ce-3b9c-43af-7277-08dab76b506e
X-MS-Exchange-CrossTenant-AuthSource: SJ0PR03MB6360.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 26 Oct 2022 16:01:16.7971
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 335836de-42ef-43a2-b145-348c2ee9ca5b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: u1uCGGqd3CJkRzkIjdwYK+5Ka0UyFI4Ybf5WOO7WBVBehCBYslxHidls4617TmH2IIi7FH5KL0JsTdbP5HWnQQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SJ0PR03MB6779

On Wed, Oct 26, 2022 at 04:06:40PM +0200, Jan Beulich wrote:
> On 26.10.2022 15:58, Roger Pau Monné wrote:
> > On Wed, Oct 26, 2022 at 02:47:43PM +0200, Jan Beulich wrote:
> >> On 25.10.2022 16:44, Roger Pau Monne wrote:
> >>> @@ -388,12 +391,12 @@ static void cf_check bar_write(
> >>>      else
> >>>          val &= PCI_BASE_ADDRESS_MEM_MASK;
> >>>  
> >>> -    if ( pci_conf_read16(pdev->sbdf, PCI_COMMAND) & PCI_COMMAND_MEMORY )
> >>> +    if ( bar->enabled )
> >>
> >> In 3 of the 4 cases you use header->bars_mapped as replacement. Since it's
> >> not clear to me why you don't here, could you explain this to me? (I'm
> >> therefore undecided whether this is merely a cosmetic [consistency] issue.)
> > 
> > No, it's intended to use bar->enabled here rather than
> > header->bars_mapped.
> > 
> > It's possible to have header->bars_mapped == true, but bar->enabled ==
> > false if memory decoding is enabled, but this BAR specifically has
> > failed to be mapped in the guest p2m, which means dom0 is safe to move
> > it for what Xen cares (ie: it won't mess with p2m mappings because
> > there are none for the BAR).
> > 
> > We could be more strict and use header->bars_mapped, but I don't think
> > there's a need for it.
> > 
> > What about adding a comment with:
> > 
> > /*
> >  * Xen only cares whether the BAR is mapped into the p2m, so allow BAR
> >  * writes as long as the BAR is not mapped into the p2m.
> >  */
> > 
> > Otherwise I can switch to using header->bars_mapped if you think
> > that's clearer.
> 
> It's not so much a matter of being clearer, but a matter of consistency:
> Why does the same consideration not apply in rom_write()? In fact both
> uses there are (already before the change) combined with further
> conditions (checking header->rom_enabled and new_enabled). If the
> inconsistency is on purpose (and perhaps necessary), I'd like to first
> understand why that is before deciding what to do about it. A comment
> like you suggest it _may_ be the route to go.

ROM register is more complex to handle, because the same register
that's used to store the address also contains the bit that can
trigger whether it's mapped into the guest p2m or not
(PCI_ROM_ADDRESS_ENABLE).  So ROM BAR writes with the ROM BAR mapped
and the PCI_ROM_ADDRESS_ENABLE bit also set in the to be written value
will be rejected, because we only allow to first disable the ROM and
then change the address (which is likely to not play well with OSes,
but so far I haven't been able to test ROM BAR register usage on PVH).

I do think for consistency it would be better to use rom->enabled in
the first conditional of rom_write() check, so it would be:

    if ( rom->enabled && new_enabled )
    {
        gprintk(XENLOG_WARNING,
                "%pp: ignored ROM BAR write while mapped\n",
                &pdev->sbdf);
        return;
    }

So that we also allow changing the address of ROM BARs even with
memory decoding and PCI_ROM_ADDRESS_ENABLE as long as the ROM BAR is
not mapped in the p2m.

Would you be fine with the comment in the previous email added and
rom_write() adjusted as suggested above?

Thanks, Roger.


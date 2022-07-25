Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 4F8AB57FEC4
	for <lists+xen-devel@lfdr.de>; Mon, 25 Jul 2022 14:08:42 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.374539.606596 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1oFwsc-0005r2-NG; Mon, 25 Jul 2022 12:08:10 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 374539.606596; Mon, 25 Jul 2022 12:08:10 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1oFwsc-0005oq-Ke; Mon, 25 Jul 2022 12:08:10 +0000
Received: by outflank-mailman (input) for mailman id 374539;
 Mon, 25 Jul 2022 12:08:09 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=0h6O=X6=suse.com=JBeulich@srs-se1.protection.inumbo.net>)
 id 1oFwsb-0005ok-CS
 for xen-devel@lists.xenproject.org; Mon, 25 Jul 2022 12:08:09 +0000
Received: from EUR04-HE1-obe.outbound.protection.outlook.com
 (mail-eopbgr70071.outbound.protection.outlook.com [40.107.7.71])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 71e5b0b9-0c12-11ed-924f-1f966e50362f;
 Mon, 25 Jul 2022 14:08:08 +0200 (CEST)
Received: from VE1PR04MB6560.eurprd04.prod.outlook.com (2603:10a6:803:122::25)
 by AM5PR0401MB2434.eurprd04.prod.outlook.com (2603:10a6:203:35::15)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5458.24; Mon, 25 Jul
 2022 12:08:06 +0000
Received: from VE1PR04MB6560.eurprd04.prod.outlook.com
 ([fe80::d4c4:d01d:5d39:920c]) by VE1PR04MB6560.eurprd04.prod.outlook.com
 ([fe80::d4c4:d01d:5d39:920c%7]) with mapi id 15.20.5458.019; Mon, 25 Jul 2022
 12:08:06 +0000
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
X-Inumbo-ID: 71e5b0b9-0c12-11ed-924f-1f966e50362f
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=HrYUGg7q9TqvhSLjZ5DhylvShSZj3FHnCyFwpeGu8i+fPVJLE2h1lk6vmcHZ+1Il5uTrrMxyQ/I1UsJlrlOhnlFqodzHpCB2b4DKATk8uQdTl6pMcW0aiJAngRYqgBupI+tg50H5g4OKQBtTmnZcYOQ82rScQiLcNB7QjR9aqgeuw3AKvvywtuSnkK2NEozkDJv/qNSHzwPAxlyWxZ6T95bNHzlvFKVnBjJcsLrloxApd8+dZrill4ts/5TpKcz+3tL2GUrsWwLc2XqgDggrhGmtgXEDgU+XXGy0Wlcim69aWZMsyXeRhf5VR7Re2nAiVeHVkyuXlh5EeiDex8m+Og==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=ix3T/GyDlyNaCXGu9Au09uHqaznqPh8szhyrUBKwsA4=;
 b=OKaM7xXvlagmLVtTBTRmLgPY2ygglmpKTg6lWCt3PFG0E44RnMYCOMdghYfE28cUyQXnZ6t6sIVvyqKGM/s25JUfoKZc3KX5Gbtb6jLgFUUaHLFt4hxuKVmlXCf4AiMOe+NCk0etQ7iguuKfaKVqmDgN2S8igPk0BnEXhAhcZLPpf3kg+vU4pzvLS/RBQf99MPEUUTRb0PeZwSc/AIa1zg6prXM1Pn/eoQbhMNpwUkEFeZcLDt/x3fHxxOSLfrZwNsEQ6AN9mWDK6UO31TkI6SM2bFtnN6L1K8ZumJwn4OBvfuSKKQwquNnHr99UAg6S9mveQzyoF6VqjOH/hsqUhQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=suse.com; dmarc=pass action=none header.from=suse.com;
 dkim=pass header.d=suse.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=ix3T/GyDlyNaCXGu9Au09uHqaznqPh8szhyrUBKwsA4=;
 b=hiJfykQ53zpqsjD5cUf1ubWTEYt3yocURM9yy9pXAgMyEI7M28s26YQ/UEpL6nzWOFYtuXLHQjv8gb873xVCM+tOdYAAlmX6dRvWJcX6ZjzXQYonmLoAgDT+qptZ2eanil58EazRYDoG/amNE/Fy0JmXLdpKFbsaesHEHQOdpCm7H8tZ1smszfc8m8FqschOB40Pa99mGA0gb1BOrSRLjxzlY5oDLKvVdWp7eU6xPEGYG9AhpSR6PknvSSO+1uXsFH1abeDCQWgGxTSMHNMKXixll/bpxhl3hnFMV03FuFk0ji7UVCjwJ3yLnLNcGt9wqp6tcx4EKHx2/H9HBq0IJw==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=suse.com;
Message-ID: <15c8b790-f6a6-42e6-d244-8f7d83c880b2@suse.com>
Date: Mon, 25 Jul 2022 14:08:04 +0200
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:91.0) Gecko/20100101
 Thunderbird/91.11.0
Content-Language: en-US
To: "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>
Cc: Andrew Cooper <andrew.cooper3@citrix.com>,
 George Dunlap <george.dunlap@citrix.com>, Julien Grall <julien@xen.org>,
 Stefano Stabellini <sstabellini@kernel.org>, Wei Liu <wl@xen.org>,
 Anthony Perard <anthony.perard@citrix.com>
From: Jan Beulich <jbeulich@suse.com>
Subject: [PATCH] include: correct re-building conditions around
 hypercall-defs.h
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: AS9P250CA0014.EURP250.PROD.OUTLOOK.COM
 (2603:10a6:20b:532::15) To VE1PR04MB6560.eurprd04.prod.outlook.com
 (2603:10a6:803:122::25)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 63baa11a-18c8-4cc7-dbc4-08da6e3654ea
X-MS-TrafficTypeDiagnostic: AM5PR0401MB2434:EE_
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	NogFDpj0+S0BOuhLKaBeJ2jqf/+ZchVrjNQmftcBCJMVsBQD9Q+9wz6Ni1YD/5vu/6uzYkX8Nqqm4eUavCHbOn5hJS9tpJdJuQwUsKWKIDHUl607IcbSfWKMpfuJXpDyL4qX5PcC4+qoO/ErjBc79JNiAyITtHtsJTbbkYALuQafjjYX/BWt/pQIEoLe7W9epxbmTS5T3A6QJqWImtFnAwRzRKCcHdulc6a8nSlaSqdMVt0D1DAz9NC9y5aZzKp/KNVVTtNkgW3OLYgJ68FqanZGBYfhvTaTJkfTDeAC4uiPwK6fpiQ2pzVjaUC3BRlxocI9b4m0418d2cd0ZJayt/2o0BDBHLvnUkc657XW8VNJbB2o2ifbbi82oq9T7hE0Z0pasSowCQNIA7z1lfxIT2Tk15lrcG+J6rvI5MFqYEwBmkBmldPyzDe60W3OBSnKpHzs4pa6AOuSb5P3sJwXfr+Dr0gSZbASgZLe8nRwaInjxjwOfywPsmrEQx+/Q1J1ORbxpEmU6goHYQ+4IwNteU4+brers2Mm+SzQzLGpzeVLkDB3FQjt3yt2aGkB9eJ8tyrJwiA2OpC5yErfPOC+kOf6vV9vApA0k6ZgQ/iE/de79tJESEvL/hBkWQht7iGeOTqzbTj94Vb5RWsE0bKYlI2yoPAzVVdIQ3pXOaY8QNRMcu74ABVHcC6DbrmLSKWv6zN+fVBNL3D8h5QEsaMJjxUqQLiRrPc06PaoZSGpSI+iO5atWZ1WCtge/aS08fAxgxB9Z1ZbLS412d17NbwTzra8+DeUFw6SFb+NHJu+K2lf9VatW+JRtHtgkTzmOYNYLFlsKTmQO+TApMJ8k+m8uA==
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:VE1PR04MB6560.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230016)(396003)(366004)(39860400002)(346002)(376002)(136003)(186003)(36756003)(2616005)(66946007)(54906003)(6916009)(66556008)(4326008)(6506007)(8676002)(31686004)(66476007)(6512007)(41300700001)(26005)(2906002)(38100700002)(31696002)(86362001)(5660300002)(4744005)(8936002)(316002)(6486002)(478600001)(43740500002)(45980500001);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?aXB6clNGK1ZGbzJ1U0JMQThoM05ueS9NQ2lWbjlWYklWdkNBYUxEZ3R2eFp3?=
 =?utf-8?B?TzkwamxBNUgyTWZoMXY1Z2c0TnUrSHFTZUNhWmEyZUNxOUpiajVNZEJDNnZF?=
 =?utf-8?B?OG94YW0ydEhQbDFldjNhaE5idG4wUWlyRm94WlFIWHVYTm95ekZWQ2VVV1Zu?=
 =?utf-8?B?NUR4WDBlMlN5dER4QnlNTVlzZWxEUWk4VUx6eHJ6NWdraXRScmJ0L0lRVWpm?=
 =?utf-8?B?MXFEaFJnV2pzZ00vZkdlK08vNlNrRmJRQm9sZ2NScktpTDVkcktoMHI4MGNE?=
 =?utf-8?B?aTRxQzRqVWJJMG1JaFU1UFhKQTc1dm5xUWx3Q0ZvVXJiaVR2WWdoaHphN05R?=
 =?utf-8?B?Q2xNVGdpVGxQUG5kTEZUV0EzNTJPY0Q1MXZYb3VpY0FidjVmWmpJYzRwV1hr?=
 =?utf-8?B?aUdyNjdZV0VxTW80eFl2bm9Ma0MxSjJyNzE0Vm1RMnZlZVNEVEVoREtxdkh1?=
 =?utf-8?B?MHRVREFTSXBPTHRvK0k1V3RhelZXU3AzaGtBTTF6Zm1ETTNsdnd2SFpPYXJK?=
 =?utf-8?B?ZEFhaVIvMEZQaE9JUEdUeDUvY2d6VVFPVHlEUHJCNTFEMVlOdHhTZDdRLzB1?=
 =?utf-8?B?NkhHdjQrVWJlZnVQWjlwQjhrMGczOUpVUEFId0thT0JIYy84M2NMOEJGYm9I?=
 =?utf-8?B?RnlTV1RnR3JISnZJUWxRS2RONkN3NTZEUlFRS1NqdHB0TktpNHY3eUVadXF4?=
 =?utf-8?B?RG1GNjE0azh5cmxFYVNjb1QyQ2pEanJTRC8vdldBcjIrWVBJbXdlMGw4a2s5?=
 =?utf-8?B?NHpOM2pmZExxNjBlU25LbU51WWRkK00vMUNqOXd1Q1lYa2hDa3g2WVc3bmU1?=
 =?utf-8?B?MkRCTUIwMm1yRGpDTUZhSFU1WE9BZ3ZraXdkaUdxeis5VG1xM1l1MGEyUCtO?=
 =?utf-8?B?M2VnREl3VjdGWEZpTXpnWCtva2M1eEVqaHkrbyszRUtXL1Njby9NNk1uaWgr?=
 =?utf-8?B?QkxmaU5adCsrZ09IUDhtM1g0MkpINmQ0N2I1WVJsL3NLKysrbjF5UDRVYURa?=
 =?utf-8?B?UG9Bb3hXRGVRTkZPY1JLUmk0R1NlY1M3bjNOalNzOVBXOENBa3dOdi9rdlFC?=
 =?utf-8?B?VzIvWVR0TFp5ME50WWM2a01GOXF5ZDltenN1cTQ1eXJmcUdMY0RZQW15cjdC?=
 =?utf-8?B?QnMyWktEU2wrNE53ZmpsbWJ3azNocnZLdlVjYkJuaEdyQ3B1V1JLVjllWHN3?=
 =?utf-8?B?anAzTjM3SGgwT000YWJyY1M4NlNrMXFyVkZtZGZveDdxYnVTcVpKVll0SUc2?=
 =?utf-8?B?VGo4K2pMU2prNG5HTEhRaS9hVDdKK1ZsUnlTK1BENmVCL0dKS0U1VHY0RStO?=
 =?utf-8?B?OVluK3krUTljbzBBcnFrL1BDSVVQY0ZOV05HRXo3ZjBtQ0duQnVhemsveXJQ?=
 =?utf-8?B?enE3QVFrMCtmRlZwaEdwbDc2NCs4aEN6YTc1b29QcDIzVWtySG1uWGhDc1lE?=
 =?utf-8?B?NVdPSnYxT3o2ejA1TUNXd2RhWjgrMUVXSzBlSTZWVVlBY2ErUW9OMWpMUXk3?=
 =?utf-8?B?eWQzY2pFcHhlOW5vaTljT0xkdkRydWVpZWVGWGtxbjVDa1ZaeElUbER3aEc1?=
 =?utf-8?B?c3dpKzcxUHJqWmtUUE1HbE5OcTRCNmE1NUVqYkxibERNRUtpM0RCZjQxSHRT?=
 =?utf-8?B?cFVqeTRjNFd6b3FZMmRuK1BYYVhMUVFhVi9mdW1ScWRQODhIYnFJVEJUdUFo?=
 =?utf-8?B?Si9KY2dibXlIOFdmcEFwNmhFYmdNMFROVzd3N2lKOTZHT3ZjYjMrSWxZUkZm?=
 =?utf-8?B?d2FhS3Zuc2hFUGNoWWR3eDhubEdwZGlPTElZMFcyQ00yeStJOThWM01XWnFY?=
 =?utf-8?B?bFBYZFM2aFZOdHdFV0M2VmJZaTFKQjhFQWNsVDZFeWthSE5LdU5YNTM1NUsx?=
 =?utf-8?B?alVQT3UwSmNRdE5CUjFDSVp0Uk9MME1WTmROc3Y0VktSbE5tT0dnU3I3WS9R?=
 =?utf-8?B?V1N6bUJTc0RCUzFBTlhGcjkrTThjcjhCdTcwbC9iYXpTZ0grRnZpc2I2cVRX?=
 =?utf-8?B?eWphbk51Nk81VEc0b1NDQ2ZPRmhTd1dxbkhsVnl6MjBkckFOcjBPdnlqZU1o?=
 =?utf-8?B?KzRJVlYrcFN6NE1IYTZka2tFTytBRE1VaE5qdmhhRVhsNFA0ZXMxS0NsNkJE?=
 =?utf-8?Q?/K5kQYeP6Kxy+aQZawR7EdMjQ?=
X-OriginatorOrg: suse.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 63baa11a-18c8-4cc7-dbc4-08da6e3654ea
X-MS-Exchange-CrossTenant-AuthSource: VE1PR04MB6560.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 25 Jul 2022 12:08:05.9407
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: f7a17af6-1c5c-4a36-aa8b-f5be247aa4ba
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: u4OzKQzkzRkD2F/xP/fHOJVS8br+XSn8yM1VX1m3tCg2NcSGXnX2ajYL6mhLhzAML6Ci21WPeBOBhgMtuRCC8Q==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM5PR0401MB2434

For a .cmd file to be picked up, the respective target needs to be
listed in $(targets). This wasn't the case for hypercall-defs.i, leading
to permanent re-building even on an entirely unchanged tree (because of
the command apparently having changed).

Fixes: eca1f00d0227 ("xen: generate hypercall interface related code")
Signed-off-by: Jan Beulich <jbeulich@suse.com>

--- a/xen/include/Makefile
+++ b/xen/include/Makefile
@@ -114,7 +114,7 @@ all: $(obj)/xen/hypercall-defs.h
 $(obj)/xen/hypercall-defs.h: $(obj)/hypercall-defs.i $(srctree)/scripts/gen_hypercall.awk FORCE
 	$(call if_changed,genhyp)
 
-targets += xen/hypercall-defs.h
+targets += hypercall-defs.i xen/hypercall-defs.h
 
 ifeq ($(XEN_TARGET_ARCH),$(XEN_COMPILE_ARCH))
 


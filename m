Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 4B963402855
	for <lists+xen-devel@lfdr.de>; Tue,  7 Sep 2021 14:17:30 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.180980.327913 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1mNa2S-0004gf-MK; Tue, 07 Sep 2021 12:17:20 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 180980.327913; Tue, 07 Sep 2021 12:17:20 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1mNa2S-0004eg-IY; Tue, 07 Sep 2021 12:17:20 +0000
Received: by outflank-mailman (input) for mailman id 180980;
 Tue, 07 Sep 2021 12:17:18 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=GyZL=N5=suse.com=jbeulich@srs-us1.protection.inumbo.net>)
 id 1mNa2Q-0004eE-KV
 for xen-devel@lists.xenproject.org; Tue, 07 Sep 2021 12:17:18 +0000
Received: from de-smtp-delivery-102.mimecast.com (unknown [194.104.109.102])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id 9d943efb-468f-41e2-b01a-a931ddafbd61;
 Tue, 07 Sep 2021 12:17:17 +0000 (UTC)
Received: from EUR03-AM5-obe.outbound.protection.outlook.com
 (mail-am5eur03lp2059.outbound.protection.outlook.com [104.47.8.59]) (Using
 TLS) by relay.mimecast.com with ESMTP id de-mta-5-ynG92t5GMuyY6Ok5QxIYCQ-1;
 Tue, 07 Sep 2021 14:17:16 +0200
Received: from VI1PR04MB5600.eurprd04.prod.outlook.com (2603:10a6:803:e7::16)
 by VI1PR04MB5167.eurprd04.prod.outlook.com (2603:10a6:803:5b::16)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4478.24; Tue, 7 Sep
 2021 12:17:14 +0000
Received: from VI1PR04MB5600.eurprd04.prod.outlook.com
 ([fe80::4d37:ec64:4e90:b16b]) by VI1PR04MB5600.eurprd04.prod.outlook.com
 ([fe80::4d37:ec64:4e90:b16b%7]) with mapi id 15.20.4500.014; Tue, 7 Sep 2021
 12:17:14 +0000
Received: from [10.156.60.236] (37.24.206.209) by
 FRYP281CA0016.DEUP281.PROD.OUTLOOK.COM (2603:10a6:d10::26) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.4500.4 via Frontend Transport; Tue, 7 Sep 2021 12:17:14 +0000
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
X-Inumbo-ID: 9d943efb-468f-41e2-b01a-a931ddafbd61
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=mimecast20200619;
	t=1631017037;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding;
	bh=3ipn8V6nm60M68/u9CKRAsm4Z70Kt+Rd/n32FD4uhi8=;
	b=PQvM20lBak2oM9lxT10OCWEacoyR54yuXM/tBcOUzxZ717k4qixkoyeL692Fohr/yVhufJ
	GnVksV4pyRmEGHEvShpeDX2eAEuKOEJll2R9GY1cMRHBAutP3M1dg0aRHDKv2KrZxF+Gkj
	hV0G1XnG7aYHnKeOae7oXem9CL4DpXQ=
X-MC-Unique: ynG92t5GMuyY6Ok5QxIYCQ-1
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=k2/D0YK4Piymd4IYGSPPnaSuBPsLXM4g+bpydY5WVRFwRZTCR7LHm+1p2LylvxoaxlGKNwYyZn0z+MUI94e01r4pe90eRfBnKILaf3PQW8MRk3cYqhJTyRvv5ormM6lKP6AzXzBDl3RIt1BlEtvA8miVylPzFbttD/ammt1the9WOVCsz6KV/upY39/vvi7TYNPXQnmyGMtee3lGX1qKfOXQIk6ZdEZNDaLT3oTk81X+GeTVYGQzEGlD53+rOWN43kxhYnvLmDn5KGgL9UppBPL54ff7UFVk6IfodGUmL3xb/EniU93Cc5oo6cHrHcy4Tvgh92r/J0xhIHMzME3pog==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901; h=From:Date:Subject:Message-ID:Content-Type:MIME-Version;
 bh=3ipn8V6nm60M68/u9CKRAsm4Z70Kt+Rd/n32FD4uhi8=;
 b=eJ2mb8DH+0p3F8SOxYXO5OJwCi4WWiSAEA6T3NdLKtnNOIzjFJ+1PQbZ96IWhUNWUHQrQTyzngeb5cflatDgoGXuptwj+kzwN2OzAhGtGG+vWIK4dYqtmEkmSwYZt6lkOCu3KRap8P8RoWvYUhkO7mC2pkSjaLvbJQndDlPsxX3Qhf33Nj3Yph2uOXKr2dm0QUDRw7xOigl5EooQH5Zl0bodEfiJ/zyJHeeU1b1wgSi/UXOf1d0UrObSQj0n8EHGTBb1P4veeedQ/6VdKMgt5Fs9ZrVdMtnUCjXG5Hu1cR9HfZh8h1BZ2L5mCg1TDd7vDpXL5wNiay9/w8E2LZV9+A==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=suse.com; dmarc=pass action=none header.from=suse.com;
 dkim=pass header.d=suse.com; arc=none
Authentication-Results: lists.xenproject.org; dkim=none (message not signed)
 header.d=none;lists.xenproject.org; dmarc=none action=none
 header.from=suse.com;
To: Juergen Gross <jgross@suse.com>,
 Boris Ostrovsky <boris.ostrovsky@oracle.com>
Cc: Stefano Stabellini <sstabellini@kernel.org>,
 lkml <linux-kernel@vger.kernel.org>,
 "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>
From: Jan Beulich <jbeulich@suse.com>
Subject: [PATCH] xen/pvcalls: backend can be a module
Message-ID: <54a6070c-92bb-36a3-2fc0-de9ccca438c5@suse.com>
Date: Tue, 7 Sep 2021 14:17:13 +0200
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:78.0) Gecko/20100101
 Thunderbird/78.13.0
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: FRYP281CA0016.DEUP281.PROD.OUTLOOK.COM (2603:10a6:d10::26)
 To VI1PR04MB5600.eurprd04.prod.outlook.com (2603:10a6:803:e7::16)
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: c6d24a79-3689-461a-4955-08d971f96d81
X-MS-TrafficTypeDiagnostic: VI1PR04MB5167:
X-LD-Processed: f7a17af6-1c5c-4a36-aa8b-f5be247aa4ba,ExtFwd
X-MS-Exchange-Transport-Forked: True
X-Microsoft-Antispam-PRVS:
	<VI1PR04MB5167FB5D9536B52FA3A8EFBCB3D39@VI1PR04MB5167.eurprd04.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:6108;
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	dKXCZSWhcx7GZDxjf8ctU81O3byUk595YyebVbpiEYxN2DQ/8P8TgUfZfWTLZVAAN1y9cXdW2spc0dLLDGIQE+9lY1RfBAtLeFK6mySywXuBXe34XQvnHmLZLvVGWv09c11npTA6XBrfsdwxVGE56OCANEE4O4s/WyGy8vJC0oiJOtkhcRnzr4vQLdgijsgKDrwxcrqZWiuDYTU8mnQr7/W8WRElBIxBAMtFSwJlKpki04x7Wi2QGOdCbSP+9iwkeX12u+hMdQfLccW66R6QFy3B9ickxSesa7pCNtWItDK7cX4FKWMR0o5vJrlXz+J4Z7VZhsyaz8xB+UNi1e7FuZqWmixsZG9rDag8uEApRlzjR7QF3EpMMe3c/P697CK5Ulx3lGEHStmPdLzzXfWAtDYyl4y7ezL9RlNYVgvOQoqunvtvQgbFQyIZV93JaOcIwlwscPSQM8Od5AdnonpXSMzQCNU6YFuOrEOhzjhCVHLEo4J/v9bADlzo7zTEDQYAkbBN0qV0eWXycDCNFONEnFvaCjLd727+VL+FzG5cY/KDvqLDTdUW1yGTXx7oibePhGmplrjAKBnoTj9HrTHXHPEiVv/F/tbrFl4TSpRk26i7gL+fVtyoCMnKJaKwPNYZ/OH5qb/FEYqZzZzDBQg2x+3jPTH3Qlo9taKxtti4wMaa5Bz/wRwm2aEnSl4AdtYGCNiaRhmRSFiqWZ5XlRyhuMcdLe2TxgfFK+ufUf769EU=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:VI1PR04MB5600.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(366004)(6486002)(4744005)(66946007)(36756003)(26005)(186003)(31686004)(31696002)(8936002)(86362001)(2616005)(956004)(8676002)(5660300002)(110136005)(66476007)(66556008)(508600001)(16576012)(2906002)(38100700002)(316002)(4326008)(54906003)(43740500002)(45980500001);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?QzdMNjFBMHY2UzdqbmNuaXJEYXdMUzhXRk42ajBPYTV4cG9CUmlYTTRmNkVu?=
 =?utf-8?B?WlRSaWtIK3hDZFV0WWxhMjI3YWpiampzZ25NTUpCdmI5RndsUTJ6VENJMkE4?=
 =?utf-8?B?bzhqWlh5WHB6SDY4UkFYbXkvemxUQ3JKV2ttK1ZPOG4vN05rem1KaERVNk1x?=
 =?utf-8?B?RHdDYjczTk1TRk50UHZrTVFBT2NuMWZwS0k2WXV5ZzBsOUQ5T3ZLbnBiWExv?=
 =?utf-8?B?Wi90d241cFJydnNYbXEvNWxEMW12bmlYS0VBUVZhOEhTK0d0TzZ2NFEvN3hn?=
 =?utf-8?B?TTRxUHJuVFBpZzUrMkw2dkp1YzBZb3BPOUVISmNjcVFvTjFmTjBIUlJ2cEdq?=
 =?utf-8?B?d0RZS1dDajlUYlFQaThFTTVUKzB3bytzM1J5M1RIaldTeVBGZFprTTN2NlZ4?=
 =?utf-8?B?cW1IcGxtK1ZGZjhsSFUyek5yUiszampBaW5KaTAvTjJGcGsrYzlkdDA3c2cy?=
 =?utf-8?B?T2t5b1dxQ3pUbWdqSm1QMVdBbVdkZXZFTTB6UFZuaDBPVmM4dGluSlVrYmpw?=
 =?utf-8?B?OTVKV3EzdlhFcko0UW5hNkpjZnhKeXZMcEVKTnBCdG53bFUwYW1YV2sxWWNP?=
 =?utf-8?B?aC8zcGIrT0N2cldZSHJ4bzhZRDV5R3p3V1Q4TnY0aVZoNlJKZlg1bHg2cS9F?=
 =?utf-8?B?SElpMHlqVVlEVFpXNnlwOUxnVjJENmdDYmJNRFYrRDdYdEU0Q1BEMWNtUzVT?=
 =?utf-8?B?bUdQVi9FZlVycTJianpBbjE3YkxZeEJvV2pPZThBYXJGSjI5bTlGZ2lJRlgr?=
 =?utf-8?B?ZFFCaXhEUWx2VXQrL1NkL3NpOFREZkJmVkNUQnRCMTc3eDdXWmdFRmdoL0ht?=
 =?utf-8?B?a2tkU2RhS3cvVERxRTVEQ1JIUStmMlE1cDJNNVZpQ1BaUW9WQndvNU1TdHE0?=
 =?utf-8?B?cTA2UlkxbG1jSkt5alh4NFhRdnRGa2U1QVAyakNudlZWT0VzTWdBQ2VIanFC?=
 =?utf-8?B?bGhtakgwMzQvbXRtbHFRTGZDYW5zdHl4OXdiU2xMMTBjZHRVTm9BZGRpbjI2?=
 =?utf-8?B?UVpVOG9pcFQ4VDhRQzN5bzdqU2JQcXAxelFEVkJQYkNIeW90SzE2VDJFSEsr?=
 =?utf-8?B?bGExS01DV3FZR1Q1Mll0UWtwSFR0SXpvVld4enhZSTVvVUFSWGRIQ0Jlc1V1?=
 =?utf-8?B?RS9ZUWtOVmFTR0NhQlhkcTl3NHNqbThoQ2RVcTRSSm5MZGMzb1drc0MwZ2tT?=
 =?utf-8?B?d1JPMlRRU1N6S1hNSTB5ZHArNkxWUEhEdHJNcGVKQjJ0dHorTFhpbXh5WXpO?=
 =?utf-8?B?TVFGdWxzc3llZEhMYkRlZkJINHVXSzBPR1I5RGZZa1cwT2hxVG9UME4xQkF4?=
 =?utf-8?B?RjhLZ2NrWDFVZ0dDYWRWSjloSnpWTWlTT2EzZ0w1cTBxaXBxZkVVcTZnZ0hy?=
 =?utf-8?B?Mk5QemF1aVJvMkZ4UGhrQjRodUJiWm90cU1MK213WUJsNnhsVGphNUpYZG12?=
 =?utf-8?B?RUVVMjlUS05qNi9BU3Z3b3c5K3hMcEIreG1rcG9YUE9CTTFDUGE1eWZWb1Fn?=
 =?utf-8?B?NmlwOVptYmw0VTVJZE5oZHJjSkhwYWZHdTB6QWQvOStQUE1WSzNpTk9NV293?=
 =?utf-8?B?TVB0ZktSaE5vcEZEaWxRN0dTaHUyT3l0SUNLTCtrV3BJSFFZa0orZmFiWC91?=
 =?utf-8?B?YXVyYVpLdWxrUVl6dmJpYVpCNEhIdVlMaE1MNUxUVGV5NnF4S0xkWldrODgw?=
 =?utf-8?B?bVR1QWRtbDVybjlGTVl3NkRFcXdMUU1ZNlozc2dWb2Q2Q3pvZ3ZkWkFNMzVT?=
 =?utf-8?Q?dDqB7Jp0rT2zc2ec6e7OtK5PloxE22JlaUo06mW?=
X-OriginatorOrg: suse.com
X-MS-Exchange-CrossTenant-Network-Message-Id: c6d24a79-3689-461a-4955-08d971f96d81
X-MS-Exchange-CrossTenant-AuthSource: VI1PR04MB5600.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 07 Sep 2021 12:17:14.8640
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: f7a17af6-1c5c-4a36-aa8b-f5be247aa4ba
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: qyYhDfgmVp5Amf3Ybl/g+1qZhBdykNGIiV3Ow3rZUsg7gAAXf4azQIB58EM4UtJrKMb8vmd0isW+P+BgiFTVuQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: VI1PR04MB5167

It's not clear to me why only the frontend has been tristate. Switch the
backend to be, too.

Signed-off-by: Jan Beulich <jbeulich@suse.com>

--- a/drivers/xen/Kconfig
+++ b/drivers/xen/Kconfig
@@ -214,7 +214,7 @@ config XEN_PVCALLS_FRONTEND
 	  implements them.
 
 config XEN_PVCALLS_BACKEND
-	bool "XEN PV Calls backend driver"
+	tristate "XEN PV Calls backend driver"
 	depends on INET && XEN && XEN_BACKEND
 	help
 	  Experimental backend for the Xen PV Calls protocol



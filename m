Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 840295EA862
	for <lists+xen-devel@lfdr.de>; Mon, 26 Sep 2022 16:28:21 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.411887.654998 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1ocp5T-0000So-CB; Mon, 26 Sep 2022 14:27:59 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 411887.654998; Mon, 26 Sep 2022 14:27:59 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1ocp5T-0000Pw-91; Mon, 26 Sep 2022 14:27:59 +0000
Received: by outflank-mailman (input) for mailman id 411887;
 Mon, 26 Sep 2022 14:27:57 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=s/Db=Z5=citrix.com=prvs=261f3fdbd=roger.pau@srs-se1.protection.inumbo.net>)
 id 1ocp5Q-0000Pn-NO
 for xen-devel@lists.xenproject.org; Mon, 26 Sep 2022 14:27:57 +0000
Received: from esa4.hc3370-68.iphmx.com (esa4.hc3370-68.iphmx.com
 [216.71.155.144]) by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 67c56b90-3da7-11ed-9374-c1cf23e5d27e;
 Mon, 26 Sep 2022 16:27:54 +0200 (CEST)
Received: from mail-dm6nam12lp2173.outbound.protection.outlook.com (HELO
 NAM12-DM6-obe.outbound.protection.outlook.com) ([104.47.59.173])
 by ob1.hc3370-68.iphmx.com with ESMTP/TLS/ECDHE-RSA-AES128-GCM-SHA256;
 26 Sep 2022 10:27:36 -0400
Received: from SJ0PR03MB6360.namprd03.prod.outlook.com (2603:10b6:a03:395::11)
 by MW4PR03MB6569.namprd03.prod.outlook.com (2603:10b6:303:128::9)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5654.25; Mon, 26 Sep
 2022 14:27:34 +0000
Received: from SJ0PR03MB6360.namprd03.prod.outlook.com
 ([fe80::861e:b46c:1acc:c576]) by SJ0PR03MB6360.namprd03.prod.outlook.com
 ([fe80::861e:b46c:1acc:c576%5]) with mapi id 15.20.5654.026; Mon, 26 Sep 2022
 14:27:33 +0000
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
X-Inumbo-ID: 67c56b90-3da7-11ed-9374-c1cf23e5d27e
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=citrix.com; s=securemail; t=1664202474;
  h=date:from:to:cc:subject:message-id:references:
   content-transfer-encoding:in-reply-to:mime-version;
  bh=R3HmAR1G2vcQLnFWdrPAU6rV4hgv/5JeajMddG/RiAw=;
  b=EeOudmmmN37sQzbDXhZNcpAe6Wq+/Lolqrlyss+C9mbZpZtm4IAfb3na
   2u1saBtFLlBgWsLJ4TeJ3vTbXYjXLKfn+d+cL3GMznCb5ADJiEzMfsLRf
   tcUeuOdiFOI50k9pATuwDOz/GGQm2je9yuOeDRGJDIzxFQV3czXmXbj5A
   Q=;
X-IronPort-RemoteIP: 104.47.59.173
X-IronPort-MID: 83871695
X-IronPort-Reputation: None
X-IronPort-Listener: OutboundMail
X-IronPort-SenderGroup: RELAY_O365
X-IronPort-MailFlowPolicy: $RELAYED
IronPort-Data: A9a23:qn7p16qEIsgjQ/sszxg3otznbuJeBmLbZBIvgKrLsJaIsI4StFCzt
 garIBmPM/iNY2Skc49+O423/RkBsJSHmtBhTQVk+CtmFn4XpJuZCYyVIHmrMnLJJKUvbq7GA
 +byyDXkBJppJpMJjk71atANlVEliefSAOKU5NfsYkhZXRVjRDoqlSVtkus4hp8AqdWiCkaGt
 MiaT/f3YTdJ4BYpdDNPg06/gEk35q6q6WlG5gVWic1j5zcyqVFEVPrzGonpR5fIatE8NvK3Q
 e/F0Ia48gvxl/v6Ior4+lpTWhRiro/6ZWBiuFIPM0SRqkEqShgJ+rQ6LJIhhXJ/0F1lqTzTJ
 OJl7vRcQS9xVkHFdX90vxNwS0mSNoUekFPLzOTWXWV+ACQqflO1q8iCAn3aMqVfo+grO1xO/
 MUGB2wCVhmai+yEyaq0H7wEasQLdKEHPas5k1Q5l3T1KKhjRprOBaLX+dVfwTE8wNhUGurTb
 NYYbjwpawncZxpIOREcD5dWcOWA3yGjNWEH7g/E4/NouAA/zyQouFTpGMDSddGQA91cg26Tp
 37c/nS/CRYfXDCa4Wreoi312L6S9c/9cKADSqGd9KRSuwyS6G1LAz8EW16GuObs3yZSXPoac
 ST44BEGr6I/6UiqRdnVRACjrTiPuRt0c9hNFas84QKEyKvR6i6YAHQJSnhKb9lOnMw7Wz0sk
 EOIltXBBDpzvbnTQnWYnp+LqRuiNC5TKnUNDQcUQA1A79T9rYUbihPUUs0lAKOzlsfyGzz73
 3aNtidWulkIpcsC1qH+8VWZhTup/8LNVlRsuV6RWX+55ARkYoLjf5av9VXQ8fdHKsCeU0WFu
 38H3cOZ6YjiEK2wqcBEe81VdJnB2hpPGGSD6bKzN/HNLwiQxkM=
IronPort-HdrOrdr: A9a23:cbMKsqzzAEVBzLMfVPBlKrPxvuskLtp133Aq2lEZdPULSKGlfp
 GV9sjziyWetN9wYh4dcB67Scy9qFfnhOZICO4qTMyftWjdyRKVxeRZgbcKrAeBJ8STzJ8/6U
 4kSdkFNDSSNykEsS+Z2njeLz9I+rDunsGVbKXlvhFQpGlRGt1dBmxCe2Km+yNNNWt77c1TLu
 vg2iMLnUvoRZxRBf7LdUUtbqzmnZnmhZjmaRkJC1oO7xSPtyqh7PrfHwKD1hkTfjtTyfN6mF
 K12DDR1+GGibWW2xXc32jc49B/n8bg8MJKAIiphtIOIjvhpw60bMBKWqGEvhoyvOazgWxa2O
 XkklMFBYBe+nnRdma6rV/E3BTh6i8n7zvYxVqRkRLY0LjEbQN/L/AEqZNScxPf5UZllsp7yr
 h302WQsIcSJQ/cnQzmjuK4GC1Cpw6Rmz4PgOQTh3tQXc81c7lKt7ES+0tTDdMpAD/60oY6C+
 NjZfusqMq+SWnqLkwxg1MfgOBFBh8Ib1S7qwk5y4GoOgFt7T5EJxBy/r1cop8CnKhNPqWsqd
 60d5iAr4s+PvP+XZgNetvpfvHHe1AlYSi8R156cm6XYp0vCjbql6PdxokTyaWDRKEopaFC6q
 gpFmko/1IPRw==
X-IronPort-AV: E=Sophos;i="5.93,346,1654574400"; 
   d="scan'208";a="83871695"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=dembMj2+1gE7zS+lYqAcJcNQefhMLdxXXXKDN88j8pSoN/vtR6DS3pDSrVVkN4azsuF7WDVGnkKTtkGkJGefHdhBtXLVLRARkeiw2hFT37+bsbcckhMFizrXbhO0/PombaZGSdJ0if3gC66wTxOtTdWnBR1lyXX9RchSV6++TqgShPoFbilIzFkC1vZh+MIRvwGHzKhqyPABBPL+mmkew7+AKD9WDV32dg75vvsxUFOWbG7fuPqQT7YxuBcHoE4S46fHbom3hMdHJVAmbNqw5bwxrO6a0ou6QYniC2bufTSJYEfRTs5LC9lgoB8K1nXGszqodXFmhKj0+x4Xh5SgVQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=RU0sTQncLwtSnqNm1sz3NZyzrxReA0bmFTj0hr0dDr8=;
 b=IpfvToORarrBJchbDGgqVYYiNWFlrmmkCm8pt+U3GUD7hkrZb+revbkfNMF9MVdBrJylsYt/PZkBfz8pYYmqaoZfq2FVKcZG2guhYSFJ8rriiAssGePx+j2aCFOpwcYBX7Hvgj1KMyeIR0hxtYYPkhd423gnGG3DNsZsGT/DuZdkPlY+hquMZXXmcJiOsnVLMKr8YJmRMds4sOK7zi7pX0EWJ3TCvmvUL51E+xoumy56OovgZ90NFb/EWvIQNSFZ2yHRJkP6rbf6HvsnxY9uZnkbJIjuJbvmfWmFhJr15DyG92aO6sUSUd0d4H96X6Fchomr4n/ekM0HM6NRmysfIQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=citrix.com; dmarc=pass action=none header.from=citrix.com;
 dkim=pass header.d=citrix.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=citrix.onmicrosoft.com; s=selector2-citrix-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=RU0sTQncLwtSnqNm1sz3NZyzrxReA0bmFTj0hr0dDr8=;
 b=nkV1/xCJKXfI2KP7lbiA4LAsNVaID8KCpl/JU4DlOiL+RomD75REtSI3cLxo4HtX9l2gUovWwb1fhBQvrVS8CQI3qFGxQYrTuBBHUSqMZeTrf7wH5rnKtZEnQoT+e7VyIJKnAGQ1apFtvZnIfBaAxHPGNteMFLeZKPJAiiRRaZY=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=citrix.com;
Date: Mon, 26 Sep 2022 16:27:27 +0200
From: Roger Pau =?utf-8?B?TW9ubsOp?= <roger.pau@citrix.com>
To: Jan Beulich <jbeulich@suse.com>
Cc: Jun Nakajima <jun.nakajima@intel.com>,
	Kevin Tian <kevin.tian@intel.com>,
	Andrew Cooper <andrew.cooper3@citrix.com>,
	George Dunlap <george.dunlap@citrix.com>, Wei Liu <wl@xen.org>,
	xen-devel@lists.xenproject.org
Subject: Re: [PATCH] x86/ept: simplify detection of special pages for EMT
 calculation
Message-ID: <YzG2zx33xSLC4EaN@MacBook-Air-de-Roger.local>
References: <20220923105648.12587-1-roger.pau@citrix.com>
 <f8a8366f-e656-1628-63cd-d4e0b01dbf57@suse.com>
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <f8a8366f-e656-1628-63cd-d4e0b01dbf57@suse.com>
X-ClientProxiedBy: LO2P123CA0093.GBRP123.PROD.OUTLOOK.COM
 (2603:10a6:600:139::8) To SJ0PR03MB6360.namprd03.prod.outlook.com
 (2603:10b6:a03:395::11)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: SJ0PR03MB6360:EE_|MW4PR03MB6569:EE_
X-MS-Office365-Filtering-Correlation-Id: 99a7d096-9617-4c8d-d0b9-08da9fcb402c
X-LD-Processed: 335836de-42ef-43a2-b145-348c2ee9ca5b,ExtAddr
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	x3o+jmB0pNdN+lE70OlQejQIe4NjBp+OPjWq+Ffwn/YLc+Y5HIJF5mfkU69aBS0ig+ZmckbiOs1sRv9Fs2McL5OpO2U2ieJeaV8l306Q9ICJ8P7OBSBB6WmGP6T5aVrdUyGsrU+Ohx6p1rNS7c/Gmfneg5zRyraRtfH2c+2PJDqFT5fUQfxcrYTtt1BM3WVw4QL3OkuxDWM8XadTnv0AAynEHQAADpzgc7oiP2+PyrHd8ThO287ctLQI4XwKx0mufiDyXm+Ts6lJpV6b8KeNjqjXIaX5UwRFy7ylJZLY51M3Hkh4NbxTXlGzRqvswsNQCzVlnuq/lluqgXVT/2SjSuiR1rzwy4E3KTRw2lBbp/tYEJ/3H/SxuK953kKRPDZgVPPmzphgW/Ghi5H5ZnGy0/Fn9cWVLY6P2LiSDrcOWDI8g3SFgsKHoEBEPmC0kIqPSjMVMmQOgH9dnO25ILNX+rW1hl32KyJesPixdCWfDmfTPK9XlKcaajF+f2O8DOzI0AomZ3z+tvarF+djXAdmw9p4Ul8VU+1vH3OJfvcXfRWNU//7Ts/h0q3IvVdyOdVTgzODsv11LAStI7NQZAfE5CCED2gsV+eRNbz07y48kswkq4ijmx4EgFOJXTPzU47ws987LOEbwQePPcV4+xM/TyP3sGCT9AFhDfUpNouRdDhymgp7Ojs9ysthqwzn/3TLtadzvYXM+5dPd3CxrL2T/A==
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:SJ0PR03MB6360.namprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230022)(4636009)(39860400002)(376002)(136003)(346002)(396003)(366004)(451199015)(38100700002)(26005)(6666004)(6512007)(6506007)(82960400001)(83380400001)(186003)(53546011)(9686003)(478600001)(6486002)(8936002)(6916009)(316002)(54906003)(85182001)(2906002)(86362001)(5660300002)(8676002)(4326008)(66476007)(66556008)(66946007)(41300700001);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?eVpYZHpWVUxCVjhFKzZ2ZmlYcWUxSS9OQVhJZzlVTzkwWHJVT0tRbDd5UG14?=
 =?utf-8?B?ZWhBUVFPa0J1UDJRajNBRnQ2UVF5blNXa2pSYmpYa0krTEhBR0VUOERTV1BE?=
 =?utf-8?B?dVZUUnhwTkFOWUtqNkxmU3Nza0tzcUxqREY5UWoyQWszcGo1RklTbGRFWGs4?=
 =?utf-8?B?ZHZGL1NhQ3ByZHlNMzVCYUVLd0UzZGVBTkdQYmtkb3lvM2gvUTV3Y3phQnlO?=
 =?utf-8?B?TXc1WExHb0tBSmg1QjFET3RNaFoyQjNWd09mWE5CdUpVSm9hZG1ROWdqRnpN?=
 =?utf-8?B?aUtPOUtXeVNXbWdYbzFBMnBhVXkzRm9MZXdHaFBaL1hXZkFVemFZaENQZzFm?=
 =?utf-8?B?NldoTHNEMjZKcENUMzJlOCtsY21QSDZua2ZWUzJtdE8vV2ZIdzUxc0txZGpw?=
 =?utf-8?B?U0VaaXZFSERJdEhnUzBuL1Vtd1NtNSsyWnBOaDBmYjA2TW1hOHAxTGVPZGJh?=
 =?utf-8?B?bVJJNVdQcmZtTjBTSTF5V1NZL1FLaS8vVXZpZ0xBSm0rK0pRY3dwWUdtS1l4?=
 =?utf-8?B?S3JvbGNULzlyZjlsMTFMeC90aGRibkgxQUZzbjgzYVR3Z1FzSmZETGptZVdN?=
 =?utf-8?B?aXpQNjRCU25Zek5RMEkxOHE4YXdzUGppQ0lSZTZhcUY2WUFOcFdqMkQvamN4?=
 =?utf-8?B?elprVzFNak8xeC9maEtmQUtOc0lrUWgyU3RUN1V4NTFRR0FUaXdXYlRIMmQ1?=
 =?utf-8?B?M2NvRVNHdFlzOVRWOUFmNGVncERrNm9uU2hkbVExRmlRZHJ4anczeWRoZ2NC?=
 =?utf-8?B?R0kvR2o1blgrRmEvVTk1b0g5Uzc5KzlPSXFlcFB0MC9TNjBjQ3p5cUQyZ0Zl?=
 =?utf-8?B?SUNNMExRaFhnWEwzcDhhQW5EMzF4M1I4MFFrL20zWlFhVmNSSmgrem9WUGNt?=
 =?utf-8?B?eVBIK0x2UW5uVm1pUnFrYlFZMzlDbXFBZ2I5QjBxeVp3aGVQcHFLTCtnTW95?=
 =?utf-8?B?eVdFZVN6UVNVUUNxN3FsMEFQRm0rV1FXWng0WlRsQS9qSlVnZEVhN1daMEl0?=
 =?utf-8?B?d3RoeThlWCtNck55TlRUL00yM1FnUXZkMXZqbmRvd0tkazFhcG9LSGNISlUx?=
 =?utf-8?B?WGFHNzIyT2x3QzlKcmRDRFpUdVZYQUsvOURxcmphdlhvMkg2NlJ5clRlY2RI?=
 =?utf-8?B?QjZCb0F6U3FIeTduRy91OURDVDlEdmdwOTNya0IrZXBZZlFZMVRBTVMyMG9l?=
 =?utf-8?B?RVQ1Y0hXaFBvMHFlY1VCT1NHNU9xWWxjakRCaDhFUlZGK2RrekpPVXFETWo1?=
 =?utf-8?B?VkxUL1Q5ZDZYYkc1RnRHWFNBRnQ0WlJKeG15SmpISnNDTWdaVE5YNlpvZGkx?=
 =?utf-8?B?QWxQdTc3L01RL1VTanNpODNCODlvVkw2cDJuSlBBWEIxS0RxL0FrK3h3UVpR?=
 =?utf-8?B?T0pQRXlabkxzWGQzNGFIYitnMWpjVlhEMW5Cc25tZlFMVlpSYmdvVkFWbERq?=
 =?utf-8?B?MFlSZUR4bWJJdEpjN2NQbm16Z3RxdVQzc2wvc2l3WVk4MU8wQlgrdkN6NWs1?=
 =?utf-8?B?T3RpOWo1dW1PN3YzeFE2L1FvU2JoNEltcEI2SHVDbDJQV2tDUVl3cS9VS2tI?=
 =?utf-8?B?K0dGZElEbFRSS0dHaHYwZTJoeUh2dndPTHhQUWgxZWxmbDlFOFlCbzMrQkZV?=
 =?utf-8?B?WVZCVXRwTlNBZUhHaGlXSHBTS2lLdFFmWXArK0EzUEZJTWp2N0Uwc2MwdzNu?=
 =?utf-8?B?Y1FoeGppZWQvenJrQktPTC9jdEpJb1djc3JXNDAyZTRhelQzZXNiZWd2NXNQ?=
 =?utf-8?B?RFdneTFFUVRFUDZMK2JVcGhEZXlCbElrbzBBZFdMSzJZa3IxcHRMRXQwQ2VX?=
 =?utf-8?B?MWdpeXZid3FHTG5hbHp1RytGL0F3UXl1ZjBPUFpnRDBnN0dPbm9UNTNUaGFu?=
 =?utf-8?B?eGVrby9iNFh5S2o5czlvRnlzVnRUYjNjVWg0Si9UbFdPQ0JmR2Mza0RQeFJU?=
 =?utf-8?B?MDNkaTJ4Yy9uUXBoRDBsTU1oY1VPV05ZZmRvSTZoUVJ6MmlhYU5SYTBIb2gy?=
 =?utf-8?B?QVFlUmNyWFIxZlg3M0xpN2ttVENlMFVtYWZJclRnbUtXcFNDb3V3TEdOVDZG?=
 =?utf-8?B?NWRRSE5WMmF2ZkZwOGFFV3dXaDNZTmtzdVV2OXU3TzlkVGtJYVJPWEJ4R25J?=
 =?utf-8?B?bVdhTUhKSGQyUllGc1YzNThpS1JnMmtPQWp5L3dzU2cyZWNNaGRwUzU5Z0tz?=
 =?utf-8?B?aEE9PQ==?=
X-OriginatorOrg: citrix.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 99a7d096-9617-4c8d-d0b9-08da9fcb402c
X-MS-Exchange-CrossTenant-AuthSource: SJ0PR03MB6360.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 26 Sep 2022 14:27:33.5998
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 335836de-42ef-43a2-b145-348c2ee9ca5b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: AxdxoXkADZ+yzcfSXKQngeJzlJuYFNGCvlspPDo+H0ViiAqypZJyGIAFpS/YfYEDke3BuHZIfusiBamgOwxxZw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MW4PR03MB6569

On Mon, Sep 26, 2022 at 10:38:40AM +0200, Jan Beulich wrote:
> On 23.09.2022 12:56, Roger Pau Monne wrote:
> > The current way to detect whether a page handled to
> > epte_get_entry_emt() is special and needs a forced write-back cache
> > attribute involves iterating over all the smaller 4K pages for
> > superpages.
> > 
> > Such loop consumes a high amount of CPU time for 1GiB pages (order
> > 18): on a Xeon® Silver 4216 (Cascade Lake) at 2GHz this takes an
> > average amount of time of 1.5ms.  Note that this figure just accounts
> > for the is_special_page() loop, and not the whole code of
> > epte_get_entry_emt().  Also the resolve_misconfig() operation that
> > calls into epte_get_entry_emt() is done while holding the p2m lock in
> > write (exclusive) mode, which blocks concurrent EPT_MISCONFIG faults
> > and prevents most guest hypercalls for progressing due to the need to
> > take the p2m lock in read mode to access any guest provided hypercall
> > buffers.
> > 
> > Simplify the checking in epte_get_entry_emt() and remove the loop,
> > assuming that there won't be superpages being only partially special.
> > 
> > So far we have no special superpages added to the guest p2m,
> 
> We may not be adding them as superpages, but what a guest makes of
> the pages it is given access to for e.g. grant handling, or what Dom0
> makes of e.g. the (per-CPU) trace buffers is unknown. And I guess
> Dom0 ending up with a non-WB mapping of the trace buffers might
> impact tracing quite a bit. I don't think we can build on guests not
> making any such the subject of a large-range mapping attempt, which
> might end up suitable for a superpage mapping (recall that rather
> sooner than later we ought to finally re-combine suitable ranges of
> contiguous 4k mappings into 2M ones, just like we [now] do in IOMMU
> code).

Hm, doesn't pages used for grant handling (XENMAPSPACE_grant_table)
cause them to be mapped as 4K entries in the p2m page tables.  The
code in xenmem_add_to_physmap_one() seems to remove and re-add them
with order 0. Same with the trace buffers, they are added as order 0
to the p2m.

Note that when coalescing we would need to be careful then to not
coalesce special pages.

Might not be the best model because I'm not sure why we require
XENMAPSPACE_grant_table to force entries to not be mapped as part of a
super page in the guest p2m.

> Since for data structures like the ones named above 2M mappings
> might be enough (i.e. there might be little "risk" of even needing to
> go to 1G ones), could we maybe take a "middle" approach and check all
> pages when order == 9, but use your approach for higher orders? The
> to-be-added re-coalescing would then need to by taught to refuse re-
> coalescing of such ranges to larger than 2M mappings, while still
> at least allowing for 2M ones. (Special casing at that boundary is
> going to be necessary also for shadow code, at the very least.) But
> see also below as to caveats.

I guess a rangeset would be more future proof than anything else.

> > and in
> > any case the forcing of the write-back cache attribute is a courtesy
> > to the guest to avoid such ranges being accessed as uncached when not
> > really needed.  It's not acceptable for such assistance to tax the
> > system so badly.
> 
> I agree we would better improve the situation, but I don't think we
> can do so by ...
> 
> > @@ -518,26 +517,19 @@ int epte_get_entry_emt(struct domain *d, gfn_t gfn, mfn_t mfn,
> >          return MTRR_TYPE_UNCACHABLE;
> >      }
> >  
> > -    if ( type != p2m_mmio_direct && !is_iommu_enabled(d) &&
> > -         !cache_flush_permitted(d) )
> > +    if ( (type != p2m_mmio_direct && !is_iommu_enabled(d) &&
> > +          !cache_flush_permitted(d)) ||
> > +         /*
> > +          * Assume the whole page to be special if the first 4K chunk is:
> > +          * iterating over all possible 4K sub-pages for higher order pages is
> > +          * too expensive.
> > +          */
> > +         is_special_page(mfn_to_page(mfn)) )
> 
> ... building in assumptions like this one. The more that here you may
> also produce too weak a memory type (think of a later page in the range
> requiring a stronger-ordered memory type).
> 
> While it may not help much, ...
> 
> >      {
> >          *ipat = true;
> >          return MTRR_TYPE_WRBACK;
> >      }
> >  
> > -    for ( special_pgs = i = 0; i < (1ul << order); i++ )
> > -        if ( is_special_page(mfn_to_page(mfn_add(mfn, i))) )
> > -            special_pgs++;
> > -
> > -    if ( special_pgs )
> > -    {
> > -        if ( special_pgs != (1ul << order) )
> > -            return -1;
> > -
> > -        *ipat = true;
> > -        return MTRR_TYPE_WRBACK;
> > -    }
> 
> ... this logic could be improved to at least bail from the loop once it's
> clear that the "-1" return path will be taken. Improvements beyond that
> would likely involve adding some data structure (rangeset?) to track
> special pages.

For the guest I was running the loop didn't find any special pages in
order 18 mappings, which are the most troublesome to handle in the
loop.  I'm not sure bailing early would make that much of a difference
in practice TBH.

I did also consider using a rangeset, but that would use more
per-domain memory and also require coordination to add special pages
to it.

Thanks, Roger.


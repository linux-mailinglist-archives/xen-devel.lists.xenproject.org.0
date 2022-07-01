Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id CF45F56343A
	for <lists+xen-devel@lfdr.de>; Fri,  1 Jul 2022 15:17:54 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.359009.588394 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1o7GWW-0001K9-70; Fri, 01 Jul 2022 13:17:28 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 359009.588394; Fri, 01 Jul 2022 13:17:28 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1o7GWW-0001H3-3h; Fri, 01 Jul 2022 13:17:28 +0000
Received: by outflank-mailman (input) for mailman id 359009;
 Fri, 01 Jul 2022 13:17:26 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=5ipL=XG=citrix.com=prvs=17451e3f9=roger.pau@srs-se1.protection.inumbo.net>)
 id 1o7GWU-0001Gx-St
 for xen-devel@lists.xenproject.org; Fri, 01 Jul 2022 13:17:26 +0000
Received: from esa3.hc3370-68.iphmx.com (esa3.hc3370-68.iphmx.com
 [216.71.145.155]) by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 24b3f1f0-f940-11ec-bd2d-47488cf2e6aa;
 Fri, 01 Jul 2022 15:17:25 +0200 (CEST)
Received: from mail-bn8nam12lp2177.outbound.protection.outlook.com (HELO
 NAM12-BN8-obe.outbound.protection.outlook.com) ([104.47.55.177])
 by ob1.hc3370-68.iphmx.com with ESMTP/TLS/ECDHE-RSA-AES128-GCM-SHA256;
 01 Jul 2022 09:17:21 -0400
Received: from DS7PR03MB5608.namprd03.prod.outlook.com (2603:10b6:5:2c9::18)
 by SJ0PR03MB5693.namprd03.prod.outlook.com (2603:10b6:a03:2de::15) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5395.15; Fri, 1 Jul
 2022 13:17:19 +0000
Received: from DS7PR03MB5608.namprd03.prod.outlook.com
 ([fe80::40af:d5f4:95eb:d534]) by DS7PR03MB5608.namprd03.prod.outlook.com
 ([fe80::40af:d5f4:95eb:d534%7]) with mapi id 15.20.5395.017; Fri, 1 Jul 2022
 13:17:19 +0000
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
X-Inumbo-ID: 24b3f1f0-f940-11ec-bd2d-47488cf2e6aa
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=citrix.com; s=securemail; t=1656681444;
  h=from:to:cc:subject:date:message-id:
   content-transfer-encoding:mime-version;
  bh=3MRwqc9f6PLUD0ZVNY8tFkHVgCFux7eCRx6yjR38Llg=;
  b=cV16PtboaS1FjEEBTjDgaxFdoaWBEXYQtfL/v+0EDmxpNfkH5/Amp6WM
   j07DzS0ny2vgY/aY86NEtvXCny1NbafU87NBgaPhbtGHpbt3eVcf+KnWG
   ux2dW2w1JzWLkkz4jMnpZzOkYKl5NQsG5nONSfR+CGbSJ3hiMzvTzv7Pg
   w=;
X-IronPort-RemoteIP: 104.47.55.177
X-IronPort-MID: 74884640
X-IronPort-Reputation: None
X-IronPort-Listener: OutboundMail
X-IronPort-SenderGroup: RELAY_O365
X-IronPort-MailFlowPolicy: $RELAYED
IronPort-Data: A9a23:D1I6Hqyfn5nZopDV/Qx6t+f1xyrEfRIJ4+MujC+fZmUNrF6WrkUEz
 zdMX2rXPP+CZGPzfIhzOd7l8k0Cv5PWz9FlQQNqrCAxQypGp/SeCIXCJC8cHc8zwu4v7q5Dx
 59DAjUVBJlsFhcwnj/0bv656yMUOZigHtIQMsadUsxKbVIiGX1JZS5LwbZj2NY32YHhWWthh
 PupyyHhEA79s9JLGjp8B5Kr8HuDa9yr5Vv0FnRnDRx6lAe2e0s9VfrzFonoR5fMeaFGH/bSe
 gr25OrRElU1XfsaIojNfr7TKiXmS1NJVOSEoiI+t6OK2nCuqsGuu0qS2TV1hUp/0l20c95NJ
 NpljJL3EgwlO7/w28tBawtHKTAmHpJm0eqSSZS/mZT7I0zuVVLJmq8rJmdmeIoS96BwHH1E8
 uEeJHYVdBefiumqwbW9DO5xmsAkK8qtN4Qa0p1i5WiBUbB6HtaeHuOTuoAwMDQY36iiGd7EY
 MUUc3x3ZQnoaBxTIFYHTpk5mY9Eg1GgL20I9AzJ/cLb5UD87TAr7rnsKOD+e4eUG+4Eolq2u
 WX/qjGR7hYycYb3JSC+2mKhgKrDkD32XKoWFaak7bh6jVuL3GsRBRYKE1yhrpGRiFO4HdRWK
 EUW+y8nhak06EGvCNL6WnWQo3OavxhaR9tZFcU77h2Azuzf5APxLmoOQyNFadcmnNQrXjFs3
 ViM9/v2ARR/vbvTTmiSnp+WsDezNC49PWIEIygeQmMt+ML/qYs+ihbOSNdLE6OviNDxXzbqz
 Fi3QDMWgrwSiYsB0fW99FWe2Ta0/MGWEUgy+xndWX+j4kVhfom5aoe06F/dq/FdMIKeSVrHt
 38B8ySD0N0z4Vi2vHTlaI0w8HuBvp5p7BW0bYZTIqQc
IronPort-HdrOrdr: A9a23:OtYQZ6BXNQIJ/1nlHehKsceALOsnbusQ8zAXPh9KJCC9I/bzqy
 nxpp8mPH/P5wr5lktQ++xoX5PwOU80lKQFmLX5WI3PYOCIghrNEGgP1+vfKl7balDDH5BmpM
 BdmsFFYbWfbGSS5fyKmjVQeOxQpeVvnprY5ts3mBxWPHpXguxbnnBE4kHxKDwGeCB2Qb4CUL
 aM7MtOoDStPVwRc8SAH3EAG8zOvcfCmp7KaQMPQ0dP0njGsRqYrJrBVzSI1BYXVD1ChZ8k7G
 j+igT8ooGuqeuyxBPw33Laq75WhNzi4N1eA9HksLliFhzcziKTIKhxUbyLuz445Mmp9VYRid
 HJ5ywtOsxigkmhDF2dkF/I4U3NwTwu43jtxRuzmn34u/H0Qzo8Fo5omZ9ZWgGx0TtsgPhMlI
 Zwm06JvZteCh3N2A7n4cLTah1snk2o5VI/jO8oiWBFW4d2Us4akWUmxjIbLH48JlO11Gh+e9
 MeTf00pcwmOm9yVkqp8lWGm7eXLzQO9hTveDlwhiXa6UkUoJlD9Tpm+CUupAZ9yHsDceg72w
 29CNUPqFhvdL5iUUsvPpZ0feKHTkrwfDnrDEW+ZXzaKYBvAQO8l3ew2sR82N2X
X-IronPort-AV: E=Sophos;i="5.92,237,1650945600"; 
   d="scan'208";a="74884640"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=dDUQV+Nm9dM4cqK2/dShIzowJ0cRgA55HSFDLtX5USiWSkBbv/iK3n0/3wY4ZhxNnc7bWMgapTglPj01Buw3iPf3Sa3cNh7sYYXptfJW0fZrDpISycR8nfzMUpNc9KJ9cesrBxW1mPRQeeIETp+jxPpC5FAc9yiqvOK4T2R4lEalaDho2sYkerWNwi08DOVnjrjTK3HHwRKkdn5x5mysNn1dyX7lL23kTQAiHQYAisrrajCUlKjYIwsC7GZxEP88ydH8+UMEESbyg99ttDuHy8BEMcdSMFnPmLqRjD2iysD82YVzAmcuZtx1KSJhVM2qIHfAA9MkuQ618Oy9nNFF8g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=0Gdie4pdVl4a0URPS9oFagfEaDHLSYbfEO8FCT2qL4I=;
 b=KEG4yDLiza319VkCP164rJ2CIyyJMNdkKjgW5CrrtqNdS5jeri4bLXey8FYOANg9RSK8garIOaC6BFVSlePmYjc3vc36sBfdNuDy5GFx3FIBkt9n23UTvKEG0qE7DKhMwsfGvKd0xZ7r94wMVotTXHVFQykHk1lM92CklRZ0tL7D2OxXhHXgshYckL2PaydO7P2Lb6Y4ezMIISWjemJ7cuJ11ExSuK8kSNlCTavcSuZOo0jrTs6LeLWDteYJVP5YVVnucpsqbxUbketRvneuhze8hDBAn0BL1dYHK8fxWG0cYdDtKOeJFoyxRAq2FT/qe3CDOxb2en5zniwofcTp6w==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=citrix.com; dmarc=pass action=none header.from=citrix.com;
 dkim=pass header.d=citrix.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=citrix.onmicrosoft.com; s=selector2-citrix-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=0Gdie4pdVl4a0URPS9oFagfEaDHLSYbfEO8FCT2qL4I=;
 b=LO1Cckc1ME7VhB0Lrp6xmdj9e/ke3cytlaTPb00RcdwUtRVS52uPLMuSqpk45TqPoa/apXruh+OgDyXeTNkA86IHPE7ZJu/Y4Fsl6PYxr8sZ3liKxQsVvspNt/F7bXJs+wF9uRtGtAVftEESSetlAzmN+JNdvunPAvj94cTze5Y=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=citrix.com;
From: Roger Pau Monne <roger.pau@citrix.com>
To: xen-devel@lists.xenproject.org
Cc: Roger Pau Monne <roger.pau@citrix.com>,
	Jun Nakajima <jun.nakajima@intel.com>,
	Kevin Tian <kevin.tian@intel.com>,
	Jan Beulich <jbeulich@suse.com>,
	Andrew Cooper <andrew.cooper3@citrix.com>,
	Wei Liu <wl@xen.org>,
	George Dunlap <george.dunlap@citrix.com>,
	Julien Grall <julien@xen.org>,
	Stefano Stabellini <sstabellini@kernel.org>
Subject: [PATCH v3 0/3] x86/vmx: implement Bus Lock and VM Notify
Date: Fri,  1 Jul 2022 15:16:45 +0200
Message-Id: <20220701131648.34292-1-roger.pau@citrix.com>
X-Mailer: git-send-email 2.37.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: LO2P265CA0207.GBRP265.PROD.OUTLOOK.COM
 (2603:10a6:600:9e::27) To DS7PR03MB5608.namprd03.prod.outlook.com
 (2603:10b6:5:2c9::18)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 466b1680-3aaf-4911-5257-08da5b640691
X-MS-TrafficTypeDiagnostic: SJ0PR03MB5693:EE_
X-LD-Processed: 335836de-42ef-43a2-b145-348c2ee9ca5b,ExtAddr
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	jOUtGnWXZv70rm+ITBg5pFrGYrMG7kfH5Bj8djaav6jg85+iYkxIpPWj3OoaqtMuG0IUPYG8NxTCdz8z5UGJ4nWovDroclfYZhOslogFv1/cZpeczGRh1q5u65ZVAEO4A6MxtuLAV/M1EU2XbUE5shoIP1YHR1OBxmG4+hz5ie1ccmBpMoD6Pa1k7gZmkwZ/KYZt+++ASa3x8Wp0bJaIndzkpwv6gFStjxyhBoetT2D+qbVhvPa83CSyuS3V0Bq1pxG1yQY5RqEf+T11lJ527FkJkK61sFr8HqxxRKBA/AAfiYM55idf8LSn1I2ieU0uN2BSK6+JRuICR9fUsccln3TJK0JT8qHL4n1Ky27fdq4yj5rE+U/Zju1WFGPRE9UUkjLVy9bdhLcqSMv6f0aSTffp2yXfgJcyhVw/B9w039voZGzpQAeh410+XrmdPn1PVU6vlXZ3qjtshbDJs15hxLnfLoFH0hAudDp/d0NqzpnBv0jLbrFZGiqkghMnvg9Ur6chEZpUWMsK5YXgxJCq/3dM/c9m5ndLjVz5DFCLUvRc242M3HOuzse3/tLM3lftxHpVzbBT+4RdhADO7mae0khM+j/5xm2XLfsXxzr26YS+5cCyicBp0TeE4L312XSsThyo631wYf61TEMiD5pcROnjBHOlUH58VUgQHDZJGkRY5RtU4mQ0Z2PH63yfq/2GE7kxRckE9bhn7gCMuexO+fw0w5blFMHj3Lw6w3IOc9x3roXvROjix52TQWBXuMQL
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DS7PR03MB5608.namprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230016)(4636009)(376002)(346002)(396003)(39860400002)(136003)(366004)(38100700002)(66476007)(316002)(82960400001)(54906003)(6916009)(8676002)(66946007)(4326008)(66556008)(2906002)(478600001)(6512007)(186003)(41300700001)(6486002)(1076003)(6666004)(26005)(36756003)(86362001)(8936002)(83380400001)(4744005)(2616005)(6506007)(5660300002);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?UWhOVEhEM3NFaWtEekdGcGNIa3kzc3lWQlRHajVmTU45Ri9IVHpQd3h3V0RB?=
 =?utf-8?B?OU5NMk1rN2IvTDE4Yyt3YVNoSTZWR2hQRVUxdjJhS2FZUlN2UkUwb29OK0xu?=
 =?utf-8?B?WWxxNXY0aGR2OXBZdUU4UWJCQk4xUHduV1czd2Fwb0xhMUhoM1kxaHppNkJT?=
 =?utf-8?B?aTlrNjJOSlVnZW0rL2w5eUdvam5aUFFaVXRoQ1ZuR3d0MGYvVmlhTDNmMEF2?=
 =?utf-8?B?TFZqKzgxZHYrMWFxL1gzNzVDQkJ0aFE5SndZZjBJZ1hGcUxqbXVjWHB6R1g4?=
 =?utf-8?B?aEd2NlZ1bkVqaklUMU8ybVlPbzRlQ3krb1VRVGdubDFXOUFWZDUzelFCQ0Nl?=
 =?utf-8?B?ZGdqZW9zdndkZnN6Qlk2dFZUMG5CQ0Q3MXBqbm1FZkZwUlpabjBJZDhXb1Jn?=
 =?utf-8?B?UzY3WURtcjJ4bXNLWkJvV0kyQUlnbHA5T2E4STZrS3BVUVVxTGtGQzZ6TGIr?=
 =?utf-8?B?UHVRd0ZDRDNkRGloZ2lsaXlvZW5pb0pqaEFQa2tBVHFhbFNubU1jRkR5OUZ6?=
 =?utf-8?B?K3FET0pCU0MzSnhXL3lsYUVodU9ERGFwYnpNY293VjVpc1VHUHNFTFhZdkR2?=
 =?utf-8?B?Q0hRYWlnS1cvNmwrbjdyRVBIV2VEdGdNTUxzakIzb2ZlWVFzQ3lUa2c2VUx1?=
 =?utf-8?B?VzN4SUl6OXo2eFFqN3g3NjI4R3gzRTBTQ1Q4MmptbDQ5K3UzdjFpbHhYSEp1?=
 =?utf-8?B?ZHMxdHFtOW1hakRXUDl4ck9Qa3d2bkNvcFdhbHM5cGZtenpWUVVIdk85SXRy?=
 =?utf-8?B?bVVLZGlGWDNXL1FVY1JMUzZybDJHaTdiS0ZvWUlyY3hiVXdrRVNONFNGNlIx?=
 =?utf-8?B?MUZ2d0pBb3MvWFd5ZnkxM0lJRnQyVThPeWp5TE1tckNaMTM4WkxpeEFZeSsy?=
 =?utf-8?B?bFFDNk5BMm0wclQvNmVyUEZaTGV2WUo4ZWwxaWRHMHVUa29GUGo0TU5IalJQ?=
 =?utf-8?B?MTVEZHVKQUtOMmJYZ29SeWJFSDhMWTkram9NQXFUOXVsT1BlMzlwb2NBNVB0?=
 =?utf-8?B?dWtsWmhHa3ZDK0JIQTltbHBsR2Z2RTJscHdDU3Y3c0tEMm9oRnUvK3htK1l5?=
 =?utf-8?B?YnU1ZGkrM0htSUx2NFk0cVJ5RkdlZGYvRDVnSVFHRlpsQ2Y0L2daVlQyNHRw?=
 =?utf-8?B?aDZzbnk2NFBLMnpLZW4yT3BWc0UxZVhYVmVycjNDcUc3RTVyNk8wNnBtUEUv?=
 =?utf-8?B?am4zeFVOdlhZOE96dGNMT3NKQkVqS1VsUXFlcmRTc1BqWUNYc2JBbTNzMEQv?=
 =?utf-8?B?YUszaWhQM2NaQ0xycDdLbXY2S1BGRUtWT3B2OTFyb3dqQlUzald6VC9heW5w?=
 =?utf-8?B?TzFXRjh6QXo5MEZnVkwrMllRK29CMmVHdXBoOWZET2RNMUNHUk92ZWZxM2sy?=
 =?utf-8?B?R3dvNmZhR3JKbmsra291Mmd5VVVGWXhtOXQ0dU4yUXBnQkZtMjBlUnpRcENv?=
 =?utf-8?B?c0Z4UEVmSG9LWmhwYjdwcUFYc2tST2Ixck1DZXV1NWJmM2x6cmVaTkpoRktU?=
 =?utf-8?B?YzZ2V00wN2NSejhtZlJPNFN1QkRiUjhnK0ROME5ZbEpPOWFrZ3pVcGZKWmFV?=
 =?utf-8?B?SDNMVC9xZkROWnJLWDJRZDU4TkJjTzFLVGpKbEtoNzNPbXpvSUtYNUVUVkYr?=
 =?utf-8?B?OC9Xd2VvYXU5RHRsNFBETzJlV1F6ZUp3NWUyblBnODBGVXg3KzJtTGxRd2Vl?=
 =?utf-8?B?dXJjQTBmM0o5ZXhvbWZtaml0RFg3bG5MRmN2bEpMNmM0UUp1eUpjb1cyWmkx?=
 =?utf-8?B?N3o3WnVwN2lQQ012NDM3K2lrYi9nUDRaSjd3bUV5cjZ5R0p5aWY3MWdVWnp1?=
 =?utf-8?B?L2R0SFg4aUdUSkFwSEtKcCtVYWc0citPWGNIbFpnckxBK043WWNmeWdSVlR1?=
 =?utf-8?B?Ly9hN3d3OHB1aTNmd0lMR0c4cWxYNkQrUHRRZzMzTjVGL1JTR2Rvd0s2VXF3?=
 =?utf-8?B?bU5mYllPeitvdExsczhFZUl2TVNHcWhzT3FTUmZidVpzRnpEZWxFTTZRc1pT?=
 =?utf-8?B?N08yUVhVWVNYS2RmbGEvZnFjUlR0ckd6Q1lxdTNyTkhvZFdMKzF2U2sxRUJl?=
 =?utf-8?B?RGhFeXdhMjVndllYVzd1M3VpeHIwTzA1Z2ZrdERQTVhNNk5JNFpRNG14TVAr?=
 =?utf-8?Q?TLadfYbJC+ParAzd9rESuafHL?=
X-OriginatorOrg: citrix.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 466b1680-3aaf-4911-5257-08da5b640691
X-MS-Exchange-CrossTenant-AuthSource: DS7PR03MB5608.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 01 Jul 2022 13:17:19.2484
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 335836de-42ef-43a2-b145-348c2ee9ca5b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: pGZWLEjYW5m5WjTFEiKDpyj8MVn0osHRyftNN3TlpzRJ+DqvacRe3v6R29a6XygvtrqP8IJ8IVZcNQVKXDTySA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SJ0PR03MB5693

Hello,

Following series implements support for bus lock and notify VM exit.

Patches are not really dependent, but I've developed them together by
virtue of both features being in Intel Instructions Set Extensions PR
Chapter 9.

Thanks, Roger.

Roger Pau Monne (3):
  x86/vmx: implement VMExit based guest Bus Lock detection
  x86/vmx: introduce helper to set VMX_INTR_SHADOW_NMI
  x86/vmx: implement Notify VM Exit

 docs/misc/xen-command-line.pandoc       | 11 ++++
 xen/arch/x86/hvm/vmx/vmcs.c             | 21 ++++++-
 xen/arch/x86/hvm/vmx/vmx.c              | 74 ++++++++++++++++++++++---
 xen/arch/x86/include/asm/hvm/vmx/vmcs.h |  7 +++
 xen/arch/x86/include/asm/hvm/vmx/vmx.h  | 11 ++++
 xen/arch/x86/include/asm/perfc_defn.h   |  5 +-
 6 files changed, 118 insertions(+), 11 deletions(-)

-- 
2.37.0



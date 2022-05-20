Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 797ED52EA27
	for <lists+xen-devel@lfdr.de>; Fri, 20 May 2022 12:48:24 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.333780.557683 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1ns0Ay-0006oq-Dh; Fri, 20 May 2022 10:48:08 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 333780.557683; Fri, 20 May 2022 10:48:08 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1ns0Ay-0006lo-Ar; Fri, 20 May 2022 10:48:08 +0000
Received: by outflank-mailman (input) for mailman id 333780;
 Fri, 20 May 2022 10:48:07 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=cXjj=V4=citrix.com=prvs=1320720ca=roger.pau@srs-se1.protection.inumbo.net>)
 id 1ns0Ax-0006li-CM
 for xen-devel@lists.xenproject.org; Fri, 20 May 2022 10:48:07 +0000
Received: from esa2.hc3370-68.iphmx.com (esa2.hc3370-68.iphmx.com
 [216.71.145.153]) by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 533c4c71-d82a-11ec-bd2c-47488cf2e6aa;
 Fri, 20 May 2022 12:48:05 +0200 (CEST)
Received: from mail-bn8nam11lp2177.outbound.protection.outlook.com (HELO
 NAM11-BN8-obe.outbound.protection.outlook.com) ([104.47.58.177])
 by ob1.hc3370-68.iphmx.com with ESMTP/TLS/ECDHE-RSA-AES128-GCM-SHA256;
 20 May 2022 06:48:02 -0400
Received: from DS7PR03MB5608.namprd03.prod.outlook.com (2603:10b6:5:2c9::18)
 by BYAPR03MB3544.namprd03.prod.outlook.com (2603:10b6:a02:aa::21) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5273.14; Fri, 20 May
 2022 10:48:00 +0000
Received: from DS7PR03MB5608.namprd03.prod.outlook.com
 ([fe80::5df3:95ce:4dfd:134e]) by DS7PR03MB5608.namprd03.prod.outlook.com
 ([fe80::5df3:95ce:4dfd:134e%5]) with mapi id 15.20.5273.017; Fri, 20 May 2022
 10:48:00 +0000
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
X-Inumbo-ID: 533c4c71-d82a-11ec-bd2c-47488cf2e6aa
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=citrix.com; s=securemail; t=1653043685;
  h=date:from:to:cc:subject:message-id:references:
   content-transfer-encoding:in-reply-to:mime-version;
  bh=yliR896BWLb8DfqcOENbAG8jMR81XgE/0WSUqUmZY98=;
  b=PBd66bYTE5KWkS6fXcTcCUBHe4G+Fgw1xkd1OkMJgHhLumyT0OaMemDR
   73wbW8Ie4WRGg/GQLv9KEMGh8o9D3xpFYraBOq5iwNAbV3upAKY59n/9d
   5KkV38CCdcLUOiESaqh2BrEHJAauMOB4vUQDuJ7lzBrZlfZqwulu7OZin
   4=;
X-IronPort-RemoteIP: 104.47.58.177
X-IronPort-MID: 71785295
X-IronPort-Reputation: None
X-IronPort-Listener: OutboundMail
X-IronPort-SenderGroup: RELAY_O365
X-IronPort-MailFlowPolicy: $RELAYED
IronPort-Data: A9a23:O2hRWqIpzpBtIB/nFE+Rq5QlxSXFcZb7ZxGr2PjKsXjdYENS1jwCy
 WJMX2GCOvjYNjPwfdFxaY21p0hU6J+Gy4M2SwRlqX01Q3x08seUXt7xwmUcns+xwm8vaGo9s
 q3yv/GZdJhcokf0/0vrav67xZVF/fngqoDUUYYoAQgsA149IMsdoUg7wbRh39Qw2YHR7z6l4
 rseneWOYDdJ5BYsWo4kw/rrRMRH5amaVJsw5zTSVNgT1LPsvyB94KE3fMldG0DQUIhMdtNWc
 s6YpF2PEsE1yD92Yj+tuu6TnkTn2dc+NyDW4pZdc/DKbhSvOkXee0v0XRYRQR4/ttmHozx+4
 MlxtMGIGTh4AvaWhcEncz1+FwE5M7ITrdcrIVDn2SCS52vvViK1ht9IXAQxN4Be/ftrC2ZT8
 /BeMCoKch2Im+OxxvS8V/VogcMgasLsOevzuFk5lW2fUalgHMCFGvqVjTNb9G5YasRmB/HRa
 tBfcTNyRB/BfwdOKhEcD5dWcOKA2SCgI2AC+Q/9SawfvCvwiyB6zPvXK9uEQOeGGsVbv2qCq
 TeTl4j+KlRAXDCF8hKH+H+xgu7EnQvgRZkfUra/85ZCkFCVg2AeFhASfV+6uuWizF6zXcpFL
 E4Z8TZoqrI9nGSzR8T5dw21pjiDpBF0c8VUO/037keK0KW83uqCLm0NTzoEYtp2ssYzHGUuz
 gXQwIyvAiFzurqIT37b7q2TsT65JSkSKykFeDMASgwGpdLkpenfky7yczqqK4bt5vWdJN066
 2niQPQW71nLsfM26g==
IronPort-HdrOrdr: A9a23:gEHvAqg0a4QPANcYvKZ1HF/teXBQX0h13DAbv31ZSRFFG/FwyP
 rCoB1L73XJYWgqM03I+eruBEBPewK4yXdQ2/hoAV7EZnichILIFvAa0WKG+VHd8kLFltK1uZ
 0QEJSWTeeAd2SS7vyKnzVQcexQp+VvmZrA7Ym+854ud3ANV0gJ1XYENu/xKDwTeOApP+taKH
 LKjfA32gZINE5nJ/iTNz0gZazuttfLnJXpbVovAAMm0hCHiXeN5KThGxaV8x8CW3cXqI1Sul
 Ttokjc3OGOovu7whjT2yv66IlXosLozp9mCNaXgsYYBz3wgkKDZZhnWZeFoDcpydvfoGoCoZ
 3pmVMNLs5z43TeciWcpgbs4RDp1HIU53rr2Taj8A/eiP28YAh/J9tKhIpffBecwVEnpstA3K
 VC2H/cn4ZLDDvb9R6NqOTgZlVPrA6ZsHAimekcgzh0So0FcoJcqoQZ4Qd8DIoAJiTn84oqed
 MeQP003MwmMG9yUkqp/lWGmLeXLzcO91a9MwU/U/WuonZrdCsT9Tpb+CQd9k1wga7VBaM0ot
 gsCZ4Y5Y2mfvVmE56VO91xMfdfKla9Ni4kY1jiV2gOKsk8SgHwgq+yxokJz8eXX7FN5KcOuf
 36ISFlXCgJCgjTNfE=
X-IronPort-AV: E=Sophos;i="5.91,239,1647316800"; 
   d="scan'208";a="71785295"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=QIGTMIJ825lBwt8pksG4KcvscVnsjuZCQ4nESjfCiIbuXMNHDk5lybiO1+NK0nQHoBtJ7HfjAKDyQicLqYyh1/J77bRd+hHvIKwooTHTXoIHZjhRpgLKKayOX6tT2TNkSfJ/qRw7MueoVTAbfvNXwP4QKUAsDGCJcv1II5lZtHLxdzmguJtnwYv/F5Lq1Xx/GeScqGmSgOij+ZaYNXdMgM0GMISyku2Z1OLBU4UItrW3smfNb3WfaFSJ5an9xivQ8OmWtlrRL9Pazj/kQJlVMroa1fptN+KYYOJvbyfFHPYUwNANhzXf4uGnjr+kggX1j4usTNIiZ426JblcyCV+fg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=KyLuuJQ99pGXy4h9taQ/mipk4urv5Fp+BoDS2GaMjiI=;
 b=oNjO/MKknttQFBoNbAklpYSvdKfMJPnLM3YT7R7EGDsDCkJTz6S1yWWO99/sOpvdft/IDk7SOkzgX7Ug48ZIWzZm1vidHpaGjTbX0bVSboqRpsAydmWn/16G5dlDz4WbsqZqP1iJzt1yZF1IvcxFgjHB//5z7uLHQ0YXriId2OzYJTDPf4k//c0vLJFmmZqJBupHzpVhRkc1xUfK6UUq8fKbYoof4l6SqeFJRo95Bj7JuSmnmwW4MP/ToybXdNFI3VTXrSd4pB9zpuI3wfZpER2oeFiIhhM63kSfPl3Xh1KqIZRErlipx1YzwVdaOLYbFfETZpHHYWRkJm+DDQMQMw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=citrix.com; dmarc=pass action=none header.from=citrix.com;
 dkim=pass header.d=citrix.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=citrix.onmicrosoft.com; s=selector2-citrix-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=KyLuuJQ99pGXy4h9taQ/mipk4urv5Fp+BoDS2GaMjiI=;
 b=YI4wVxIln8B9RyvqU1AAzsLnaCRq7LytFV8QwZ6O6gkkockr80AFWEpOa0BTtSf65fVcyQgiNKbKM6hvVYcS9rHV//IiLwQ5WNV1quinPg64SomrTvhWVobFVKt9hcWF48HBUx5Gm83FuvpQUSh0BRsuoobJQvbSkBg1dP/aslg=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=citrix.com;
Date: Fri, 20 May 2022 12:47:55 +0200
From: Roger Pau =?utf-8?B?TW9ubsOp?= <roger.pau@citrix.com>
To: Jan Beulich <jbeulich@suse.com>
Cc: "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>,
	Andrew Cooper <andrew.cooper3@citrix.com>,
	Paul Durrant <paul@xen.org>, Wei Liu <wl@xen.org>
Subject: Re: [PATCH v4 13/21] IOMMU/x86: prefill newly allocate page tables
Message-ID: <Yodx21zhWtZCV2dY@Air-de-Roger>
References: <b92e294e-7277-d977-bb96-7c28d60000c6@suse.com>
 <9d073a05-0c7d-4989-7a38-93cd5b01d071@suse.com>
 <YnUDeR5feSsmbCVF@Air-de-Roger>
 <6666ab70-b68a-eac5-a632-893f950a984a@suse.com>
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <6666ab70-b68a-eac5-a632-893f950a984a@suse.com>
X-ClientProxiedBy: LO4P123CA0372.GBRP123.PROD.OUTLOOK.COM
 (2603:10a6:600:18e::17) To DS7PR03MB5608.namprd03.prod.outlook.com
 (2603:10b6:5:2c9::18)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: e9f34d01-6694-4030-9979-08da3a4e3507
X-MS-TrafficTypeDiagnostic: BYAPR03MB3544:EE_
X-Microsoft-Antispam-PRVS:
	<BYAPR03MB3544FDD741AE5AC548AFA55F8FD39@BYAPR03MB3544.namprd03.prod.outlook.com>
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	DN09GVE3nlunsrkOLoSVcyk9TKFSaRPYWRGbeBnbOo9GpNlVwtJjzHk2P6zd52Hiqsml9N88WSNiMxRdDaxl1S0El+q/Egp/vj5iO6d2NxVXT5ThmeaqMgdftiI5Uvlw5qhuTELJ3e3A5P1+6SYreSzatZ4jJ7kgj/Bqbe+XAa0IIz9epFr/trgo7/mu3WSqVdqjxIdrMFXYOIETuEbArWcIoZhbnIsb9+PqNbkXbui9F+A2D1LalL02qD8vAdwk1YPWw2g0qV2Ky4797vY/RJDJbKh6gfJVcKzEXKX2Hlk+3xmcPDfUCuBKb1C1GB9psUzCIiCFKrS7o+FA7KvXyf1LcpKkz1OlLj3OCs0gFVWg2VErg563GuX+OGfnv5ZzwJLpvp7YN14rvT9h6SaGDF81++ljnzcW2uwU8s4D2pg5l4ZogPxExAlNmfh3UdiKgDzjN98s8UVNlPdN8QA5uAhe8IwaCYZtEWH9Ln7u1kcW23qIeEyKoPce6p4NMf/X8BTTD5wsRTn3SrKLpcOVoboTlPf57vJgqwGFy7kNisQC3IDpvIpvUin+oO9lcdiwOxqKEEysR6Rl+AhrmuCJv/eJ+CnlNlBIqoJOtTBCU0G61kFvHpwoKKAonNsnt1hj8CU3QrGGL/pUas8gcqBuhQ==
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DS7PR03MB5608.namprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230001)(4636009)(7916004)(366004)(6512007)(8676002)(33716001)(4326008)(66946007)(53546011)(66556008)(83380400001)(66476007)(26005)(508600001)(82960400001)(9686003)(8936002)(5660300002)(38100700002)(6506007)(6486002)(6666004)(316002)(85182001)(186003)(6916009)(54906003)(2906002)(86362001);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?MDRtcG44Ymx3Y256bU82RkZqaXFOUFhmd2NqOExaVW5mMlVtd1psL2NaTjFn?=
 =?utf-8?B?a1Y4WjJLd05zZGNDOVBLYUk0cVA1OEFTSDVRMWZ6OWxEelFDeWI5d282b1ov?=
 =?utf-8?B?bWU5cTlCY3M3cmdPTGdpOXNMYmNGaWd1S2I4TGpyUUhzREdsS3hhYXE1bGNp?=
 =?utf-8?B?ZTJLdzJJSWdPSWYwT3ZCTGNjckduUjBWMzJLNG5qUTVFeW1UYTBsK2VUd1VI?=
 =?utf-8?B?bHdyN3BtZm1QR0hvZVR0Y1pra20xdVFvQ1V5M1U1eEhLbExvU2tlQzd6eTM4?=
 =?utf-8?B?dTBwdEZIc3JOTHZTUE1RRlpLREc0RncycUltTlZjM2FPTGVxSzNldzdVa0Ro?=
 =?utf-8?B?Qnl2WjUzOHpQYUcwcnBzaVAvSGRmOXllZEVSdmFYVUV5SHlCRXlTYnJVUDNT?=
 =?utf-8?B?NHQ1Y3FPSE9PUFA3MGVWWDhDcVVqcXJBMWt4NTBQUmhqQld1UXNIUlZMQ0FT?=
 =?utf-8?B?NHVqUk5nVnYyb3lyVDE2OHp6MUVCdXVOTGJUb29ocnlMc1JNcndZenV4S0tY?=
 =?utf-8?B?NW9lYTQ0Mnp3Q3BHVjBNajVkZ2w0WDAvNVZOanBpOWxUTUtrcEl6YnRyekps?=
 =?utf-8?B?M0tWTHdEdU02Yk9ZdXcvM2wvQUJDaDRHRE1xNEI3SVRQSHl2OFY4K2xhYUF4?=
 =?utf-8?B?K2poTWphVDJ4Q3dCcVZHcGd3WHZPVy9YbCtNaS8vRElNUDI5c3VaSTM3azZL?=
 =?utf-8?B?VVErYmlrOUlEbTd1U3pITFJEZUxiem82YkRHRHcvdUdGUUduSUVMbEZxWS90?=
 =?utf-8?B?bDlHK3hYNGl4U1RoUXRkaktvK3A1dDFBbWFYY1daR3lEdlJ2YXBRWEFEeGhN?=
 =?utf-8?B?MDZDa2xJd3p5bXR3YkpzR05EUXl6Y1ZjOEdvbjZld0RoSlNWZnJ0R3BacWtW?=
 =?utf-8?B?SEdjWnRvOFQxNVZLdUo1WHNPazA1dmxkcThNL1I3YWxSMW9vWTFLRVg3cnUv?=
 =?utf-8?B?QUJQOW9qUlA1QWF4TjRCaVJoTFJURFQ1UUVVTk5wT0kxcGtiK3ViSHhBdHFn?=
 =?utf-8?B?QjdlMVNxbzNoQkZIOEdHb0llRW14dXNFL1c2S1dPSVp2RmxvWFJTZFYvdyt1?=
 =?utf-8?B?cmlFUEJRL2ljd3ZpTHpORkNjSmhUQ04rWDdjaDlBK0pZVDdzTHkzVHprcWFr?=
 =?utf-8?B?UVpnYXRVVGNNMCt6R2pwTktsQi9WNUZVYk1qN25pL1JGS0tHRnNadHB1dEJM?=
 =?utf-8?B?R08xRTlPWTNEa2RsWWdiRTBHeFh0TVU2UXFjck1lYWw0aWY1WTFtcHNHQmZw?=
 =?utf-8?B?WXFiWDBvLzBaQWd5NVdEMUw2R3AzVmNPTlJyaW50SFpmOEU2N0hnNDRZYWsx?=
 =?utf-8?B?ZVBaenZWazhPSk9COFgwYzFqZUp2akYxc2ZVaWdGVjJES3I5NTJWcFlDeTUy?=
 =?utf-8?B?bVdPZHBRZ2p0WWoyZ2dMWG1odTlqL2k4RGdEZVN3MnJ0TzJmajE5UjhEMVJt?=
 =?utf-8?B?MDZQRmRmRDhKeXNYcEY1aC9tNUZmalc4SE9KbGtVNHpVbVk4SVRiSHhIVFBI?=
 =?utf-8?B?VnUwdXpud3ptb2pUSFh6YlV5b2pqaXQ5QXByUDJvWHRhWHJ6WkRsM1Q1WENu?=
 =?utf-8?B?SktiM0pHMkJoc0w4VXFubjBsZVJvTU9WZWs5TEhPQk1ZU0dLeUw2UUlVcHVQ?=
 =?utf-8?B?RTgyUHVOZEkyN0dEVDdzdVIrUzVmYldZWWJabEN2bklKWTlyVFpkNjJ3OTZ0?=
 =?utf-8?B?eEMzRVZ3QU44VkU5UzU3aHhycmFXOXUrcGFPdk8vZ2lMMTA4SzlKQlVCM1d2?=
 =?utf-8?B?ZCtKV0xmVmpLOW5nMjlmcUR2WnBpYW9kYmZ6d1RhVmQvV1N4enFiMFVBcEJw?=
 =?utf-8?B?NzlXMXg0UG5tZmpUM0x3bC96THJZSWtnRUdqSDN4bVV3WWhNb3lDOUtncndu?=
 =?utf-8?B?U2dBYnFMdlo1eDhGendKMzJhdFpnREZKTEN4bzNGNHVIemV3NlFDYUN2OGRN?=
 =?utf-8?B?MEh3a1hxbkp6MGNlYmhoSC9YR3JLdGc3REFGZ2krNmMrYkY0L0NtcUlyZWxv?=
 =?utf-8?B?bEpjZDQwSUFhTUxYQkFmOG5OS1E5Ni9VM2lvRUZCbExCUm9BQ3hjdTIwelFr?=
 =?utf-8?B?cGZPYVJQZlRUckxkS213ZkQxbnkyeVdKY1d2YXVUaHBROGIyOVlyRzh2ek1P?=
 =?utf-8?B?K0NaZzlVZ1NNcnZWNnA1Qm5oNnBtUEIyL1U1cmdqbmxxV1ordDM2Z0hJNDU1?=
 =?utf-8?B?Tm1RaitXeHBUN3JzUUlKUTUzVkJzSTQwRkZrZEZmMzRxcFFqblRyZEIxSHUx?=
 =?utf-8?B?SzNyYllpVjVQNEpiWlZMeDc1Y0YwRVcwanJIQkR3NWJQVEZWNndNMGZObW1r?=
 =?utf-8?B?VEZvRktFV1E2bytsM21Kc1luR1NUVWZnaWNKeFI1b1lvVDNIQkZYNWxCaklq?=
 =?utf-8?Q?rzFAMbYPmu1izq5w=3D?=
X-OriginatorOrg: citrix.com
X-MS-Exchange-CrossTenant-Network-Message-Id: e9f34d01-6694-4030-9979-08da3a4e3507
X-MS-Exchange-CrossTenant-AuthSource: DS7PR03MB5608.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 20 May 2022 10:47:59.9772
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 335836de-42ef-43a2-b145-348c2ee9ca5b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: AFStItaG6In2OlVwB3lUOzwieWFYMuS/afGqevvnJGsftA8Mo/2yNXfdeDmeVzKeA96oqw2eGyj4nbAYviFnNw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BYAPR03MB3544

On Thu, May 19, 2022 at 02:12:04PM +0200, Jan Beulich wrote:
> On 06.05.2022 13:16, Roger Pau Monné wrote:
> > On Mon, Apr 25, 2022 at 10:40:55AM +0200, Jan Beulich wrote:
> >> ---
> >> An alternative to the ASSERT()s added to set_iommu_ptes_present() would
> >> be to make the function less general-purpose; it's used in a single
> >> place only after all (i.e. it might as well be folded into its only
> >> caller).
> > 
> > I would think adding a comment that the function requires the PDE to
> > be empty would be good.
> 
> But that's not the case - what the function expects to be clear is
> what is being ASSERT()ed.
> 
> >  Also given the current usage we could drop
> > the nr_ptes parameter and just name the function fill_pde() or
> > similar.
> 
> Right, but that would want to be a separate change.
> 
> >> --- a/xen/drivers/passthrough/amd/iommu_map.c
> >> +++ b/xen/drivers/passthrough/amd/iommu_map.c
> >> @@ -115,7 +115,19 @@ static void set_iommu_ptes_present(unsig
> >>  
> >>      while ( nr_ptes-- )
> >>      {
> >> -        set_iommu_pde_present(pde, next_mfn, 0, iw, ir);
> >> +        ASSERT(!pde->next_level);
> >> +        ASSERT(!pde->u);
> >> +
> >> +        if ( pde > table )
> >> +            ASSERT(pde->ign0 == find_first_set_bit(pde - table));
> >> +        else
> >> +            ASSERT(pde->ign0 == PAGE_SHIFT - 3);
> > 
> > I think PAGETABLE_ORDER would be clearer here.
> 
> I disagree - PAGETABLE_ORDER is a CPU-side concept. It's not used anywhere
> in IOMMU code afaics.

Isn't PAGE_SHIFT also a CPU-side concept in the same way?  I'm not
sure what's the rule for declaring that PAGE_SHIFT is fine to use in
IOMMU code  but not PAGETABLE_ORDER.

Thanks, Roger.


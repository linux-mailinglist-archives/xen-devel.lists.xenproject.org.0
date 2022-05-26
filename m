Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 72F90534DE3
	for <lists+xen-devel@lfdr.de>; Thu, 26 May 2022 13:13:23 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.337558.562212 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1nuBQ3-0004C6-Ll; Thu, 26 May 2022 11:12:43 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 337558.562212; Thu, 26 May 2022 11:12:43 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1nuBQ3-00049c-Gp; Thu, 26 May 2022 11:12:43 +0000
Received: by outflank-mailman (input) for mailman id 337558;
 Thu, 26 May 2022 11:12:41 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=ibG2=WC=citrix.com=prvs=138a1b502=roger.pau@srs-se1.protection.inumbo.net>)
 id 1nuBQ1-0003PI-76
 for xen-devel@lists.xenproject.org; Thu, 26 May 2022 11:12:41 +0000
Received: from esa6.hc3370-68.iphmx.com (esa6.hc3370-68.iphmx.com
 [216.71.155.175]) by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id c05d9a1e-dce4-11ec-bd2c-47488cf2e6aa;
 Thu, 26 May 2022 13:12:39 +0200 (CEST)
Received: from mail-co1nam11lp2173.outbound.protection.outlook.com (HELO
 NAM11-CO1-obe.outbound.protection.outlook.com) ([104.47.56.173])
 by ob1.hc3370-68.iphmx.com with ESMTP/TLS/ECDHE-RSA-AES128-GCM-SHA256;
 26 May 2022 07:12:33 -0400
Received: from DS7PR03MB5608.namprd03.prod.outlook.com (2603:10b6:5:2c9::18)
 by PH0PR03MB6527.namprd03.prod.outlook.com (2603:10b6:510:ba::10) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5293.13; Thu, 26 May
 2022 11:12:31 +0000
Received: from DS7PR03MB5608.namprd03.prod.outlook.com
 ([fe80::5df3:95ce:4dfd:134e]) by DS7PR03MB5608.namprd03.prod.outlook.com
 ([fe80::5df3:95ce:4dfd:134e%4]) with mapi id 15.20.5293.013; Thu, 26 May 2022
 11:12:31 +0000
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
X-Inumbo-ID: c05d9a1e-dce4-11ec-bd2c-47488cf2e6aa
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=citrix.com; s=securemail; t=1653563559;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:content-transfer-encoding:mime-version;
  bh=h0uFhd5dy2NQgfu+ARn99X6LxjDQPABc4PMm+Xx5S+A=;
  b=fRs8gOkUYuCIlqslAZmUDQ1v0MNZQNiH1vLH4l+4f/playskxWSrQbUu
   YbiaddQkrJ0m1kjezsYBJnkXSDku0h3fecx5tjLLRovdXTZoi9trNnC8l
   5PzsIuB0VQy5xE5UDiTofzKobHiB+dan6nurIgojcXy3t7PDsbTvaaZvU
   k=;
X-IronPort-RemoteIP: 104.47.56.173
X-IronPort-MID: 72087942
X-IronPort-Reputation: None
X-IronPort-Listener: OutboundMail
X-IronPort-SenderGroup: RELAY_O365
X-IronPort-MailFlowPolicy: $RELAYED
IronPort-Data: A9a23:YSfgf6Lg7piz4muwFE+RE5QlxSXFcZb7ZxGr2PjKsXjdYENSg2QCy
 GIaXmmHP/2CamD8L9wjb4qy/BxUuJHTxtNqSwplqX01Q3x08seUXt7xwmUcns+xwm8vaGo9s
 q3yv/GZdJhcokf0/0vrav67xZVF/fngqoDUUYYoAQgsA149IMsdoUg7wbRh39Q22YHR7z6l4
 rseneWOYDdJ5BYsWo4kw/rrRMRH5amaVJsw5zTSVNgT1LPsvyB94KE3fMldG0DQUIhMdtNWc
 s6YpF2PEsE1yD92Yj+tuu6TnkTn2dc+NyDW4pZdc/DKbhSvOkXee0v0XRYRQR4/ttmHozx+4
 MVdtpqMdVgnAo73sfggaTYDNgEhZaITrdcrIVDn2SCS52vvViK1ht5JVQQxN4Be/ftrC2ZT8
 /BeMCoKch2Im+OxxvS8V/VogcMgasLsOevzuFk5lW2fUalgHM6FGvqRjTNb9G5YasRmB/HRa
 tBfcTNyRB/BfwdOKhEcD5dWcOKA2SOnI2IJ9Aj9Sawf8kWLllEh2uTRLf35fuLWV99pgWC0q
 TeTl4j+KlRAXDCF8hKV/3TpiuLRkCfTXIMJCKb+5vNsmEeUxGEYFFsRT1TTifuzh1O6WtlfA
 1cJ4Sdopq83nGSpU938UhuQsHOC+BkGVLJ4CPYm4QuAzq7V5QexBWUeSDNFLts8u6ceWjgCx
 lKP2dTzClRHsqCTD3SU9b6WrDa7ESkTMWIGIyQDSGMt4NT9oYd1khPGSP5iFrK4ipv+HjSY/
 tyRhC03hrFWhslS0ay+pAnDm2j1+cOPSRMp7ALKWG7j9hl+eIOue42v7x7c8OpEK4GaCFKGu
 RDohvSj0QzHNrnV/ATlfQnHNOjBCyqtWNEEvWNSIg==
IronPort-HdrOrdr: A9a23:0FlOsaz028ys3BEqSXcKKrPxpeskLtp133Aq2lEZdPULSKGlfp
 GV9sjziyWetN9wYh4dcB67Scu9qBTnhORICOgqTMyftWzd1FdAQ7sSibcKrweBJ8S6zJ8l6U
 4CSdkANDSPNykcsS+S2mDRfbcdKZu8gdiVbI/lvgtQpGpRGsRdBmlCe2Wm+hocfng6OXN1Lu
 vV2iIBzADQCkg/X4CePD0oTuLDr9rEmNbPZgMHPQcu7E2rgSmz4LD3PhCE1lNGOgk/i4sKwC
 zgqUjU96+ju/a0xlv10HLS1Y1fnJ/ExsFYDMKBp8AJInHHixquZq5mR7qe1QpF692H2RIPqp
 3hsh0gN8N85zf4eXy0mwLk303a3DMn+xbZuCilqEqmhfa8aCMxCsJHi44cWADe8VAcsNZ117
 8O936FtrJMZCmw0hjV1pztbVVHh0C0qX0tnao4lHpES7YTb7dXsMg24F5VKpEdByj3gbpXX9
 WGNPuspMq+TGnqLEww5gJUsZ6RtzUIb1u7q3E5y42oO2M8pgE986MarPZv6kvouqhND6Ws3N
 60Q5iApIs+MPP+UpgNdNvpOfHHbFAlYSi8Rl56cm6XXZ3uBRr22uzKyYRwwt2WU7o167Z3sK
 j9cTpjxBsPkgTVeICz4KE=
X-IronPort-AV: E=Sophos;i="5.91,252,1647316800"; 
   d="scan'208";a="72087942"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=FbmZSxdYTfn8Zvb8yIRbonm+MFX3UpPv9HiqYoz3hNCcIcZ32qcu4qig+LMkYvKXFBQk/VVcaxyH7X8vOHG86TMSq5TmY0xiAWMuGu39Xg6/CXPat05Dn1SjQ+Wc36IwsRaU/DZ7S8Mz/8mkBQgdV2EPgZun7ZnyURWxcbj1uikjJWDC6hJmyTX0fMbOjtzznnttYcb0NOZlcH8rcwusEkYIeVKyYCZV0fxwWJCE5vYlGWAdNtQzMgvt/a11TNQ7R6yJWlGxXyR0K6dD+0itLVEFv8YviU1p4ue6Y0iBZslhoOknXLUHU8E+MPUFi8oaXS05a+naYU/vRmlzOSV4PA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=mZghJ9fryPIa1AdgB3JRhsQ84q95rsW5MylO7wo4jpQ=;
 b=KTMgwgrznYk931H/JkQwm1q3xTaIFhs6auCkD8Naqa276ExqAa4uaPnn77BmHAjE2QiAR26wxS6GHiqFP+BzLcuJkM8mkOcw6ixk5SDenU85NhhERCKSQeBnzwdTL/MXF7xc5dAZnqgu3QLZ1JMShK8FezhH4dxBU16PL2x5+KNNqYMqzjcfwBCQlJPVHRtWIpaKzVDrz5SL1IOF+C9voh+rtAAxLucc9XHZjZhcOjjCBaeZr8JfqrZrmqeT61XxB95scefahvtZeQelL8DqsxtqB89zGm3/sFzewVXnnQXW9i34Sf8q5TTT+lHbFhdymv9F+vbthby3PFJYV1K4yQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=citrix.com; dmarc=pass action=none header.from=citrix.com;
 dkim=pass header.d=citrix.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=citrix.onmicrosoft.com; s=selector2-citrix-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=mZghJ9fryPIa1AdgB3JRhsQ84q95rsW5MylO7wo4jpQ=;
 b=oqrTTQ12kHdF7KhnuI7CPbJvrOzIpjQdDnYudDdfTMQhKRo7qiw+02k1qy2c5O+Uv63jS9EIh5gUlrHSSlTphFRbf38aTdHyLzdhgRWDQhuDZ48mG9SX87Y14S8HuBV4msgNtxOIjhwLxicOZnk2QqFFxyUaMiwhbwOOhRBMLLQ=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=citrix.com;
From: Roger Pau Monne <roger.pau@citrix.com>
To: xen-devel@lists.xenproject.org
Cc: Roger Pau Monne <roger.pau@citrix.com>,
	Andrew Cooper <andrew.cooper3@citrix.com>,
	George Dunlap <george.dunlap@citrix.com>,
	Jan Beulich <jbeulich@suse.com>,
	Julien Grall <julien@xen.org>,
	Stefano Stabellini <sstabellini@kernel.org>,
	Wei Liu <wl@xen.org>,
	Jun Nakajima <jun.nakajima@intel.com>,
	Kevin Tian <kevin.tian@intel.com>
Subject: [PATCH v2 3/3] x86/vmx: implement Notify VM Exit
Date: Thu, 26 May 2022 13:11:57 +0200
Message-Id: <20220526111157.24479-4-roger.pau@citrix.com>
X-Mailer: git-send-email 2.36.0
In-Reply-To: <20220526111157.24479-1-roger.pau@citrix.com>
References: <20220526111157.24479-1-roger.pau@citrix.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: LO4P123CA0198.GBRP123.PROD.OUTLOOK.COM
 (2603:10a6:600:1a4::23) To DS7PR03MB5608.namprd03.prod.outlook.com
 (2603:10b6:5:2c9::18)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 12ca42e3-2f33-45b7-ada2-08da3f08a074
X-MS-TrafficTypeDiagnostic: PH0PR03MB6527:EE_
X-LD-Processed: 335836de-42ef-43a2-b145-348c2ee9ca5b,ExtAddr
X-Microsoft-Antispam-PRVS:
	<PH0PR03MB652732E4061699ABEB0C1A138FD99@PH0PR03MB6527.namprd03.prod.outlook.com>
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	G6nS0DZcUCc9cEhlR81kAleL8vNOZNR1tyqp/QXis91rOPTls6vgrqMFxyk0b3l0eVCK6Ls9MxuaQpI/JI+DQSwZrdYkENLmVRcoIbk6FqNzYlImG0SE/dJNClljfqGbSEpLHCDjGJLrknYh9uyq+GaOav5oqaUBHnTGtzqYk2ddr3+gZgsEKXn+uokZDEw09xJxj2E6n8wESTjGgurzvBAPcECTLOfZtM/KulslJBwogeH7z5RWO1mkwYDWlvpwIkhCLMYYgVKGxCe6S7DKvI9DxhJN16IlrXV9qU25OaHEUNb5Ck4VSNIMkoGdeLnB4Oes+dkifZKmDTgaiEXN7AiRXPZ+qiwbHCKYizNDoDmcdEXHQ3pgtVEBGi10md1wKicSD6XkyMWpJZM9hyz928l/zfF0kY5Li6srLysvXbDTq/WNBsquVgul2Pz6Y47LLxSgl4uRV89j6spz4Dqtumkv/v+YKR3cl/j0BhvqfWxOFNFhImGv182K2eiDTl197RAUTsCb6ReOwpGnfSITxvq/guvEZ5l7PaE+0luitE86XyxuL3cFh7ZaZmW1Ok0ZvJP4a8YDRXDcDTz/8RGT1PwLFXd/N6m2ndIV2YH1C31LF7CQvI4s+qm6qgRTUS0+nUYUkGTblc/YexoMRJRxXQ==
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DS7PR03MB5608.namprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230001)(4636009)(366004)(5660300002)(86362001)(4326008)(66476007)(66556008)(66946007)(8676002)(8936002)(54906003)(316002)(6916009)(38100700002)(1076003)(6506007)(82960400001)(6512007)(26005)(6486002)(83380400001)(6666004)(186003)(508600001)(36756003)(2906002)(2616005);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?eGwyQytkYjQ2UWk3eEJCdFBFYmVMczErQWEvTGo4TkhraUFJWkgrQzRkZjI0?=
 =?utf-8?B?MmQwSE5wSmpEY21vUVcySytrTXkva29QalVINmlVSm1UWk5BTmNVWHVZa1d4?=
 =?utf-8?B?WXFoNGYzbnVialJnbHI0b2RGZHpyTXJ6YVBkdHNPQ1JrZ0txZERqVEZoa1Fy?=
 =?utf-8?B?ZGlsN25LaHUyYmQ3ekxwVkxCZitjei9ycUhJM3JXTWJub2U4OUplbmNtbGVu?=
 =?utf-8?B?alRpL1dZZmRWWjhUUytqSFd1SE1aWSt3MmpJRTRjS3BDQW13SVJxSk90aXEz?=
 =?utf-8?B?b0VuelhCUkNXTnBuY3ZGZUFFMEZ2aXhkN2ZRS0IxOG4vU1JUNmwvcnFjSGdu?=
 =?utf-8?B?ampLSEVENndRSmNvWFVob3VuV2FvTnYyVkswWlV0ZUphbXJVYys5YTRNS2ZL?=
 =?utf-8?B?NjI2ZWZUdm5XYm1RejdBMDQyd0g1WElLU3hNbS9BdWRnL2h0ZFJ1Y0cwM3Jn?=
 =?utf-8?B?YS9mWGdlNjNTQTQwS0VoRkwzYUovWnQ3YzBwRExSSHM3MGRNWUZsdHZ5ZEFT?=
 =?utf-8?B?VkxLRmdOVk5rOFExVEFEc1hPclVoU05FM0ltRFFIVWJOVU1ESWtXOEdhU3Ji?=
 =?utf-8?B?M1Zuanoxd3l5Ky9xeHRBbWFCU0t4NkRIckh4b2NPMmo4UU5rSHJqcGUvckkz?=
 =?utf-8?B?UXhZUDdlcTd0ajdVNjU1NzZwWkFoYWdvYkdsNktQdHpQNVhvZ09KWkpmZEpl?=
 =?utf-8?B?OXQ0d3FSYlFnenVDdHNENDVzVERla1ovWWtydUVqUjFFMytyWkpRcVdQcjRr?=
 =?utf-8?B?WjhvVUtOaDh2WUgzeUtZejZBMytMVmxLNm5NNGx4L0t2MEdnbDB6NkRGZUtt?=
 =?utf-8?B?WnRtaHZlQzlHWGRjZURlWVY4NE9Ua3lNL0plcGhYZGE1amE4UFkxQitMY0xr?=
 =?utf-8?B?NnM1NExXb1IvQWtaVVJnZjh5UTdxY0FobDZwLzVZcGxudDBsenhKRTFzRVRt?=
 =?utf-8?B?dFAzSEJCZXFvRFdQSVZORy9UbEtlbDhNL3Y2QjR2MC81NkR2c0R4RXN0My9i?=
 =?utf-8?B?cFRRdmZSWUdUU2x1eE52ejE5WHhyN2xMOTlqeXc5ZjRsRTJrc3RLYkorSGdi?=
 =?utf-8?B?elJwcjJYZFNTRUxwRFN1UmU0KzBjbXJxTnNzNTdKVjduQS9hSUNDTU50Zm9i?=
 =?utf-8?B?cy82L3hpeFhYZ1F2NmdkeDIyUnRBZkZkc0NzVmZxVm1LSEJ2elNsZTB1N0VE?=
 =?utf-8?B?eEZ3L09qWWdySkxER1djZnRDYXhqYi8wMHh1aTZDRFBDNi9kSHZZWEJrYzBv?=
 =?utf-8?B?M2Y0aGc1K09Vd0FWV2RvK2JPOUhaS3B3Wmg4ZGVCT2lLL0phV2lUWEJnMjFN?=
 =?utf-8?B?MFUyd0hzcElzWHR3WFlJNVZNSmlQNlg2c0k2VXJOcm16Y0hidnBNUlAwajh4?=
 =?utf-8?B?WWxtYStTYlU3SHpLODBldHZTbzIwVlNIU3o5dVQvbUtEYVYvLysvVHl5SllX?=
 =?utf-8?B?RFNCcFJmLzlITVFTVkxIc1JXV2FtZVZWWWVkbjFtdjdlaGtBZ3FkVFlnNVpr?=
 =?utf-8?B?TllRb0pMbG95UmlvWCtpYVFpcVVnM3llQzBUazd0dHZ1YXRxeFNCWlVoUUN2?=
 =?utf-8?B?OGx6ZGQvT28wRXhsbksvcmdhdUlUNUxGTUdKT01HRnNoRGRCb0JzcTM1K2Jz?=
 =?utf-8?B?Ykp0aDNYdk56aldkNnE4NlZ5WWlscFBOWE10K0xNR09VS3N0WWwxZzhUWlF3?=
 =?utf-8?B?S1RiV1I4dlVZTGdqbjJ0c3lIZ05hbmttWVpBVnhHdS9SRmE0Ky96TnZSYUUw?=
 =?utf-8?B?QWdjNnUwVzRBRHJMS2hlMmQ4Q3JpaEV0NmxwYzdQazJoMG5PUHo3TjJraWpQ?=
 =?utf-8?B?bHFLdjlxemMwUUZMcDgrbC9PSWtEUlFmVFJFL3Zid1dzdEVFa2tIWGpFbnpM?=
 =?utf-8?B?a2Z6VHVqUUd5L0ljNjdnQnBRRG5WREZFSkpNNWhra2RrK1RDTHB1MnFGSmdD?=
 =?utf-8?B?Rk8rakprVmxpZXFjU0l6YVV1T3A2a25HWElGdEF2dCsxNmpXaHE3cEdKeW1y?=
 =?utf-8?B?Z0daVEs3T3ZvODFvODNjRVpZWko5Zy84ZkhBK2pOY2RGekhiRGtFdk9aQ3dH?=
 =?utf-8?B?V3FJMmllNnhDVzdWdG0xMGVXakVZYWZpN041WFB6dVRXMElEMEZyb0lTZlZI?=
 =?utf-8?B?aXhFMWthcGg3WXAveExzNGM4ekRYbUJyZWdQSm50UXRRaGg4QmI1amt4Wk5P?=
 =?utf-8?B?d2tGUFlMUmZXWkdnejFrR0Z4OTlwcHlZS3lNbUJ3L3RuczJOYmorMUdHZmNU?=
 =?utf-8?B?SXhDd3MrRjZSaWFBOTk1elNIWnZubWNRTzhOOHo4TFBJWCtVWWxmL0w2SjJy?=
 =?utf-8?B?N1pDdlVsc1JSUjJPYjR6ZTNGYTZ0SkpjVktZblNUNXFRUncrbXMzdFBWSHpS?=
 =?utf-8?Q?uUQpoMddwGGF1P9U=3D?=
X-OriginatorOrg: citrix.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 12ca42e3-2f33-45b7-ada2-08da3f08a074
X-MS-Exchange-CrossTenant-AuthSource: DS7PR03MB5608.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 26 May 2022 11:12:31.2042
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 335836de-42ef-43a2-b145-348c2ee9ca5b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 8i0ex93hCohlQNPjEICGZBhMqGCjDu+UeuKyDnOJQtgzpGqi8zNnBKk0kuIgIgyFXz4Vw4v55avqGuAhDCQD/A==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH0PR03MB6527

Under certain conditions guests can get the CPU stuck in an unbounded
loop without the possibility of an interrupt window to occur on
instruction boundary.  This was the case with the scenarios described
in XSA-156.

Make use of the Notify VM Exit mechanism, that will trigger a VM Exit
if no interrupt window occurs for a specified amount of time.  Note
that using the Notify VM Exit avoids having to trap #AC and #DB
exceptions, as Xen is guaranteed to get a VM Exit even if the guest
puts the CPU in a loop without an interrupt window, as such disable
the intercepts if the feature is available and enabled.

Setting the notify VM exit window to 0 is safe because there's a
threshold added by the hardware in order to have a sane window value.

Suggested-by: Andrew Cooper <andrew.cooper3@citrix.com>
Signed-off-by: Roger Pau Monné <roger.pau@citrix.com>
---
Changes since v1:
 - Properly update debug state when using notify VM exit.
 - Reword commit message.
---
This change enables the notify VM exit by default, KVM however doesn't
seem to enable it by default, and there's the following note in the
commit message:

"- There's a possibility, however small, that a notify VM exit happens
   with VM_CONTEXT_INVALID set in exit qualification. In this case, the
   vcpu can no longer run. To avoid killing a well-behaved guest, set
   notify window as -1 to disable this feature by default."

It's not obviously clear to me whether the comment was meant to be:
"There's a possibility, however small, that a notify VM exit _wrongly_
happens with VM_CONTEXT_INVALID".

It's also not clear whether such wrong hardware behavior only affects
a specific set of hardware, in a way that we could avoid enabling
notify VM exit there.

There's a discussion in one of the Linux patches that 128K might be
the safer value in order to prevent false positives, but I have no
formal confirmation about this.  Maybe our Intel maintainers can
provide some more feedback on a suitable notify VM exit window
value.

I've tested with 0 (the proposed default in the patch) and I don't
seem to be able to trigger notify VM exits under normal guest
operation.  Note that even in that case the guest won't be destroyed
unless the context is corrupt.
---
 docs/misc/xen-command-line.pandoc       | 11 +++++++++
 xen/arch/x86/hvm/vmx/vmcs.c             | 19 +++++++++++++++
 xen/arch/x86/hvm/vmx/vmx.c              | 32 +++++++++++++++++++++++--
 xen/arch/x86/include/asm/hvm/vmx/vmcs.h |  4 ++++
 xen/arch/x86/include/asm/hvm/vmx/vmx.h  |  6 +++++
 xen/arch/x86/include/asm/perfc_defn.h   |  3 ++-
 6 files changed, 72 insertions(+), 3 deletions(-)

diff --git a/docs/misc/xen-command-line.pandoc b/docs/misc/xen-command-line.pandoc
index 1dc7e1ca07..ccf8bf5806 100644
--- a/docs/misc/xen-command-line.pandoc
+++ b/docs/misc/xen-command-line.pandoc
@@ -2544,6 +2544,17 @@ guest will notify Xen that it has failed to acquire a spinlock.
 <major>, <minor> and <build> must be integers. The values will be
 encoded in guest CPUID 0x40000002 if viridian enlightenments are enabled.
 
+### vm-notify-window (Intel)
+> `= <integer>`
+
+> Default: `0`
+
+Specify the value of the VM Notify window used to detect locked VMs. Set to -1
+to disable the feature.  Value is in units of crystal clock cycles.
+
+Note the hardware might add a threshold to the provided value in order to make
+it safe, and hence using 0 is fine.
+
 ### vpid (Intel)
 > `= <boolean>`
 
diff --git a/xen/arch/x86/hvm/vmx/vmcs.c b/xen/arch/x86/hvm/vmx/vmcs.c
index d388e6729c..6cb2c6c6b7 100644
--- a/xen/arch/x86/hvm/vmx/vmcs.c
+++ b/xen/arch/x86/hvm/vmx/vmcs.c
@@ -67,6 +67,9 @@ integer_param("ple_gap", ple_gap);
 static unsigned int __read_mostly ple_window = 4096;
 integer_param("ple_window", ple_window);
 
+static unsigned int __ro_after_init vm_notify_window;
+integer_param("vm-notify-window", vm_notify_window);
+
 static bool __read_mostly opt_ept_pml = true;
 static s8 __read_mostly opt_ept_ad = -1;
 int8_t __read_mostly opt_ept_exec_sp = -1;
@@ -210,6 +213,7 @@ static void __init vmx_display_features(void)
     P(cpu_has_vmx_pml, "Page Modification Logging");
     P(cpu_has_vmx_tsc_scaling, "TSC Scaling");
     P(cpu_has_vmx_bus_lock_detection, "Bus Lock Detection");
+    P(cpu_has_vmx_notify_vm_exiting, "Notify VM Exit");
 #undef P
 
     if ( !printed )
@@ -329,6 +333,8 @@ static int vmx_init_vmcs_config(bool bsp)
             opt |= SECONDARY_EXEC_UNRESTRICTED_GUEST;
         if ( opt_ept_pml )
             opt |= SECONDARY_EXEC_ENABLE_PML;
+        if ( vm_notify_window != ~0u )
+            opt |= SECONDARY_EXEC_NOTIFY_VM_EXITING;
 
         /*
          * "APIC Register Virtualization" and "Virtual Interrupt Delivery"
@@ -1333,6 +1339,19 @@ static int construct_vmcs(struct vcpu *v)
         rc = vmx_add_msr(v, MSR_FLUSH_CMD, FLUSH_CMD_L1D,
                          VMX_MSR_GUEST_LOADONLY);
 
+    if ( cpu_has_vmx_notify_vm_exiting )
+    {
+        __vmwrite(NOTIFY_WINDOW, vm_notify_window);
+        /*
+         * Disable #AC and #DB interception: by using VM Notify Xen is
+         * guaranteed to get a VM exit even if the guest manages to lock the
+         * CPU.
+         */
+        v->arch.hvm.vmx.exception_bitmap &= ~((1U << TRAP_debug) |
+                                              (1U << TRAP_alignment_check));
+        vmx_update_exception_bitmap(v);
+    }
+
  out:
     vmx_vmcs_exit(v);
 
diff --git a/xen/arch/x86/hvm/vmx/vmx.c b/xen/arch/x86/hvm/vmx/vmx.c
index 69980c8e31..d3c1597b3e 100644
--- a/xen/arch/x86/hvm/vmx/vmx.c
+++ b/xen/arch/x86/hvm/vmx/vmx.c
@@ -1419,10 +1419,19 @@ static void cf_check vmx_update_host_cr3(struct vcpu *v)
 
 void vmx_update_debug_state(struct vcpu *v)
 {
+    unsigned int mask = 1u << TRAP_int3;
+
+    if ( !cpu_has_monitor_trap_flag && cpu_has_vmx_notify_vm_exiting )
+        /*
+         * Only allow toggling TRAP_debug if notify VM exit is enabled, as
+         * unconditionally setting TRAP_debug is part of the XSA-156 fix.
+         */
+        mask |= 1u << TRAP_debug;
+
     if ( v->arch.hvm.debug_state_latch )
-        v->arch.hvm.vmx.exception_bitmap |= 1U << TRAP_int3;
+        v->arch.hvm.vmx.exception_bitmap |= mask;
     else
-        v->arch.hvm.vmx.exception_bitmap &= ~(1U << TRAP_int3);
+        v->arch.hvm.vmx.exception_bitmap &= ~mask;
 
     vmx_vmcs_enter(v);
     vmx_update_exception_bitmap(v);
@@ -4155,6 +4164,9 @@ void vmx_vmexit_handler(struct cpu_user_regs *regs)
         switch ( vector )
         {
         case TRAP_debug:
+            if ( cpu_has_monitor_trap_flag && cpu_has_vmx_notify_vm_exiting )
+                goto exit_and_crash;
+
             /*
              * Updates DR6 where debugger can peek (See 3B 23.2.1,
              * Table 23-1, "Exit Qualification for Debug Exceptions").
@@ -4593,6 +4605,22 @@ void vmx_vmexit_handler(struct cpu_user_regs *regs)
          */
         break;
 
+    case EXIT_REASON_NOTIFY:
+        __vmread(EXIT_QUALIFICATION, &exit_qualification);
+
+        if ( exit_qualification & NOTIFY_VM_CONTEXT_INVALID )
+        {
+            perfc_incr(vmnotify_crash);
+            gprintk(XENLOG_ERR, "invalid VM context after notify vmexit\n");
+            domain_crash(v->domain);
+            break;
+        }
+
+        if ( unlikely(exit_qualification & INTR_INFO_NMI_UNBLOCKED_BY_IRET) )
+            undo_nmis_unblocked_by_iret();
+
+        break;
+
     case EXIT_REASON_VMX_PREEMPTION_TIMER_EXPIRED:
     case EXIT_REASON_INVPCID:
     /* fall through */
diff --git a/xen/arch/x86/include/asm/hvm/vmx/vmcs.h b/xen/arch/x86/include/asm/hvm/vmx/vmcs.h
index 5d3edc1642..0961eabf3f 100644
--- a/xen/arch/x86/include/asm/hvm/vmx/vmcs.h
+++ b/xen/arch/x86/include/asm/hvm/vmx/vmcs.h
@@ -267,6 +267,7 @@ extern u32 vmx_vmentry_control;
 #define SECONDARY_EXEC_XSAVES                   0x00100000
 #define SECONDARY_EXEC_TSC_SCALING              0x02000000
 #define SECONDARY_EXEC_BUS_LOCK_DETECTION       0x40000000
+#define SECONDARY_EXEC_NOTIFY_VM_EXITING        0x80000000
 extern u32 vmx_secondary_exec_control;
 
 #define VMX_EPT_EXEC_ONLY_SUPPORTED                         0x00000001
@@ -348,6 +349,8 @@ extern u64 vmx_ept_vpid_cap;
     (vmx_secondary_exec_control & SECONDARY_EXEC_TSC_SCALING)
 #define cpu_has_vmx_bus_lock_detection \
     (vmx_secondary_exec_control & SECONDARY_EXEC_BUS_LOCK_DETECTION)
+#define cpu_has_vmx_notify_vm_exiting \
+    (vmx_secondary_exec_control & SECONDARY_EXEC_NOTIFY_VM_EXITING)
 
 #define VMCS_RID_TYPE_MASK              0x80000000
 
@@ -455,6 +458,7 @@ enum vmcs_field {
     SECONDARY_VM_EXEC_CONTROL       = 0x0000401e,
     PLE_GAP                         = 0x00004020,
     PLE_WINDOW                      = 0x00004022,
+    NOTIFY_WINDOW                   = 0x00004024,
     VM_INSTRUCTION_ERROR            = 0x00004400,
     VM_EXIT_REASON                  = 0x00004402,
     VM_EXIT_INTR_INFO               = 0x00004404,
diff --git a/xen/arch/x86/include/asm/hvm/vmx/vmx.h b/xen/arch/x86/include/asm/hvm/vmx/vmx.h
index bc0caad6fb..e429de8541 100644
--- a/xen/arch/x86/include/asm/hvm/vmx/vmx.h
+++ b/xen/arch/x86/include/asm/hvm/vmx/vmx.h
@@ -221,6 +221,7 @@ static inline void pi_clear_sn(struct pi_desc *pi_desc)
 #define EXIT_REASON_XSAVES              63
 #define EXIT_REASON_XRSTORS             64
 #define EXIT_REASON_BUS_LOCK            74
+#define EXIT_REASON_NOTIFY              75
 /* Remember to also update VMX_PERF_EXIT_REASON_SIZE! */
 
 /*
@@ -236,6 +237,11 @@ static inline void pi_clear_sn(struct pi_desc *pi_desc)
 #define INTR_INFO_VALID_MASK            0x80000000      /* 31 */
 #define INTR_INFO_RESVD_BITS_MASK       0x7ffff000
 
+/*
+ * Exit Qualifications for NOTIFY VM EXIT
+ */
+#define NOTIFY_VM_CONTEXT_INVALID       1u
+
 /*
  * Exit Qualifications for MOV for Control Register Access
  */
diff --git a/xen/arch/x86/include/asm/perfc_defn.h b/xen/arch/x86/include/asm/perfc_defn.h
index d6eb661940..c6b601b729 100644
--- a/xen/arch/x86/include/asm/perfc_defn.h
+++ b/xen/arch/x86/include/asm/perfc_defn.h
@@ -6,7 +6,7 @@ PERFCOUNTER_ARRAY(exceptions,           "exceptions", 32)
 
 #ifdef CONFIG_HVM
 
-#define VMX_PERF_EXIT_REASON_SIZE 75
+#define VMX_PERF_EXIT_REASON_SIZE 76
 #define VMEXIT_NPF_PERFC 143
 #define SVM_PERF_EXIT_REASON_SIZE (VMEXIT_NPF_PERFC + 1)
 PERFCOUNTER_ARRAY(vmexits,              "vmexits",
@@ -126,5 +126,6 @@ PERFCOUNTER(realmode_exits,      "vmexits from realmode")
 PERFCOUNTER(pauseloop_exits, "vmexits from Pause-Loop Detection")
 
 PERFCOUNTER(buslock, "Bus Locks Detected")
+PERFCOUNTER(vmnotify_crash, "domains crashed by Notify VM Exit")
 
 /*#endif*/ /* __XEN_PERFC_DEFN_H__ */
-- 
2.36.0



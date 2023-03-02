Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id D18DD6A8411
	for <lists+xen-devel@lfdr.de>; Thu,  2 Mar 2023 15:21:10 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.504958.777432 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1pXjnN-0001wM-U9; Thu, 02 Mar 2023 14:20:33 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 504958.777432; Thu, 02 Mar 2023 14:20:33 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1pXjnN-0001uP-RI; Thu, 02 Mar 2023 14:20:33 +0000
Received: by outflank-mailman (input) for mailman id 504958;
 Thu, 02 Mar 2023 14:20:31 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=aytp=62=citrix.com=prvs=418692924=Andrew.Cooper3@srs-se1.protection.inumbo.net>)
 id 1pXjnL-0001uJ-Ng
 for xen-devel@lists.xenproject.org; Thu, 02 Mar 2023 14:20:31 +0000
Received: from esa6.hc3370-68.iphmx.com (esa6.hc3370-68.iphmx.com
 [216.71.155.175]) by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 61c56080-b905-11ed-96ad-2f268f93b82a;
 Thu, 02 Mar 2023 15:20:30 +0100 (CET)
Received: from mail-bn8nam12lp2176.outbound.protection.outlook.com (HELO
 NAM12-BN8-obe.outbound.protection.outlook.com) ([104.47.55.176])
 by ob1.hc3370-68.iphmx.com with ESMTP/TLS/ECDHE-RSA-AES128-GCM-SHA256;
 02 Mar 2023 09:20:16 -0500
Received: from BYAPR03MB3623.namprd03.prod.outlook.com (2603:10b6:a02:aa::12)
 by BY5PR03MB5078.namprd03.prod.outlook.com (2603:10b6:a03:1e5::12)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6156.19; Thu, 2 Mar
 2023 14:20:13 +0000
Received: from BYAPR03MB3623.namprd03.prod.outlook.com
 ([fe80::8299:f95f:934b:29e8]) by BYAPR03MB3623.namprd03.prod.outlook.com
 ([fe80::8299:f95f:934b:29e8%7]) with mapi id 15.20.6134.030; Thu, 2 Mar 2023
 14:20:12 +0000
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
X-Inumbo-ID: 61c56080-b905-11ed-96ad-2f268f93b82a
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=citrix.com; s=securemail; t=1677766829;
  h=message-id:date:from:subject:to:cc:references:
   in-reply-to:content-transfer-encoding:mime-version;
  bh=kApxpVEn7+k8qSS+Qx8e+tb2KGp2U25LYAwXQp3gJk0=;
  b=E4EzW94k+kWGyM5TXl4F5ncnwpmszD7nWfKaqQKmnmbpWuX2WT4v3jjt
   qQjjiIzSUSB/m7wUGW9qdvNUf4Pp0SjuhYzMmYmcGqmN7I/LWFFkv2T9i
   59YIB7QklNQGucLTV6ZaXmppzy2kDVs78dlJAaFbp2slQCdMrdYjiTwbt
   c=;
X-IronPort-RemoteIP: 104.47.55.176
X-IronPort-MID: 98565893
X-IronPort-Reputation: None
X-IronPort-Listener: OutboundMail
X-IronPort-SenderGroup: RELAY_O365
X-IronPort-MailFlowPolicy: $RELAYED
IronPort-Data: A9a23:6oAMFahK0Pu3NCiCZsDByODwX1611REKZh0ujC45NGQN5FlHY01je
 htvC2yFPqqMZWuhKt5wYNnn9UgP6MXUn4dqG1ZppSs1ECob9cadCdqndUqhZCn6wu8v7q5Ex
 55HNoSfdpBcolv0/ErF3m3J9CEkvU2wbuOgTrWCYmYpHlUMpB4J0XpLg/Q+jpNjne+3CgaMv
 cKai8DEMRqu1iUc3lg8sspvkzsy+qWi0N8klgZmP6sT5weEzyN94K83fsldEVOpGuG4IcbiL
 wrz5OnR1n/U+R4rFuSknt7TGqHdauePVeQmoiM+t5mK2nCulARrukoIHKN0hXNsoyeIh7hMJ
 OBl7vRcf+uL0prkw4zxWzEAe8130DYvFLXveRBTuuTLp6HKnueFL1yDwyjaMKVBktubD12i+
 tQpBwI3YhLe29i0wbWlbdtXqfwlIePkadZ3VnFIlVk1DN4AaLWaGeDgw48d2z09wMdTAfzZe
 swVLyJ1awjNaAFOPVFRD48imOCvhT/0dDgwRFC9/PJrpTSMilEsluGybrI5efTTLSlRtm+eq
 njL4CLSBRYCOcbE4TGE7mitlqnEmiaTtIc6Re3lqKM60Qb7Kmo7Nw0cTVnmvqSAiWGzQOB1E
 309qnIkov1nnKCsZpynN/Gim1aDuhMfQNtRVe4n8gaGyqnTywmcD2kACDVGbbQOpMIwADAny
 FKNt9foHiB09q2YT2qH8bWZpi/0PjIaRUcAbyIZSQoO4/H4vZo+yBnIS75LC7Wph9f4HTXxx
 TGiryUkgbgXy8kR2M2T8lHOhTaxrZHhVA8r4R7WWGnj5QR8DKavYIai+FXA7fJNKY+fZlaEt
 XkA3cOZ6YgmBJWMjzCEQf9LEqug4f2EKxXDjVUpFJ4knxym/HileoJc6S9/P29mN88FfXniZ
 0q7hO9KzJpaPX/vZ6knZYu0Up4u1fK5SoqjUe3IZN1TZJQ3bBWA4CxleU+X2SbqjVQolqY8f
 5ycdK5AEEonNEiu9xLuL8917FPh7nlWKb/7LXwj8yma7A==
IronPort-HdrOrdr: A9a23:X6dm4Kl77pm2ysAShiUYe5jR4dPpDfIi3DAbv31ZSRFFG/Fw9v
 rDoB1/73TJYVkqN03I9ervBEDjexPhHO9OgLX5VI3KNGOKhILCFvAA0WKN+UyEJwTOssJbyK
 d8Y+xfJbTLfDxHZB/BkWuFL+o=
X-IronPort-AV: E=Sophos;i="5.98,227,1673931600"; 
   d="scan'208";a="98565893"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=aiY0GBZknLmVVgSsBbcB+ZpH19zX8N60fCtZTIYbKDF0LpXs7C81PYwb7OvKZdQ6tVKLkzDNYnZCHEotDOnDy89b8q87szhonBYXkgcEdVqneaHJ+eWYRQWQmZvZZJkcVRxmjkNUe28h4+RheN56B6Fdxf9uCY94GF3m5WqR1oWWxgUL7nQuqmIXgHg3Vbwq3QcUMg8p8mGEz9wFfRdCKwHjPQQkx8xwn+QmbkVqd5G/bvqYgobo2aldAtttTxKO3U5ToWdQ4XGceViGBuI0bW7aP6FXPPVeihci8Rwv83WCSlQejsxRkVSFeJBMdDwrRzmjY6HWzUQ5SgyAayIvoA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=coRTInJ5pmJPcv4PnlCTTNmIBDb9Je+S0OzPefYTrl4=;
 b=MzdHYnkwZuSW1ArjlnPRydiG5UrPTHKSRHQI1LSBwZHIdDjk6cV4Np9bQBG30tcjRj3Rzr9wPzNx5TlPH5sXpSoT+gWfjrI+BNE9Dd8GdAdjqbgB4Bran5UzC+3cwUSu+uWu2MbPGRk8esFemBLi+EfayQTq+9j7p7rFd7UVbu58l8bVZLzeiWhNrWP+pHHEEPD2PviZ8sKWhOxhPStPHWsfzzB21WjFanxX1/eFCBIR2+azcRvEfSXs0p5ZwXKOLfingXYd1WG2XIwW0jBwx94bU5tQttOUzd0jYUT30W4Yp1Ep1Ls3J+fooEGPtLOryWvESqqUjMqNFCdl35hXRA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=citrix.com; dmarc=pass action=none header.from=citrix.com;
 dkim=pass header.d=citrix.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=citrix.onmicrosoft.com; s=selector2-citrix-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=coRTInJ5pmJPcv4PnlCTTNmIBDb9Je+S0OzPefYTrl4=;
 b=jj3ZASrtOyZHdNkz8fcO84kQQA5yAMlImcOQl5Udh0qyZHwQUoONlHVoGWU5RNRPippAZlVeQqPBjYlUxussZojRCiPOFY0dgkRFPvvw+vi/Xqhhxgub3jn+7ts6IbdYtAIUKdR/IcsCYjbh3qpubyRBIiW6vF6PhtmlkFDH4Gg=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=citrix.com;
Message-ID: <7f3703a2-83a6-6fad-041c-f2b3df0253df@citrix.com>
Date: Thu, 2 Mar 2023 14:20:06 +0000
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.7.1
From: Andrew Cooper <andrew.cooper3@citrix.com>
Subject: Re: [PATCH v2 3/3] xen/riscv: disable fpu
Content-Language: en-GB
To: Oleksii Kurochko <oleksii.kurochko@gmail.com>,
 xen-devel@lists.xenproject.org
Cc: Jan Beulich <jbeulich@suse.com>,
 Stefano Stabellini <sstabellini@kernel.org>,
 Gianluca Guida <gianluca@rivosinc.com>,
 Bob Eshleman <bobbyeshleman@gmail.com>,
 Alistair Francis <alistair.francis@wdc.com>,
 Connor Davis <connojdavis@gmail.com>
References: <cover.1677762812.git.oleksii.kurochko@gmail.com>
 <f9bed949656462e9eb9554dc5e0dcccdd722b9cd.1677762812.git.oleksii.kurochko@gmail.com>
In-Reply-To: <f9bed949656462e9eb9554dc5e0dcccdd722b9cd.1677762812.git.oleksii.kurochko@gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: LO4P265CA0074.GBRP265.PROD.OUTLOOK.COM
 (2603:10a6:600:2bd::13) To BYAPR03MB3623.namprd03.prod.outlook.com
 (2603:10b6:a02:aa::12)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: BYAPR03MB3623:EE_|BY5PR03MB5078:EE_
X-MS-Office365-Filtering-Correlation-Id: 1452ebec-c9d3-4a96-1380-08db1b293c8b
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	hrX+M6tYj1zmByRWe4XSIzHSRxlNKVGsCB/uNdlULo0C3cZuveI6clwGjxZKbmT1s25cA4WH35rlgXClWaPUwcaQWrUXFrUsJ3Z3I/uHdcSw7JghD3QTlajkaivmg3ZPdpXZ0DGfmatl3pdGlquQED+vRiin6/xq7tw3/oWuut7OKr+3PSwdYhjNgnEKaQAPH3RetlDCpFUkWkzi7bekt5fBIkmm53zJBkdRm3bZJgCUKvI1A3Q/TV5irK/Fozt6c7o2xXrAd+bk2dOmZdRM5WorGEDB0IQ8+gfbG+UbL9LaYaqTv2cG8wHmRTQjhjMU/ne95NRD4cbmZ/MT7kx4IFEzk/pOWJAoVdTQhASuLmGZORqTkjhGg7cJHBs+XjLxD9uo3F2B8E4mevcGaqZUROwC3dfHvwlJBqy/goOdVMzgyvj8PbBkD+2SW6K4Hi7ugD80iVbj2LEhDIocP3dlj+6SR1FkgrHsu3MxyQFndJNNuPs4WBZog6KPvav0mZ0rFm1P2IhCMm6wD/co2cKtgbStJ9BAGQFYYWGTeehHnnIJ5u1ldDSu5B13oun9t53KOZEubxnVxwKmrRiq5R+hZ8eCMgmfydjbwDlWrz2r9vj4cEJ94psHU60tgtum6YjW3xJ4xmgZpm5GPUAWNnGXSy/juSdpDgWrXxqO5hjL7LctaCchZ8I2XYJ2WPCwXVrr6Ro4/trRCcQKlom5KXIKGqKxL+HCSLBsBjcL/UbED7w=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:BYAPR03MB3623.namprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230025)(4636009)(396003)(366004)(346002)(39860400002)(136003)(376002)(451199018)(31686004)(36756003)(2616005)(8936002)(41300700001)(6512007)(54906003)(8676002)(66556008)(66476007)(66946007)(186003)(4326008)(53546011)(31696002)(86362001)(2906002)(83380400001)(4744005)(26005)(6506007)(5660300002)(316002)(6666004)(478600001)(6486002)(38100700002)(82960400001)(43740500002)(45980500001);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?c1gvUERwTGdQTmRZOFRxdWN3U2JKYkFJT05wYlZUZ2FHdlNRUXhZdDNyVzhG?=
 =?utf-8?B?cDAyMXN4aGJNL3pSZ1lKNUp2R0JjWEVZTWFvUEh4NlpBem5KZmR0UnFwZXRn?=
 =?utf-8?B?Z3B6Nk9tNkVlY1ExdGlvblJ2YUZGQ1hPd0ZlNm1ka25jdG52NEtKU3EwSk45?=
 =?utf-8?B?YVY5UzAreWpyTDMzRmhHRVhlbjFhb2JPYkp4OFVFcjhKZEZuVDZWclNuNTRu?=
 =?utf-8?B?VFFDRVV6aXFzVGkyOXNXdStMWVZaQUkxWWdjNzdwWStNekMzR0lhTHdqRU15?=
 =?utf-8?B?dTZVZDVObmF6NXBTWVdkdVpubzFmVHg2VGdUY1JYeHNXTkNJd0pjem9xQ3Uv?=
 =?utf-8?B?akRJcDJNaTJqeWdCWVZkZVJSM2I0eFU5S0xLL3NoRFlNb0gwSVRiRmM1WEVx?=
 =?utf-8?B?OFRxeHlReWphemdJZExSWjFmVVZjYnNLaXMzRCtnQXpLbnRqa1N5Zm9ES1RN?=
 =?utf-8?B?bDFaem9CcjN6WTh2NEs1TDEycGZLWDRnYnBEcCt2YVhtT2hWbVBxWGhXY1hI?=
 =?utf-8?B?TkhHSDhPUWZnWU9tU09abXJqTGFkWC94RHordER1ZnRpeGJDckZaL2QyMDJo?=
 =?utf-8?B?S01jZHk4YmJObENJaFdLdDhjV0I3aVFCSGV0M0t3NkM3M0xkVUFudTVrQ3do?=
 =?utf-8?B?QWZDR1NlNXpocFVKYnl3L0I1TlliZVloQVhPL3AzRnZrRUtuK2d5TEF5azEz?=
 =?utf-8?B?VmpxaGVPYUtseGlIc3VWV3gxZ0hTSzkvTldlZjR2M0QyVnYyQlB2M3NhY2JJ?=
 =?utf-8?B?TkdzWVVMMzR3MWJIZ0xRWkl4bXIvL01CT1VXOFhjai8xVzVtNGdHeWdTbXIx?=
 =?utf-8?B?dkVBVERtTjJ2R1dSaEFnaldWMjRxemo5bDRhTDhGWVh5M2ZJWDA0VGN0dWNa?=
 =?utf-8?B?T1hkZXgwVGRrZHMxQWtDNnE4Vjl6MWF6ZDRVbnFzUGRscWFscDFGSGVvVEdN?=
 =?utf-8?B?YlB2YzFsMzd1TzBjR0R4TnJCR0l5bU05enJnSzZ1S2hxY1N4WEZPdEMvVTBX?=
 =?utf-8?B?cWFhYzFVd1hLWTRiZTFKM01iUy9BT0Qzb1oremZ4aStaQ3pYcEpNL3VzRWtX?=
 =?utf-8?B?bFNxcEVGZnZZRmJOOVk3eWpxT3VJTXg3MUg2RWdCVHFROENBdlV3SlNWMXFu?=
 =?utf-8?B?Y3FXamYwSFdWVkpUUFZidTNKZGUvU2RiaXNsTlluOEVNNEFlZnRuTTdzbXQ1?=
 =?utf-8?B?dWptbWMxM1plRDM0VDdpLzZ6eWlSTGlaV3hYdUUxT3JBODc3ZkhUY1dnY0kv?=
 =?utf-8?B?ZWhSMHF1Z3pYQVJOUUZmdnFjZTRDVStEVmhiR3ZCTU0wMlpwdThuRlcwQkpq?=
 =?utf-8?B?TllFRXZPdkloWTNsemFENkh5MVo4bzh3dFNxS1ZpbVhyeUUwNHBIWXFtNHMz?=
 =?utf-8?B?czMyYlQySmtoUUtyQ00xMXIwSjFnYWlZQld1c1cyaUNYbGtydkdCc21GTUZE?=
 =?utf-8?B?K2lWRm9KWUI4bmNDMTBkYXg3QjhsMERla0hPUnlPdm80ejV5RStYSWVrRC8y?=
 =?utf-8?B?MkhHVlRLeTlDdGlCeHBiZExOclBtbTRPaXYwdWdxQmg3T1hKRy9jdXZNTzRp?=
 =?utf-8?B?M0ZNa01hUFIyRWF2Ky9xQ0RRdWRLOWFsKzBBR252bm5HdEtuNzhpdlM3MndW?=
 =?utf-8?B?S2kyTzdmMGhpbkNiUmdWb05XMUIxdmVXR3V6ZjJuTkQybldyWWlSd1FZd3p0?=
 =?utf-8?B?WWJhY01SN3ZqTk1GZ2pWbDNDbXBYa0JjQzRWdzdTVTVZa01NcTB1UWVKNU92?=
 =?utf-8?B?MWNNeVNKbVZhUGdMRWI0MHJNZldXUGlkN2VtUlluYlFHbkVzNnpjb3JDS0xI?=
 =?utf-8?B?SVJNOGxqeGNxbGJTTXQ2M1gzL0pDdGk4QWRxSit3UGVLU0llNGNSZkJFTHBr?=
 =?utf-8?B?V050ZkR0bWpwT0FMOS9rd01KZ2FsNkdRRllYSFF0RHVQa2RaT3FUUWF2aXBT?=
 =?utf-8?B?a254QXM2SVBENlZmZ2NKWFlDc3JNQ2ZrRTQra3B2T1JJQmhEOFl4N2Y3WUVP?=
 =?utf-8?B?MEZCWTFhSk40SGNrTzdtM01MQmxtcFFXQzZsU3h1Y2JoOXIvNVAzSGF2VWdm?=
 =?utf-8?B?UWJWb09sZDh0a201eXE2UGtUeTRGY2NBbGRDaDFYZjd3UWpOMXEyM3NsRDBR?=
 =?utf-8?B?VkxvODNmdDFMQTAwT1JqTUtoVmliNFpPd1A1WitoOTdUM2ZvcmRwUUYrSDY5?=
 =?utf-8?B?Smc9PQ==?=
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-0:
	Phqj3fau7FKMZ1orO1glD2HfFz5dlk1v0XYLiVx4oMwbUsK+8P30IK4VcxHhnPzYB6DOArsqRAAl55Eb0k4ZpD85HtqDyP2ZUlWftFsm2mXITivTBhwgvy08idzC/BAEZt/K5PKCgFIjyCpIxwT/uWEX2NJ1lb4PaneV/feb1IQ5y7B1yqZpT22foMOcbDahOAgjkaxWty6e3vv2uIkJ7u8uA4lNbS7dKIDYwMf0fAHWggQXL47Jt+UJQJ2AY3X8KJRZxeiXzDfhyeY56VvPbtwUJcym//mchMKMKvUkOYok+vBFt/9KaXR3ziiMHOT7KtgjbsSN2DeX9+fBexWaPmaaNFf7RJ8L08lNjlEgaNFlDEpIlKtvh89Em8K/nQkgu8UkvgMHeINlV3cbRd3mZn9po+ohwM45nq8fgNa8V9vqEbWcjmmDg7+VUxb8iS/fAEuhjNgoEeuVJhfglI2nh+VPl/OWWvCwRKtwJV3IjnjVLZkazzXXhgYvpybrCrH/2OARJUp0Ep0fWVPbxZ1X3rvTi37FsgZdYxbAoSkOQfHF54gySUX+mTj/KXzvteNTVPG1uyp/hDjSwcYLtDvhO+pX7wPAT+lE/iQT0E9pkeNTmQkI5ZvtvE7RY4YIYGE5RljXs8f7ViQEvXh4ckO4IH1T5EAAfGTYYKrna1p/9QuCvu1EDDky8+6ZuYlxPvgtcoBVAo1IWYhEkvERvdY5SvAcxVyIhmphHCzg1l8Agi+NhvmHsC1A8XiMmbG/PV8IbLk2ZfZRqUpWK6G+LZyfw3tmI6hUySySmDy7En0Frd048DpT5wKDZxXuZ3JYs3NSWxjZvCXFh7IQGsq2LhAcB7A0nTON42QTUUT6wXnJYUeFAI5Um22U8wu5AMBm3kaa6FzNWdUGnpJP+f/4UQGHYlYwaEH+wqjR2YqxB8zk1Eg=
X-OriginatorOrg: citrix.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 1452ebec-c9d3-4a96-1380-08db1b293c8b
X-MS-Exchange-CrossTenant-AuthSource: BYAPR03MB3623.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 02 Mar 2023 14:20:12.8757
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 335836de-42ef-43a2-b145-348c2ee9ca5b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: QlTHYe73qEXar8ay0Oy+eOg7nLizP0q9vbYqAXvGDZhc7f71VKAWJ+0vROIwbW6iVCmwsJYuhhW05p3ylRmaRTD1Gu2rIwezCV3pDRBdP9g=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BY5PR03MB5078

On 02/03/2023 1:23 pm, Oleksii Kurochko wrote:
> Disable FPU to detect illegal usage of floating point in kernel
> space.
>
> Signed-off-by: Oleksii Kurochko <oleksii.kurochko@gmail.com>
> ---
> Changes since v1:
>  * Rebase on top of two previous patches.
> ---

Apologies - I meant to ask these on the previous series, but didn't get
around to it.

Why do we disable interrupts at the very start of start(), but only
disable the FPU at the start of C ?

To start with, doesn't OpenSBI have a starting ABI spec?  What does that
say on the matter of the enablement of these features on entry into the
environment?

Either way, my gut feeling is that these disables (if necessary to begin
with) should be together, rather than split like this.


That aside, while I can see the value of checking this now, won't we
have to delete this again in order to allow for context switching a
vCPUs FPU register state?

~Andrew


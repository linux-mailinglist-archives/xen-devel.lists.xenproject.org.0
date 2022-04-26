Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id E70A450FA31
	for <lists+xen-devel@lfdr.de>; Tue, 26 Apr 2022 12:20:49 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.313673.531340 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1njIJ9-0005F6-GV; Tue, 26 Apr 2022 10:20:35 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 313673.531340; Tue, 26 Apr 2022 10:20:35 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1njIJ9-0005Ci-CT; Tue, 26 Apr 2022 10:20:35 +0000
Received: by outflank-mailman (input) for mailman id 313673;
 Tue, 26 Apr 2022 10:20:34 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=urB8=VE=suse.com=jbeulich@srs-se1.protection.inumbo.net>)
 id 1njIJ8-0005Ca-B9
 for xen-devel@lists.xenproject.org; Tue, 26 Apr 2022 10:20:34 +0000
Received: from de-smtp-delivery-102.mimecast.com
 (de-smtp-delivery-102.mimecast.com [194.104.111.102])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 8149ef11-c54a-11ec-8fc2-03012f2f19d4;
 Tue, 26 Apr 2022 12:20:33 +0200 (CEST)
Received: from EUR05-VI1-obe.outbound.protection.outlook.com
 (mail-vi1eur05lp2168.outbound.protection.outlook.com [104.47.17.168]) by
 relay.mimecast.com with ESMTP with STARTTLS (version=TLSv1.2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 de-mta-2-CfLYma4wN4-v4LJADd9CQA-1; Tue, 26 Apr 2022 12:20:31 +0200
Received: from DU2PR04MB8616.eurprd04.prod.outlook.com (2603:10a6:10:2db::16)
 by DB3PR0402MB3802.eurprd04.prod.outlook.com (2603:10a6:8:f::22) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5186.21; Tue, 26 Apr
 2022 10:20:28 +0000
Received: from DU2PR04MB8616.eurprd04.prod.outlook.com
 ([fe80::5cb0:5195:4203:7c2f]) by DU2PR04MB8616.eurprd04.prod.outlook.com
 ([fe80::5cb0:5195:4203:7c2f%9]) with mapi id 15.20.5186.021; Tue, 26 Apr 2022
 10:20:28 +0000
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
X-Inumbo-ID: 8149ef11-c54a-11ec-8fc2-03012f2f19d4
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=mimecast20200619;
	t=1650968432;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding;
	bh=8mF7sdl0jbfeZ0WAUgPUUQdPB6IKJPyJIzvkMw/O2vk=;
	b=kClV7PoNpTaqE86wVw+y2onooiLJwPThAs22jfqRmJfIok+MTdVV/JpmnDN3NC8uDgi6mo
	XxRrFkGeri+Ue45ca2834KI/MhM0lenqqMxJ35xUmig+5y5sz35V8H8Odf+swpm0nJgJ94
	D5uO75Gz83+1K4Gu9XyNbh2MNRr8qoM=
X-MC-Unique: CfLYma4wN4-v4LJADd9CQA-1
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=WhKmIofS9ZOShRW+BUCLulQDksLhhnECYVcp4ZCn15+pKtm0AO7ZWDjDsSY0q0f+ek8zkdiyIIZXD0l6/XJnofUOUAApgC1UFUCyqBPwn1PMW/hk4nA8A5m7+B1xigMBx2QowmLUKlYuQ1Xo2tg+CF43Y+DgdzpYFmkW584fRXvhOslMPC3FtC4LP3KY41WvsslDhfblFiHguU2/xK/pn65UEV09amJmZzW7y2r/I3PZSBbToK7KB+tRY/tQdHdIcoHfrLVdR/V4vPpnoUjTPZ8aLDROy+XVqYaSGl9R/ZqGupGb+NZ6hglJgQR9pBGA49K1YTIe4fqSwqNFREhdpA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=8mF7sdl0jbfeZ0WAUgPUUQdPB6IKJPyJIzvkMw/O2vk=;
 b=SmZYrStnqxHetS1O4zb4nBGnGn49IXxo9uVWkY4ol1jt8/0WBRQPMIfiITo77n1TeadRN1HRAC6XbuECStTh9n0Fewar/E7Sdi6ZGNm0vLx00/MIJXQ9M325kNZ6+rWPXxVj7HVZbjWW+LUZLv+UFSFBVN4LfZyHrwSaiw2IY9bdX2Z873IM/Efu+8lstxXIjgld62NCqIx9fZjhZZavT9loLrr27QSBaRtVr2AUPhfBKjne4xOcgZEQONtSrdkIJ3Z/56RcsJD4P04u6xme9HHSdPgwC3294n9ozyIVPQqb54c5mbLmnvj0jXn15pTAZBVsii/orwtvaEIaid+vIw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=suse.com; dmarc=pass action=none header.from=suse.com;
 dkim=pass header.d=suse.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=suse.com;
Message-ID: <a0f019c5-4089-e19c-6041-044d6e93d80b@suse.com>
Date: Tue, 26 Apr 2022 12:20:26 +0200
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:91.0) Gecko/20100101
 Thunderbird/91.8.1
From: Jan Beulich <jbeulich@suse.com>
Subject: [PATCH v3 0/8] x86: more or less log-dirty related improvements
To: "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>
Cc: Andrew Cooper <andrew.cooper3@citrix.com>, Wei Liu <wl@xen.org>,
 =?UTF-8?Q?Roger_Pau_Monn=c3=a9?= <roger.pau@citrix.com>,
 Juergen Gross <jgross@suse.com>, George Dunlap <george.dunlap@citrix.com>,
 Anthony Perard <anthony.perard@citrix.com>
Content-Language: en-US
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: AS8P189CA0027.EURP189.PROD.OUTLOOK.COM
 (2603:10a6:20b:31f::28) To DU2PR04MB8616.eurprd04.prod.outlook.com
 (2603:10a6:10:2db::16)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 3da4a929-3b05-4ece-d1b4-08da276e62df
X-MS-TrafficTypeDiagnostic: DB3PR0402MB3802:EE_
X-LD-Processed: f7a17af6-1c5c-4a36-aa8b-f5be247aa4ba,ExtFwd
X-Microsoft-Antispam-PRVS:
	<DB3PR0402MB38025CC6F923C64C6A5B60AEB3FB9@DB3PR0402MB3802.eurprd04.prod.outlook.com>
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	ZLW0Pu/lgFwTPEApEDWqJqo2/I+vcxqAjBlUzfxNDRiyzZUg1biqk5UNypjo0+D0FRUHxZf6UT4AG0BjdZ9J7lpF7KUghHkEuBWiZfeY+YKYKaYtoTi6VTmx4IG4/BNN3zGMeGidmPdp2Ht1IrO/GOUMxi5H96oaQfWa7VZpo5ftztpDvLjpVhrbgmNhLrFD0SwTVcwcaivasTq2Aavj09wewsDaSwtcFSb/H9XpYtu/eTbLbnlZAP2y1a9HDCQa5/2qUhM0GG6IX0UqY4CAesm7+9LwBDhSVRGLdERaU03mbG/Tg77ZDOH213LdKADlluoVZUYSxK31SXcbOqPqVkeFfIcaMUDit3I1moZCSY8s7BG0RNw3CABxOwt6gWnHD+uznNGxp2pU0+xOmpJ2+b/eE3IxLKoRMXLH7+vDHyC3gfd+EB0bgX//S4EDvQgmMOAMvIb00CGTTkGzFXfISnXdgevwPXMNzW/xd4jiW2dWvmMjweO3i0oS9GpTs2rgEeG91Uw9TYu6+nBEfRMvGzjxTtDlmz7aJRfcCa7abiRZYf5IOp2EI39b8oDT0ozBspYRBsbIIML8LbVseS0ANy28Zk8WZflFEn6aZhhX1cdQXi6hi2eIl/8eJng6oshlJlq7TpcVpLQvrnJE7GjZeZenn+6Ong2S4BWQnfRnagCLaV5uv9uGwX6vT+Dr9PscEelpljaUFCS0/xoNy03I1PUOalwhiQxX6J+b3blI3Uj/OMlFPWv/+S0xGhgDLEfT9GD7+TB0ANOXk1JXX3Zwyg==
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DU2PR04MB8616.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230001)(366004)(2616005)(8676002)(66476007)(4326008)(186003)(36756003)(31686004)(316002)(86362001)(66556008)(66946007)(31696002)(8936002)(5660300002)(26005)(6512007)(6916009)(83380400001)(6486002)(54906003)(6506007)(508600001)(38100700002)(2906002)(14143004)(45980500001)(43740500002);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?NUF1Tmw0VkVzMURRejE5M0Ivb3NmZEI3K0Zod0R1MXlGNmpBK0prYWdTZDh4?=
 =?utf-8?B?bE5pUUQ2dnFCaXlBT0crZGJEbng3dzFoemVlRXhzVGtrMytGbkRqNEZKc0tr?=
 =?utf-8?B?NXdacXV2L0hmYjFnYk45V3Q1V0tndlh1bGp1SER0RDdoVGVZa2tFNHo0bXY1?=
 =?utf-8?B?d1ZySW9ZUkpEM2UrckgrSDQ0eHJNWlJ2THpGTmNEZGFsUDUvNmd1NGVBRHgw?=
 =?utf-8?B?RlJyd3ZVMDA0RVNYUHozS01lTmZjblQrVWxGbHhiakkvUEVYSFpELzNUUkg2?=
 =?utf-8?B?YjBURkdmR0xsVXVJSU1JejF4RWNVU2pheGpzdXUrWHlPMDNsWkxvRWxDL3I2?=
 =?utf-8?B?UEIxazcyYnJSeFBQUnArWm84UEtiN1FjOHJYNFNFMmNuMnN4NU40UDdpcXVm?=
 =?utf-8?B?b0ppRE4wdEpCMElCUTNpK3NmZjFUaEFFR1F5ZlVZdVBpSE40dTNoSzlXRkE2?=
 =?utf-8?B?S3FhRWsrRGZlaFB5NVBlN0lVMUdFWk1XMEJQMVlHa0FDcWppSXN6dGRJc0NN?=
 =?utf-8?B?ZmxMWXlQVHgrcnQyakw0b3JtZDZyU2N0ZC96N1BNa291b25OdG9JN2JRdE5F?=
 =?utf-8?B?Z041d1IveVU5RWVjeXlxREp3ZUo1T1VZbHBrK21XTGFOMkxaRmJvMHM5MFJX?=
 =?utf-8?B?TTFEek5sMjVxVmtpNklTdllza0xPaFN6ZUl0N2RUM3BkbjBtbzVvdUNkWmo4?=
 =?utf-8?B?dlNSeTUvSFJCU1ErVGV4VC90NmF1NytsUys1VlVoTTFiRGMvWTFsenpZamdn?=
 =?utf-8?B?cm1xaXppdkQwUHhtQmNUOXgrSG9SSVAvcDZDbVBvS1F6VEo4OTYvMDBjaTJS?=
 =?utf-8?B?SUtEMU1NRWJBdDRBSDU5bEpNalR6b0hSR05iV3dHUlRoR3BEdUpUdWM0bkls?=
 =?utf-8?B?UnU4NGhnbGhGY2ZIZlVnR3ByTHIxQlZDQk9sWmtDME5HdVFBUW0xc1gwQXJN?=
 =?utf-8?B?SXFLSEE5V3BSaDdZSWE2L2xBakRQVXhheVR3cEx0SXV6dFBQRTJ1TWJtcjJM?=
 =?utf-8?B?VFVVN0Y4cjFOOWcxT2Y1eGlGb0R5VytTeS9MdVNpbVJ2RzNKUzdMdFhBNG5G?=
 =?utf-8?B?ckQzV05VcHNiTHYzTDh6MFhSZC9yRkpzMERkWUJVKzU5bFBpTFJDYkYzZXIw?=
 =?utf-8?B?cXRwWWNIZnl6NkU3bFVqV0VIWGE0eU9VK1JFbVlyamQ1QlV3UldXYi8zRUV0?=
 =?utf-8?B?dDRHRlJkYWZCSDRObEY1KzRZeXlRYnJwZTlaR1BPaDN0ME02YUhaZDFjYTZ3?=
 =?utf-8?B?R0FJQTVYalp6VmErV2NKanJlTTR3dENzdS9sU2dBd2huMVhWNE5ac2hJN1lH?=
 =?utf-8?B?b24yR1hPaVNQaitTRDRJMExVU1ZucnJRUjhLaDFCVkRBWllpazhLYzNnMWFR?=
 =?utf-8?B?dFQwNlNtRjBXaVJIMkhaTkYxaEkyR2FEMnkyQzhwdi9jQk5tYmQwcVd6bStZ?=
 =?utf-8?B?WitnNDNQTXgreVNoQXpMcmE2VzlGWVRLcmtmR3lXT2pmcnBOMHRrcFBxNE5a?=
 =?utf-8?B?R1d1cVZJaVFjL0d1SUM5Kzd3ZXhGb3NuclNRSjJ3dnBLeFBoUmNGVm1ROXlD?=
 =?utf-8?B?YUV5ZldkVVRvRUZSSVNkcVY5NERoOENTMTZDYStFYnJGdVFOblhXblh4VExh?=
 =?utf-8?B?Qmd6YXNXSGRiSk9rRXphL2hZK29FQTVzb0pQTUN6aHBxc1RJMkQ0TGlFVDRZ?=
 =?utf-8?B?R0lkdXVkMkt0dHEzWkxEd2JBUzZDUFJOT1djYzNuamQxbFNFV0ZUZWZjOHo3?=
 =?utf-8?B?amEwWEpQMHJjcjRGQUtOdlpjVE9DUURoa3lKbGpjVXk3UytabjM4NG9nVEJO?=
 =?utf-8?B?ZG53cE9iK3p2bDJwaFBsTDR4M0h4WjVnUldsN3ptSEFYbVV4V051cXA2dDNE?=
 =?utf-8?B?cDZ0cWtBTm5RbUZyTzJWMlgydEtocWNhcnUrdWZvTVdYdWQ3WEk4bExudEtR?=
 =?utf-8?B?N1FLZlJQelNQK0t6SHlYdFpCeE5GVzNHazVFM011S1RyZ3lYSEFQVTVjSHNu?=
 =?utf-8?B?akNERk1OZnA0MUw5ZUhtT2JhVmVLcnhZTElOSTlJWHE2YUVBelVwY3gzR0k2?=
 =?utf-8?B?TUE2Q1BsSkREK2gydkU2RTZnajNMeVYyNnV5VWxBbTFSMXJKNkpSQ0FRMldO?=
 =?utf-8?B?ZUo0ejZTYTZQdDh3RFhYUG1zUER1bjdFWVBuaDBTMWozMHB6UDlUdTYwelpJ?=
 =?utf-8?B?SzlJazVRdmdsemtmUUs2K1pNTGNlc3NwQzFXaTFpdTlWQ05JTENqTm1IWVpx?=
 =?utf-8?B?bmxlb3VxWVk3djY4cXhPc0VacVFPMFFkRm5QSDY1YmdZSEN1OTRtWTBPVzRj?=
 =?utf-8?B?SDlidCs1L2NKbHYwalVpUGY2U0g2bzFtWFFJSTNvWEF4VUtBRUIrZz09?=
X-OriginatorOrg: suse.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 3da4a929-3b05-4ece-d1b4-08da276e62df
X-MS-Exchange-CrossTenant-AuthSource: DU2PR04MB8616.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 26 Apr 2022 10:20:28.6161
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: f7a17af6-1c5c-4a36-aa8b-f5be247aa4ba
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 4K3BDar9uOuBMOFRttqipKstCslqDGlqwsWzNrx7nKxf+vZxHGmySmW3Oeu2EYrpO6R0N3mNDT+TVVnfKSahHw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DB3PR0402MB3802

... or so I hope. This series continues the attempt to deal with
the ovmf change putting the shared info page at a very high address
(which is now planned to get reverted there, but the general
problem doesn't go away by them doing so). There are further issues
with truncated value, which are being dealt with here. But there
are also not directly related changes, when I simply spotted things
that aren't very likely to be right the way they are. And then
there are also adjustments to the underlying hypervisor
implementation, with the goal of making the returned data more
useful to consumers.

With these changes in place, a 1Gb guest which has "inflated"
itself by putting a page right below the 16Tb boundary migrates
successfully, albeit the process takes from some 20 minutes to over
half an hour on my test system.

No significant changes in v3 (individual patches have details); a
controversial patch was moved later in the series.

1: libxenguest: short-circuit "all-dirty" handling
2: libxenguest: avoid allocating unused deferred-pages bitmap
3: libxenguest: guard against overflow from too large p2m when checkpointing
4: libxenguest: restrict PV guest size
5: libxenguest: deal with log-dirty op stats overflow
6: x86/paging: supply more useful log-dirty page count
7: x86/mm: update log-dirty bitmap when manipulating P2M
8: SUPPORT.md: write down restriction of 32-bit tool stacks

Jan



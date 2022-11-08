Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 3B512621A41
	for <lists+xen-devel@lfdr.de>; Tue,  8 Nov 2022 18:16:11 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.440351.694534 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1osSCT-0008EM-Qm; Tue, 08 Nov 2022 17:15:49 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 440351.694534; Tue, 08 Nov 2022 17:15:49 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1osSCT-0008Bg-Nq; Tue, 08 Nov 2022 17:15:49 +0000
Received: by outflank-mailman (input) for mailman id 440351;
 Tue, 08 Nov 2022 17:15:47 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=f5nK=3I=citrix.com=prvs=3047eb21c=roger.pau@srs-se1.protection.inumbo.net>)
 id 1osSCR-0008Ba-Gb
 for xen-devel@lists.xenproject.org; Tue, 08 Nov 2022 17:15:47 +0000
Received: from esa3.hc3370-68.iphmx.com (esa3.hc3370-68.iphmx.com
 [216.71.145.155]) by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id fa91e17a-5f88-11ed-8fd1-01056ac49cbb;
 Tue, 08 Nov 2022 18:15:45 +0100 (CET)
Received: from mail-bn8nam11lp2169.outbound.protection.outlook.com (HELO
 NAM11-BN8-obe.outbound.protection.outlook.com) ([104.47.58.169])
 by ob1.hc3370-68.iphmx.com with ESMTP/TLS/ECDHE-RSA-AES128-GCM-SHA256;
 08 Nov 2022 12:15:42 -0500
Received: from SJ0PR03MB6360.namprd03.prod.outlook.com (2603:10b6:a03:395::11)
 by CH0PR03MB6051.namprd03.prod.outlook.com (2603:10b6:610:be::22)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5791.27; Tue, 8 Nov
 2022 17:15:40 +0000
Received: from SJ0PR03MB6360.namprd03.prod.outlook.com
 ([fe80::d197:992c:4dca:3c4c]) by SJ0PR03MB6360.namprd03.prod.outlook.com
 ([fe80::d197:992c:4dca:3c4c%6]) with mapi id 15.20.5791.025; Tue, 8 Nov 2022
 17:15:39 +0000
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
X-Inumbo-ID: fa91e17a-5f88-11ed-8fd1-01056ac49cbb
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=citrix.com; s=securemail; t=1667927745;
  h=date:from:to:cc:subject:message-id:references:
   content-transfer-encoding:in-reply-to:mime-version;
  bh=h//GSKAi45ckFybYQCp2StpEkuIRauJw1nlDC+qmLuw=;
  b=DzVzC+hvu09/C+WIl0/LxN1NhLcKTsZR9UG9VWT6bLrxnm4fpXjIf+Th
   jIhynv/EGRy25NUPP309TthXVbyffAR8ZCY58ZV0VVXaXuH/EdtcmYDce
   2GcYYiKKJlRE8jEnqE7RJmiytQ+dcwKiKj1RMi+HnOhk7MunW8owqlAMT
   c=;
X-IronPort-RemoteIP: 104.47.58.169
X-IronPort-MID: 84409542
X-IronPort-Reputation: None
X-IronPort-Listener: OutboundMail
X-IronPort-SenderGroup: RELAY_O365
X-IronPort-MailFlowPolicy: $RELAYED
IronPort-Data: A9a23:JJBLkK9Gm4fr+PYBM3wiDrUDs3+TJUtcMsCJ2f8bNWPcYEJGY0x3z
 TAbUT3SO6qOMDTwe9p3a9ni9k4GsZ7cyYdmGlA5/Ck8E34SpcT7XtnIdU2Y0wF+jCHgZBk+s
 5hBMImowOQcFCK0SsKFa+C5xZVE/fjUAOG6UKucYHsZqTZMEE8JkQhkl/MynrlmiN24BxLlk
 d7pqojUNUTNNwRcawr40Ire7kIx1BjOkGlA5AZnPKgb5AW2e0Q9V/rzG4ngdxMUfaEMdgKKb
 76r5K20+Grf4yAsBruN+losWhRXKlJ6FVHmZkt+A8BOsDAbzsAB+v9T2M4nQVVWk120c+VZk
 72hg3ASpTABZcUgkMxFO/VR/roX0aduoNcrKlDn2SCfItGvn9IBDJyCAWlvVbD09NqbDkkVx
 6QTFSBONiq8vO6wxuu1ZftwhukaeZyD0IM34hmMzBn/JNN/GNXpZfWP4tVVmjAtmspJAPDSI
 dIDbiZiZwjBZBsJPUoLDJU5n6GjgXyXnz9w8QrJ4/ZopTWDilUvgdABM/KMEjCObd9SkUuC4
 HrP4kzyAw0ANczZwj2Amp6prr+TwXuqBd5IfFG+3tI2n33IzTIfMQQXUFzqoMKmpX67UOsKf
 iT4/QJr98De7neDTNPwQhm5q36spQMHVpxbFOhSwCGAzLDFpTmQAGcsRyRELtchsaceWjgCx
 lKP2dTzClRHoLCTDH6Q6LqQhTezIjQOa38PYzceSgkI6MWlp5s85i8jVf5mGa+xy9fzSTf5x
 mnTqDBk3utCy8kWy6+84FbLxSq2oYTERRI04QORWX+56gR+Z8iuYInABUXn0Mus5b2xFjGp1
 EXoUeDHhAzSJflhTBCwfdg=
IronPort-HdrOrdr: A9a23:dMEqgKp19zvNEFerlKGzFAUaV5rReYIsimQD101hICG9Evb0qy
 lhppQmPH7P+VIssRQb8+xoV5PufZqxz/BICOoqTNKftWvdyQiVxehZhOOP/9SJIUbDH4VmpM
 VdmsZFaeEZDTJB/LvHCAvTKadd/DFQmprY+ts3zB1WPH9Xg7kL1XYfNu4CeHcGPzWvA/ACZf
 yhz/sCnRWMU1INYP+2A3EUNtKz3eEixPrdEGc77wdM0nj3sQ+V
X-IronPort-AV: E=Sophos;i="5.96,148,1665460800"; 
   d="scan'208";a="84409542"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=fdUWhzwYFLbf94YHHSwHkbAhauXOZkx4NNRI2NGx96mBKHodicdRODuVLx1XXnqb0dH4kvZz5cmgoXPxEoYqlr0r2PBMeoH08lMucXXiVu6IS+S5IS7YhIdRGfZXzJH1aUorHfI3UiGm3FokO3reQRrzgngrAU0mqUv0xfOh4WciwClh3NSds8+8kSiWTNW2AvmE1fOqRN3xc3XCTwD3HAYlTX0rXdJi/Gqszfy084MBiI7Dqam7VoxkL19iQTe93rZkFICr06Ja4bLmcxkwA+eUQStvQYs0LF8uBnwcPvXZkGJxlFUmuO9KAlcASq2oc/THCXbw5n7c102kF0K6pQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=V9+hvvG2mqZMLMmDMzXi42EbSUyCbjQSm+0O55VfEdk=;
 b=E6UQxgloCfJlBZh+xJcjufDRbE7UDPF3fqBc72lMYseMSpoT0KgrjAsjTeHKt2SHY81IWijxaH2XBi1D9byEfc4VBHInxKhAk1Xs7VhyfjfcOQfVusigN32mQklQPWc1XCuy4rlUNQIhcuPvyarYPNY19e4ncPPLGnDElSg8sQsc+uzqW5E0PaT6MRfI/DqRbfGgE+zT8KRa/S0THabDqgkmHzRlgqquIVIfF+hsvN58HokmaCa8WzrqyL59YFNGUN4MPsVB9nEYyD/84MHm68Iu+KAKrj80rq0sg509FDn6vwwPzxaBpverZ1zSAvRjC1QOC4FFRDfKBbSMTsjSGQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=citrix.com; dmarc=pass action=none header.from=citrix.com;
 dkim=pass header.d=citrix.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=citrix.onmicrosoft.com; s=selector2-citrix-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=V9+hvvG2mqZMLMmDMzXi42EbSUyCbjQSm+0O55VfEdk=;
 b=v0W/tyE8lYd8Boy116ZWCwaCjzSvnAEnqkT2UJwwk2nJgiVOoT1bZiLaRQn+ENoDGaSkhiFqL1J/u/K8emHLPPVj4aJMWfhYapG3PUK4yHvyUkDRi3XrKEvuM30NsKQxQwqQUSg0v2N/GEAQcPw2sR6m4ibjq+hYnoBL1YR8XFw=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=citrix.com;
Date: Tue, 8 Nov 2022 18:15:33 +0100
From: Roger Pau =?utf-8?B?TW9ubsOp?= <roger.pau@citrix.com>
To: Jan Beulich <jbeulich@suse.com>
Cc: Henry.Wang@arm.com, Andrew Cooper <andrew.cooper3@citrix.com>,
	George Dunlap <george.dunlap@citrix.com>, Wei Liu <wl@xen.org>,
	Edwin =?utf-8?B?VMO2csO2aw==?= <edvin.torok@citrix.com>,
	xen-devel@lists.xenproject.org
Subject: Re: [PATCH for-4.17?] x86/paging: return -EINVAL for paging domctls
 for dying domains
Message-ID: <Y2qOtSyuM43RfwAx@Air-de-Roger>
References: <20221108113850.61619-1-roger.pau@citrix.com>
 <ae400ea9-ae42-9876-9c53-bf91ddc08a51@suse.com>
 <Y2qHOfemg/wrc07N@Air-de-Roger>
 <58d5e890-e052-47df-42bb-6cc84aedd4a9@suse.com>
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <58d5e890-e052-47df-42bb-6cc84aedd4a9@suse.com>
X-ClientProxiedBy: LNXP265CA0033.GBRP265.PROD.OUTLOOK.COM
 (2603:10a6:600:5c::21) To SJ0PR03MB6360.namprd03.prod.outlook.com
 (2603:10b6:a03:395::11)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: SJ0PR03MB6360:EE_|CH0PR03MB6051:EE_
X-MS-Office365-Filtering-Correlation-Id: 6a7b2aba-f3de-4c77-e571-08dac1acdbfa
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	Yhu978zGOsyp+t1q89AyvlMpFB3PQLHu0vuZdvz9qWTrK4YAS+vh1uCPcgv1tgjv/eKiwZve9cjdKwVrkolSb85uVve4meTPhvT74kjxKdeGvdv6xvfFnek3PuAKGmASub6sSV0ByMIbg2Z6F+zZU966qmKHpQAfFZtOulW1s5W4k+ym9kcEDUFPri5uGR31RJD1AnaDCnMVZbPVolY+jUZarej1WwpU+Z7VDLLAt4S4WFrgugaWDY63PzRsUL/qzL8v08xixsEHjqLVG94WWwuz+L7nxY76NO28B4DNghgmcEHHf0DoyA2bPkhsuhXfM8fnDnzDg2DDvuHWUECdkAYN8ZNJf9j8cJ+XVVCCvoJCtDq9RevQUv0NrlzNRoyQoNnF/ZGjDOwHBEtsj46m9vk8unld2NZm7WrtwysCAcoS6wwcSZICxkBixVEn9JFeFOsEBb7rohy1iP0LsX3P6g8OY2MtY8GhV2OaDxW3H8mKbZrfUrZsXqasoO+KZr0ik4TUlgk/tAa25gljgRFpP2uVMbTeH7Omi+PEravQLlkbimNvk42YdoDI0xxBighIIDyhyIa2ZM9HXFU3ddMBm1dd8aCuvhlFRYWkIXjLYCbAii+8gulsWjxOJrsI2I0cQB+4PbEksfda20UapBorHZyRYapjMpa/1gVHXaKpb8GCfu6bID7/Tk0v36oNfnsiaULoiSfPKNfwUQxLDjGB/g==
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:SJ0PR03MB6360.namprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230022)(7916004)(4636009)(376002)(39860400002)(396003)(136003)(366004)(346002)(451199015)(4326008)(8676002)(6666004)(83380400001)(316002)(2906002)(85182001)(86362001)(38100700002)(6506007)(33716001)(82960400001)(53546011)(66946007)(66476007)(66556008)(9686003)(8936002)(6512007)(54906003)(6486002)(41300700001)(478600001)(186003)(26005)(5660300002)(6916009);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?dm9CNHExc3BpelBHbUI4MGk2V09xNnFLYWkvVUFPY2M2ZnNKS0k2K0RzV0Fm?=
 =?utf-8?B?ZC9yM2xRSEhlRHp2QlcyU2dyY2VZcFh4Y2IwTWVRQnZqbVdlT1g1YTlCY2xB?=
 =?utf-8?B?djRZdDZ1eXM1bTJiWVk0VVBCc012WUxqQWllVTlPeDRTdS9nRWpjcXVyb2hW?=
 =?utf-8?B?MmNUMTVFUDV1M2M5dlFEOUdqRGhzZllUL0F3QXl6QVFwWC9rVWxXOEdyV0RR?=
 =?utf-8?B?OXdRTE10akFQMGN0U21iNWJXU2l3K2ljL1dSSlNyUGZub1BERThkcVdXTnVD?=
 =?utf-8?B?b2xydTZkdWNSck1yQXNOR0xzTythWit3bUFqVGZCU2hEazhlOENmV2Z0MVBO?=
 =?utf-8?B?MEVvMWM1ODlNRkNMbFlaVkxZc2VJb29TOWtQYzlrTmVVVGZESHJGeC9HL1NN?=
 =?utf-8?B?Q0tGdjZacyswSmIwQmgwWis1VVhQZk4vd3hkWU9kOXR0SFZlRmhnWWZ1M3kr?=
 =?utf-8?B?Y0pyVDJhQzZnaFdDdDdnREZLdGE5NHhyS2VMTGJqTHIwOGloNkg4VnFHSjlG?=
 =?utf-8?B?T0tBZWd1UVRwbXNjNGdRMXBaRkZkQWJPdkZvdm9BdU50dTRXTzJMU0s3ZFJW?=
 =?utf-8?B?cy9SM1EzQmhBaWtTV1pQTEJrdkJDVHp0bE01SGQycWpkd1ZiQUNCcmhHR2ND?=
 =?utf-8?B?QUZmaDhtd3VueFF4K1MwSTZXRklFeXo1aDUyZFg2eTJ5UDRRbGlEN3BDT0Q2?=
 =?utf-8?B?Y1BJeFVPWXltQTltaHVhRE9uYXdjZzFUMWVUay91T2psY0FvZTBYRWEvOUNJ?=
 =?utf-8?B?dHVnbklQK0FyVEc5aWJkREYzdzFubWRUdzErRzc4Njd6TXVTcTIyc1J2aGZs?=
 =?utf-8?B?S3JGL3FUU2U1bXBTdHFTZzhSVURhRXp1UU50NC96bk1CN0lRdmlxTW1FS0VD?=
 =?utf-8?B?YXZnR3RoajNheDQ1K29DcUFhbW9zNDVGRmNNeFB6WnB2STY4Y2F1elcyVlFs?=
 =?utf-8?B?cjBYTjhmbGpiY1piYnpwcXJLR2k1T3p2K0NtUUpNWXdOVlBTM0JpTGFwZEcr?=
 =?utf-8?B?MW5Lai90WENRMTdsVWZlbFZQclhlRU1WSnl4ZWlmTkdTVDdrWmt1UUVlSkU0?=
 =?utf-8?B?dnVlLzVVZ1Zoa1FUVlNyK1ZMWGRaMlZDa1c5a3d4cHBJSXlRMjRrQUhrQVNP?=
 =?utf-8?B?VTNmcW93QUpwNlptSUd4MStUSWp5R1RNN1lkRk53b0V4eEhzOUpSMXdPc0pC?=
 =?utf-8?B?WU44cUw4MTBSdXYrMWpJMEFKblh3ZDhhaGVRU1FtbVJzTnlUY3hSTTdiTitn?=
 =?utf-8?B?QXBuYjF5WUtZUFM1QnFNK3I3YjNwMDkyQlFuVTNBWjVSSGNRUkV6aVp4TWZW?=
 =?utf-8?B?OTJGNzJrS2FLbGxqd0NjRlhDa3JDUk9aYk1wRUtCdlkvVTk1SjhTMkh2S28z?=
 =?utf-8?B?aTB1ZWMydWZLVUNJaGJkMmhLYUdpSzFDcWZkUlZ3UFVTNFduOCtFdXlnSDFZ?=
 =?utf-8?B?dlE5NVNONkxlRE5Ta0didlA5NWYvZXBsckRDODlLU250ejlPSlU1bVBqb3VH?=
 =?utf-8?B?UlFOYUV6Z0pxdHM5TktiRlF6VlJWWHFQL25ya21qZmpkK2Q4aGNOL0ozcHo2?=
 =?utf-8?B?cnBRV1JZeTJXM3AwN1RYNFgyaTZBZkk1L1VRZzh0d2NVMjdTOVFxMXUxR3Vm?=
 =?utf-8?B?NjN2MklTNzhRWGVPaDBvOEVSbWNRdFpUMkFhbWJVZzNMdHRya0o3K0I3clIr?=
 =?utf-8?B?VHhrZ3lUMXo5c1ZnSmhsaG9vYTVCRDJicHlGRWEwWEkrajRuT3lNa2kyWUp1?=
 =?utf-8?B?TmJrcm40UlBHTzJOMm45RFJhOGJjeWFCNzlLOXMxOWFpY0xsSmVYaXpKcXlo?=
 =?utf-8?B?QjlpbnB6Zm9uMnYweFptN3F0VE5oR0lTZWdYZmNPTWFYOXNEK056dGVEa0xi?=
 =?utf-8?B?dEVHNG5wdEpTNnJHUlFKcFB2RGZwV0xFWHJ0VGRyU2JycVk2M1JkOERmTUt6?=
 =?utf-8?B?dEdsZXJIdGdzY1M2QTlxZDlSN0svaG40Ny9FUGQxSXU2SkFFSlNYUllIamls?=
 =?utf-8?B?RkpBMGVURFNCN1BnMXhuRHFWbTdzZllwK29vRXY5MEowemcyemhQYnNxWmtX?=
 =?utf-8?B?bUFUSE9CMFZxakwzNm40dVRlV1JWY0NqR0V2b0FrcEU0T29OY25aWG1JdDJY?=
 =?utf-8?B?ekJYRWpybjB6WW1HNFZqWENMWG5HN05TZkk3L3FjT3N3YVlzaTZDdTI0NnJ2?=
 =?utf-8?B?THc9PQ==?=
X-OriginatorOrg: citrix.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 6a7b2aba-f3de-4c77-e571-08dac1acdbfa
X-MS-Exchange-CrossTenant-AuthSource: SJ0PR03MB6360.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 08 Nov 2022 17:15:39.7878
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 335836de-42ef-43a2-b145-348c2ee9ca5b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: NeEszOGYCupYvpKCW/p2V7WXVQCP96YB87B+0ZvJxoNpqQz6wmCZdvefGbHGUtOEE6gdS2YTEvmCp2pmFYDX8w==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CH0PR03MB6051

On Tue, Nov 08, 2022 at 06:03:54PM +0100, Jan Beulich wrote:
> On 08.11.2022 17:43, Roger Pau Monné wrote:
> > On Tue, Nov 08, 2022 at 05:14:40PM +0100, Jan Beulich wrote:
> >> On 08.11.2022 12:38, Roger Pau Monne wrote:
> >>> Like on the Arm side, return -EINVAL when attempting to do a p2m
> >>> operation on dying domains.
> >>>
> >>> The current logic returns 0 and leaves the domctl parameter
> >>> uninitialized for any parameter fetching operations (like the
> >>> GET_ALLOCATION operation), which is not helpful from a toolstack point
> >>> of view, because there's no indication that the data hasn't been
> >>> fetched.
> >>
> >> While I can see how the present behavior is problematic when it comes
> >> to consuming supposedly returned data, ...
> >>
> >>> --- a/xen/arch/x86/mm/paging.c
> >>> +++ b/xen/arch/x86/mm/paging.c
> >>> @@ -694,9 +694,10 @@ int paging_domctl(struct domain *d, struct xen_domctl_shadow_op *sc,
> >>>  
> >>>      if ( unlikely(d->is_dying) )
> >>>      {
> >>> -        gdprintk(XENLOG_INFO, "Ignoring paging op on dying domain %u\n",
> >>> +        gdprintk(XENLOG_INFO,
> >>> +                 "Tried to do a paging domctl op on dying domain %u\n",
> >>>                   d->domain_id);
> >>> -        return 0;
> >>> +        return -EINVAL;
> >>>      }
> >>
> >> ... going from "success" to "failure" here has a meaningful risk of
> >> regressing callers. It is my understanding that it was deliberate to
> >> mimic success in this case (without meaning to assign "good" or "bad"
> >> to that decision).
> > 
> > I would assume that was the original intention, yes, albeit the commit
> > message doesn't go into details about why mimicking success is
> > required, it's very well possible the code relying on this was xend.
> 
> Quite possible, but you never know who else has cloned code from there.
> 
> >> Can you instead fill the data to be returned in
> >> some simple enough way? I assume a mere memset() isn't going to be
> >> good enough, though (albeit public/domctl.h doesn't explicitly name
> >> any input-only fields, so it may not be necessary to preserve
> >> anything). Maybe zeroing ->mb and ->stats would do?
> > 
> > Hm, it still feels kind of wrong.  We do return errors elsewhere for
> > operations attempted against dying domains, and that seems all fine,
> > not sure why paging operations need to be different in this regard.
> > Arm does also return -EINVAL in that case.
> > 
> > So what about postponing this change to 4.18 in order to avoid
> > surprises, but then taking it in its current form at the start of the
> > development window, as to have time to detect any issues?
> 
> Maybe, but to be honest I'm not convinced. Arm can't really be taken
> for comparison, since the op is pretty new there iirc.

Indeed, but the tools code paths are likely shared between x86 and
Arm, as the hypercalls are the same.

This is a domctl interface, so we are fine to do such changes.  I
understand that we want to avoid such interface changes as much as
possible, but I think we need to fix the hypercall to return error
codes rather than implementing workarounds to try to cope with a wrong
interface behavior in the first place.  Or else we could be
accumulation workarounds here in order to fool caller into thinking
the hypercall has somehow succeed, and provide kind of suitable
looking data for the output parameters.

> >> As a minor remark: _If_ you're changing the printk(), then please
> >> also switch to using %pd.
> > 
> > I've considered this, but then printing: "Tried to do a paging domctl
> > op on dying domain dX" felt kind of repetitive to me because of the
> > usage of domain and dX in the same sentence.  Anyway, will adjust.
> 
> Simply drop the word "domain", as we've done elsewhere when switching
> to %pd?

OK.

Thanks, Roger.


Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 9D50870DCEF
	for <lists+xen-devel@lfdr.de>; Tue, 23 May 2023 14:49:27 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.538482.838438 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1q1RRr-0001Tl-0R; Tue, 23 May 2023 12:49:07 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 538482.838438; Tue, 23 May 2023 12:49:06 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1q1RRq-0001Re-Tq; Tue, 23 May 2023 12:49:06 +0000
Received: by outflank-mailman (input) for mailman id 538482;
 Tue, 23 May 2023 12:49:05 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=qOGL=BM=citrix.com=prvs=500b25f39=Andrew.Cooper3@srs-se1.protection.inumbo.net>)
 id 1q1RRp-0001RW-LA
 for xen-devel@lists.xenproject.org; Tue, 23 May 2023 12:49:05 +0000
Received: from esa2.hc3370-68.iphmx.com (esa2.hc3370-68.iphmx.com
 [216.71.145.153]) by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 2c68d8d8-f968-11ed-8611-37d641c3527e;
 Tue, 23 May 2023 14:49:01 +0200 (CEST)
Received: from mail-dm6nam10lp2108.outbound.protection.outlook.com (HELO
 NAM10-DM6-obe.outbound.protection.outlook.com) ([104.47.58.108])
 by ob1.hc3370-68.iphmx.com with ESMTP/TLS/ECDHE-RSA-AES128-GCM-SHA256;
 23 May 2023 08:48:52 -0400
Received: from BN7PR03MB3618.namprd03.prod.outlook.com (2603:10b6:406:c3::27)
 by MN2PR03MB5120.namprd03.prod.outlook.com (2603:10b6:208:1ac::17)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6411.28; Tue, 23 May
 2023 12:48:48 +0000
Received: from BN7PR03MB3618.namprd03.prod.outlook.com
 ([fe80::f930:7d2:9ec6:fe3d]) by BN7PR03MB3618.namprd03.prod.outlook.com
 ([fe80::f930:7d2:9ec6:fe3d%3]) with mapi id 15.20.6411.029; Tue, 23 May 2023
 12:48:48 +0000
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
X-Inumbo-ID: 2c68d8d8-f968-11ed-8611-37d641c3527e
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=citrix.com; s=securemail; t=1684846141;
  h=message-id:date:from:subject:to:cc:references:
   in-reply-to:content-transfer-encoding:mime-version;
  bh=X/nPEb9G4LjMOi1yfKSgDLkmh3WnvlncUMic08Ivb9k=;
  b=D2OOc/BdYfJOPcO4TG6dYo8UYzavm4jsks6kJyJLoLSXvJoZGj56MRee
   OGNgumkTVnjiRaXST71ByDnwgPWlDEtcBREZI+icz7yoxorEh+cakAMn9
   keY3/LMngNeMqg3mpu0ziE0SXXaH1NXLmDS6/iwOo5Dny3JsowFoxAWtp
   g=;
X-IronPort-RemoteIP: 104.47.58.108
X-IronPort-MID: 109949730
X-IronPort-Reputation: None
X-IronPort-Listener: OutboundMail
X-IronPort-SenderGroup: RELAY_O365
X-IronPort-MailFlowPolicy: $RELAYED
IronPort-Data: A9a23:3h4i7Khxl4T/2E1Ympd5fsP+X161TREKZh0ujC45NGQN5FlHY01je
 htvDzyBPKmCYDPyKYh1Oozj901X7MXUnNNmGQQ5/yBnECsb9cadCdqndUqhZCn6wu8v7q5Ex
 55HNoSfdpBcolv0/ErF3m3J9CEkvU2wbuOgTrWCYmYpHlUMpB4J0XpLg/Q+jpNjne+3CgaMv
 cKai8DEMRqu1iUc3lg8sspvkzsx+qyq0N8klgZmP6sT4QWFzyN94K83fsldEVOpGuG4IcbiL
 wrz5OnR1n/U+R4rFuSknt7TGqHdauePVeQmoiM+t5mK2nCulARrukoIHKN0hXNsoyeIh7hMJ
 OBl7vRcf+uL0prkw4zxWzEAe8130DYvFLXveRBTuuTLp6HKnueFL1yDwyjaMKVBktubD12i+
 tQxMS9cUyKcjtu12ZmGa+Bzm8YFFPbCadZ3VnFIlVk1DN4AaLWaG+DmwIEd2z09wMdTAfzZe
 swVLyJ1awjNaAFOPVFRD48imOCvhT/0dDgwRFC9/PJrpTSMilEhluG1YLI5efTTLSlRtm+eq
 njL4CLSBRYCOcbE4TGE7mitlqnEmiaTtIc6TeXpp6I73wbLroAVID4vV0Phpqi7sUWFVcBBJ
 GgExXErirdnoSRHSfG4BXVUukWsvBQRRt5RGO0S8xyWx+zf5APxLngJSHtNZcIrsOcyRCc2z
 RmZktXxHzttvbaJD3WH+d+8sjeaKSUTa2gYakc5oRAt5tDipMQ/i0zJR9M6SKqt1IStSXf33
 iyAqzU4i/MLl8kX2q6n/FfBxTWxupzOSQ1z7QLSNo640j5EiEeeT9TAwTDmATxode51knHpU
 KA4pvWj
IronPort-HdrOrdr: A9a23:iJIPuKEFS3Y8+jfKpLqFCJLXdLJyesId70hD6qkvc203TiXIra
 CTdaogtCMcRgxhIU3I/urwSZVoIEmsi6KdhLN/TNWftWbdyRCVxb9ZnKHfKlHbakrDH6tmpN
 tdm0YXMqynMbBV5fyKyDVQOexQlOVuyciT9M7jJ50Ed3BAV0gY1XYvNu/5KDwEeOA5P+tCKH
 PG3LsTm9PIQx1+Ba7Xahd1OpmmmzDSruO6XfdFPW9Z1OCgt0KE1FeQKWnh4v5xaUIo/V/imV
 K1wDAQsc6YwoGGI1LnpiXuxqUTvOGk5spIBcSKhMRQAjLwijywbIAkf7GZpjg6rMym9V5vyb
 D30lsdFvU2z0mUUnC+oBPr1QWl+DEy60X6wVvdpXf4u8T2SB8zFsIEr4NEdRny7VYmobhHoe
 929lPck6ASIQLLnSz76dSNfxZ2lnCsqX5nquIXh2w3a/pWVJZh6agkuG9FGpYJGyz3rKo9Fv
 N1Mc3a7PFKNXuHcnHwpABUsZyRd0V2Oi3DblkJu8ST3TQTtmt+1VEkyMsWmWpF3I4hSqND+/
 /PPs1T5fBzp/ctHOBA7do6MI6K4jSne2OJDIvSGyWoKEg/AQOPl3ati49Fo91De/Qzve0Pcd
 r6IRVlXFUJCjbT4P21re92Gy/2MRCAtEzWu7xjDxcQgMyveFPKC1zKdLl8qbrqnxxYOLyVZ9
 +DfKtMBfntNG3vHpsM8THfdvBpWCEjefxQg808XV2WpMLNN8nNjcz0NNjuBJeFK0d8ZovEaE
 FzBgQb4P8wtXyDazvDmRDUbXvmZ0z4+vtLYfjn1tlW8pEEMrtGuhN9syXm2ui7bQdauqgBZ0
 dmJqj7+5nL9FWezCLz9m1sDABWCF1YiY+QDE9ilEsxKkvxR6wIvc6ST2BUwRK8V0NCZtKTCR
 VYoVtv/6KxMtib3iY5Ec+qNWqckhIo1QW3c6s=
X-Talos-CUID: 9a23:MCuhgmPyO+X9Mu5DcTB4pXMmBckccWT28VbZPFK6L15WYejA
X-Talos-MUID: 9a23:UoZXjwtfTUJ6uAGj1s2npwhgLJ1vsqaVA3sDg4sJn9m7bilXJGLI
X-IronPort-AV: E=Sophos;i="6.00,186,1681185600"; 
   d="scan'208";a="109949730"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=LlJv3mj+wgslz1bIkDemjjqIzo45KiUmpybouzHjAf0NsyskRTQQgZ+OsVp24XfbpUIilcNmEJJzBHv0CjVjbsjVYXakY4EK+yc6VVRkhms3Y2F06MN/ebzTnYlE0sry1jQOxy4SM3pO0P0sEFzFAICzmnq4tvhZE2HSpVq/Qnmk8ZVh/mErsiZnnVnzRJ9a8VhLDA9O9f2CT9YPH0K3TfYf+mXlY6TItFFDjtVqPJyPCy+bclXmyXVGaPgMB3A1ujBNH1qJGAaL10c47IaMcM2Do6MqW2/TcBg2/r+1rrYO6aOKcrtEscAu8M7bDPzvySYlylr84bNoCmXYCIG4AQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=X/nPEb9G4LjMOi1yfKSgDLkmh3WnvlncUMic08Ivb9k=;
 b=Y5GZAlN2rcw8KfBjr89YItMFy09KgywRKTJq6kJei8g7Biu8ZzzC4o/6Bg9FqOFgWfJ5PJHdArHGUVdFOXcjwso40O8TfMWRf6szHTVbVJO4i9ejhjhD03w/PQrwDnxecCTsfL7wpyvJrQoQBELTv2Wb7g4I5kr4fN/jNisqbracWFm1OGWFuRN/IynT2INAOWXRwZV0MEOWaWVRaXBSdHNsWad0LkaXE10H6n+iYBZDbEk3hx7rjm1pBvdAugOh+Ov6ktAQb3r3LtU28SlefYXcDh2Dw+o3HKVruJpAfWf+QO2NcrbqQdc9R/l9yeUnSQlNoCn/R9HR50/TZC30rg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=citrix.com; dmarc=pass action=none header.from=citrix.com;
 dkim=pass header.d=citrix.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=citrix.onmicrosoft.com; s=selector2-citrix-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=X/nPEb9G4LjMOi1yfKSgDLkmh3WnvlncUMic08Ivb9k=;
 b=niqyEkOl87cHEJmdHIcAI5XYbOiL5FkFEAZLGUB8XxZQvFYGn7vl/SF8NUoUxU+97vK9dbJtgPK3awI4o16sSvpbEwmlZHFTO1aEFbP35r0v82yCzj+zxtRcfRPXgTkgOmSy3lsfYWwUBIqrh1O16BHuulQLyF9F6BBgfIJc61Y=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=citrix.com;
Message-ID: <39156e66-d9e8-f768-1d9d-0bfd0fdde757@citrix.com>
Date: Tue, 23 May 2023 13:48:43 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.11.0
From: Andrew Cooper <andrew.cooper3@citrix.com>
Subject: Re: [PATCH v2] x86: do away with HAVE_AS_NEGATIVE_TRUE
Content-Language: en-GB
To: Jan Beulich <jbeulich@suse.com>,
 "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>
Cc: Wei Liu <wl@xen.org>, =?UTF-8?Q?Roger_Pau_Monn=c3=a9?=
 <roger.pau@citrix.com>
References: <2f4234ce-9427-b78c-f7d5-4d9822d4d1c9@suse.com>
In-Reply-To: <2f4234ce-9427-b78c-f7d5-4d9822d4d1c9@suse.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: LO4P265CA0053.GBRP265.PROD.OUTLOOK.COM
 (2603:10a6:600:2ac::19) To BN7PR03MB3618.namprd03.prod.outlook.com
 (2603:10b6:406:c3::27)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: BN7PR03MB3618:EE_|MN2PR03MB5120:EE_
X-MS-Office365-Filtering-Correlation-Id: fbbe3438-a798-4e84-7e30-08db5b8c0d02
X-LD-Processed: 335836de-42ef-43a2-b145-348c2ee9ca5b,ExtAddr,ExtFwd
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	HQrtDOD9XvoR1qN70bEQslvSFrJSWbDskRurl+EwtfH3zp8Q3Et2bZGNgs3hZNmBuL8g4Xnba9zLVKEJKF+fTP2ZxQaz2FTFmouBf+4qo93AN9YA+VeY2cXjLgE7KKLvZpbsZXLxZM9WnWRht5ZQpr0LovKb93wrDjWBrp26dQCDTCxxcOoFkL3+rabOUrFk3DXPQlQqqOYYZcVcEFnktXOkAVgdZH2/3JFmWoXyQGvaRn8yBB/32euWrnKqBFVnGljso6/uUnpIegLJP6Zzq5b8xJ/7lr/LQDZggvOwC1hHW4zNPH3Sa2rc+nn7lLofHYyZYRpv2xva+L4anB6mZsJMGmzXtZT+0tblGByxJsKav6hP8yZTEI09BbBS13VilR+JzCf/IW8l9D5F/vx4dMWIzbzOcEVlImXnd6t/eBcl4TE9oGoYMMfRMr4LbEwg85tKON6RdfchTNcb0brHi39SD394QLrC8g68PPt8u9ZrxiKYYc8Jx8lLIvPXaRR+alDI7uITE4t7XtlRIsiMSRx3Cqqvj8S5BBGgMDPBY26yxsURNJUoCR2Ya3zr4XUNbvTasAmkNgYu0+WLNVg0uZLNv84k8ug007eD4dbq04CMZXePSoKM8+hHqpjrRBYPgtIxSRacC12ErkyHUaYVqQ==
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:BN7PR03MB3618.namprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230028)(4636009)(396003)(376002)(346002)(136003)(39860400002)(366004)(451199021)(82960400001)(38100700002)(31696002)(86362001)(36756003)(107886003)(53546011)(6512007)(6506007)(478600001)(8936002)(8676002)(2906002)(2616005)(4744005)(186003)(54906003)(31686004)(4326008)(316002)(110136005)(26005)(41300700001)(5660300002)(6666004)(6486002)(66476007)(66556008)(66946007)(43740500002)(45980500001);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?bTN6Mm9xWHRMdEh0K0hyRDJ0MDhJclZjRk5ocHBWTVp1dDVNT3hYdzlwN3dI?=
 =?utf-8?B?aUxHeGFBU0xNSnZtTlc1S3JCRWJVUlNNeG0zT2R4dGJodFF0b3lZMExwZngw?=
 =?utf-8?B?SWR5VWtISHZKRWJtUHV2cVIvQVo2OG9GTjNYZ05DTFFaamRDZFBHdHhIOHpp?=
 =?utf-8?B?Y1hrUXk0d2hFM1JpTm1NL0FzbmluNWs2K0ZHVmlReFFuOWVwaXdUaEE1d09q?=
 =?utf-8?B?WVY5dHNXSjE0NUh6QW5KSkxJaVNXRWJ4MjBrWEZTblNlZkF2YVp6SGhnb2N2?=
 =?utf-8?B?a2xrbkpzMVdTN1ZzT2c3bWZ2TFBBbkthTnYxNXp0dkZlRnlQNE9HREhrU2hY?=
 =?utf-8?B?VzJMS1dWWWNyRzhkeU50azlSQWVCSTVqei92YUtjMVFwZWlWR2ovS1pYL1ZU?=
 =?utf-8?B?dEpsVGhBT05SbDlDdFVDS0JQN1NNVEdlaldEd2tYdGN4NXk5YVdYT0cwUlZQ?=
 =?utf-8?B?VlNrbFdiTjFVL0Y5MENYYnpta1k1NTgwYXcvclJaQkFZQnFtVkttaUtTYTUy?=
 =?utf-8?B?eUJ0aTdaeGFnUTdhLzhtTnh3N0lteEk5bTYwV2JYVmc1SlBRVVJvZmFPT1c5?=
 =?utf-8?B?UUpDQ0ZTZFh4V1FWVnc3aUIzVzVGbkp3WTFOM29zYXRiaFRkRFpuQVlPU3VT?=
 =?utf-8?B?RHhwanhpV1pvQXhUdGZkZE0yZDlRT1dmTzkzODFybFZpamRNVzh2ZDBTbjRV?=
 =?utf-8?B?Nm16VnJLam1lT29xU0VKKzYyZWd6KzdkNnlVaC9Pam1GbmxtYkhuY2U0NEth?=
 =?utf-8?B?RTgvdU41dER0NXJWT1FsZGtUdVlGY3BUdW93Qm9yNVhQQ2lXOEhFTWQ1Y1Mx?=
 =?utf-8?B?eXE4d0ZnWjB5U253Z1NTQ2IrbXhrS3FwTmxUcGVlZmhJV0ZWVTQ2NThWSE1R?=
 =?utf-8?B?WWJWbFBOclpLZmVNZlZ2SmM0ZG5heUNSMldKOVBwVU1uMGFRVVNudnhjbHZr?=
 =?utf-8?B?YXFNSXhFQjZOdVRVcGdsTTlaSndFVk1CMFRqZUJha1l0bGlMM0E3clUxd2FH?=
 =?utf-8?B?MDRHOVlPR2ttRHVoU0k1eDcrQ05Fd21hcllVTWYxQjUrWFFsbGswRmtMMkhK?=
 =?utf-8?B?YzUwUXlKRUlXVEppaVh3R2ZFNTNiNHNOcXZrRUY3L0RpaXBaUUVxb0FSdDJx?=
 =?utf-8?B?WDFxdFdiQzBJb0FtRnduek1abHJhN0ZxYXlBUkxHZVh4cVBTRmJLZE9ISU9y?=
 =?utf-8?B?OU4rdmxqRVUwcUk2YjJvY01GR3hZSXJkempIc2RzNFl6NEVmaTV1dlVrdjZD?=
 =?utf-8?B?VHh4U2I2R1JjVmZOekJkQ1Y4Ky80TVhWMTJGbVJQbkk4TUxvRFA5V1RkR3hD?=
 =?utf-8?B?QUlRSUE2VUQxb1NpNFp4T2lQSWpsbEVYWExBZlFmWGx3bDAzQk9VeHM4S1Y3?=
 =?utf-8?B?MEtsVU9SZkVjVlh1THlBMEhjMkZqWjR6QnpESWdSK29NQnFiT1RhLy96VmVG?=
 =?utf-8?B?YTRGR2VhOGxuQ0NycUs4RHNDejFUZUdPQW00R0VIR1hPTnh2ZTQ4TzdrZFUv?=
 =?utf-8?B?Q2l6endDUEVvb3FXYTlpSFNpS2VsK2pLMTZKSVJRQXhrWTlGYkFlRllTdlhZ?=
 =?utf-8?B?aTV6R09pc3Y1YjBmREJENis2UFpmZ3QrNUtJcmFyejU0eDVKSjl0Z2ZWYVlk?=
 =?utf-8?B?eFptbnhhcVBOTDNuV08zRWRIdEhLSXV4UnU2cXZSTUFxVUpsdVJUc09XeFll?=
 =?utf-8?B?VUFPOUhuWWhMaGhyWXNUbFZnOFRIRS94ejFCUjYwZ0hMdkdKR0E5dFJnN1kv?=
 =?utf-8?B?OEJPMlJtRFUyVHhyeHhtTmpJTUdQeG9qMXZ3V3hNc3A1cjEvZXcwdXRkOFJH?=
 =?utf-8?B?TE15LzdtYndxUzMxRFRST2trNGRNYmt4cFZyd0hRMHF6YkNiRnVVRHh6dXNw?=
 =?utf-8?B?WlY0UnlkT01hNU9oRElxbG9YZC9GRE9Rb3J3dXpsQ0FQUG5rVWt1RWd4UjdE?=
 =?utf-8?B?T3QvcXlNR0thQ3YyVEE1eWlhRU5adW5IS2dHWlRrRzhwTjg5djNKd3phbEkx?=
 =?utf-8?B?eCtWeC9uTkRWbVduMHQvUEpPMGRaYlE5SS9qempRTXdZN0lNYTJIRFFEaTdF?=
 =?utf-8?B?MzExQlY5Ukg3Y2c3T05vZGhHOGc5V01GQ012Z0MyUWp3anJrYnl6SkIwUjBz?=
 =?utf-8?B?djc4TmhkZ1BwNjd3VHh1NFQ4Wk1DUnBYYzl2enZvMlNGK0ZJWUg1ek5CcTVO?=
 =?utf-8?B?MFE9PQ==?=
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-0:
	X62mK3blDhZ0KGMcNZCkQnWx2tWBItjvJ5tD+HEbblVZoFRqUlXpS5NBaJqFfcvxTE/1KJm2WYSioPG7v3xJ0vTCzP29BscF//xI7Q21ZoAVnS7se5PT/QU0fqdZPQ4qjHYYZNGMZqETZjGfbkhjg8aR8gP+G7Xi4TAqHJElvhh25cxByMWgpsFxhmALnZJ/qIvL4r76htAloS5V0n4WB/uLlcKNgL25sGs1VXnKOBv36kp8ozeW23/N/XFK6F/FTAHStbxz6lBY002ZIugjMDV2dOdWVTBX2ucBJo2waY1ASGqAD1xt7eJi+QNKaC1zPOOXT+paRuX8Nynrgwd5gK3Mf3UTQP1x6VEoXxtpjgR7lO37QdpBnJ+6aM2phs7IS+kl9RABFUtCC4I4BumembHHh9W25K4GbpErzv4am9wKJzlCqbfBG3fK8s1hy1xMkVmdQyFLuotyyvSKBtCyif+Hqtos83bZ7upvHTARAF7ulNKv/nI2GH2VM+DVS/Y4bU3D3tR4mdy41Kyb3TKHWJ6dKmIkH7mW0Q+nEPLTWZOwGEA0WaXar+LXMBZIgOXxyt9+ahrWNdp+NUcLcTXMdmd2mULi+1279yRVTqdMBhPbvMZnTO23GMrYCmVsXgkmlq2GDREH7CtGaErOcCZoRCH41iWnB0t2eutXdx+mk/snT3ZvKXPKihHBBqmGg706264OTADUqVwmff64P31vekXlS/uuJFa6Kpu7P6nRQAddvoqjbu6Da6nNjmi8m99FuaeykxM1iQCGeKhmj6TgHHT7DxZnq4J0VyGxAtdpFdvdpcKmMSiXpjJfq9mIlr4wnwEPU0fOYNP1YeIpF81N+Q==
X-OriginatorOrg: citrix.com
X-MS-Exchange-CrossTenant-Network-Message-Id: fbbe3438-a798-4e84-7e30-08db5b8c0d02
X-MS-Exchange-CrossTenant-AuthSource: BN7PR03MB3618.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 23 May 2023 12:48:47.9261
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 335836de-42ef-43a2-b145-348c2ee9ca5b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: yj8SqJVnsph18lFfqS4VD6xX9lbAN0Z7HjI99ag0eExg6gKhDjP3IKkj+T0LW/00oQLnaGQt4kjMN1K7CIyaOKfaX3w2itQgeJT4Olx5mXU=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MN2PR03MB5120

On 23/05/2023 1:37 pm, Jan Beulich wrote:
> There's no real need for the associated probing - we can easily convert
> to a uniform value without knowing the specific behavior (note also that
> the respective comments weren't fully correct and have gone stale).
>
> No difference in generated code.
>
> Signed-off-by: Jan Beulich <jbeulich@suse.com>

Reviewed-by: Andrew Cooper <andrew.cooper3@citrix.com>

Thanks.  I do think this form is easier to follow.

~Andrew


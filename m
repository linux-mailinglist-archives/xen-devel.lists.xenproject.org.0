Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 0B2754D1D13
	for <lists+xen-devel@lfdr.de>; Tue,  8 Mar 2022 17:22:56 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.287189.487062 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1nRcbo-00082Z-LS; Tue, 08 Mar 2022 16:22:48 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 287189.487062; Tue, 08 Mar 2022 16:22:48 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1nRcbo-0007zC-IA; Tue, 08 Mar 2022 16:22:48 +0000
Received: by outflank-mailman (input) for mailman id 287189;
 Tue, 08 Mar 2022 16:22:47 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=fWwI=TT=citrix.com=prvs=059ab6e88=roger.pau@srs-se1.protection.inumbo.net>)
 id 1nRcbn-0007RV-2j
 for xen-devel@lists.xenproject.org; Tue, 08 Mar 2022 16:22:47 +0000
Received: from esa5.hc3370-68.iphmx.com (esa5.hc3370-68.iphmx.com
 [216.71.155.168]) by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id fbe5bb33-9efb-11ec-8539-5f4723681683;
 Tue, 08 Mar 2022 17:22:45 +0100 (CET)
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
X-Inumbo-ID: fbe5bb33-9efb-11ec-8539-5f4723681683
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=citrix.com; s=securemail; t=1646756565;
  h=date:from:to:cc:subject:message-id:references:
   content-transfer-encoding:in-reply-to:mime-version;
  bh=giRuNGlKMOFTyDSq4Rhj3syknhVT76PqgokL9W1J+F0=;
  b=Iew09La2T64WvbfOUvL2SRNxyqe1dBj2kWKU+BjUWvrCrIMZ/I9fGh97
   gSBcvqjDi2yjuV7Jb0BO6ESUR/qRBFjM1aq2cOHMYCzQZu5PSMPaJKf31
   laWuwdQP3TdGqofpYkwVg8/W7OCel/CpwEtABdU55wEZSmRcRQfUiEpDc
   M=;
Authentication-Results: esa5.hc3370-68.iphmx.com; dkim=pass (signature verified) header.i=@citrix.onmicrosoft.com
X-SBRS: 5.1
X-MesageID: 65201145
X-Ironport-Server: esa5.hc3370-68.iphmx.com
X-Remote-IP: 162.221.156.83
X-Policy: $RELAYED
IronPort-Data: A9a23:fePWpqhC69+/MUDOLpUb9QtiX161nBAKZh0ujC45NGQN5FlHY01je
 htvWz+OOvyPZTH3L4h1at6w9xgC75SHmIM3TFZv+StjQSob9cadCdqndUqhZCn6wu8v7a5EA
 2fyTvGacajYm1eF/k/F3oDJ9CU6jefSLlbFILas1hpZHGeIcw98z0M78wIFqtQw24LhWFvd4
 YmaT/D3YzdJ5RYlagr41IrbwP9flKyaVOQw5wFWiVhj5TcyplFNZH4tDfjZw0jQG+G4KtWSV
 efbpIxVy0uCl/sb5nFJpZ6gGqECaua60QFjERO6UYD66vRJjnRaPqrWqJPwwKqY4tmEt4kZ9
 TlDiXC/YSUjZ/XeurwQakJVKTFaBJFi3Jn4P0Hq5KR/z2WeG5ft6/BnDUVwNowE4OdnR2pJ8
 JT0KhhUMErF3bjvhuvmFK883azPL+GyVG8bkmtnwjzDS+4vXLjIQrnQ5M8e1zA17ixLNaiDP
 ZJAMGYyBPjGSy9CNXMLGpkipceLn1LPfSd0hGO2+oNitgA/yyQuieOwYbI5YOeiXt5Jl0yVo
 mbH+WXRARwAMtGbjz2f/RqEhPLLnC79cJIfEvu/7PECqGOUwmsfGRgHT2yRqPOyilO9c99HI
 klS8S0rxYA+/VKmZsPwVBq5pDiDpBF0c8VUO/037keK0KW8yxaUAC0IQyBMbPQitdQqXno62
 1mRhdTrCDdz9rqPRhq19L2ZsDezMig9NnIZaGkPSg5ty9vsuoYolTrUU81uVqWyi7XI9SrYm
 m7Q6nJk3vNK0JBNh/7TEU37byyEhJKQFhwXvgjuBW+f/idAWKqBQbO20A2OhRpfF7qxQl6Et
 XkCvsGR6uESEJ2A/BCwrPUx8KKBvKjcbmCF6bJ7N9x4rmn2pSb/FWxFyGwmfC9U3tA4lSgFi
 aM5kSdY/9dtMXSjdsebiKrhWp1xncAM+TkIP804j+aigLAsLGdrHwk0PCZ8OlwBdmB2ycnT3
 r/BLa6R4Y4yU/gP8dZPb751PUUX7i4/33jPYpvw0g6q17GTDFbMF+tbbgTeM7tgvP7fyOkwz
 zq5H5HRo/m4eLeiChQ7DKZJdQxaRZTFLcqeRzNrmh6rfVM9RTBJ5w75yrI9YY1195m5Zc+Tl
 kxRrnRwkQKl7VWecF3iQik6NNvHAMYuxVpmbHdEFQv5hBAejXOHsf53m20fJuJ8qoSODJdcE
 pE4Ril3KqgXGmSdpWVHNsWVQU4LXE3DuD9i9hGNOVAXV5VhWxbI6pnjeA7u/zMJFS25qY01p
 LjI6+8RacBrq9hKZCoOVM+S8g==
IronPort-HdrOrdr: A9a23:7ZdYgKpYPv/6+C3NnggrmGkaV5vJL9V00zEX/kB9WHVpm5Oj+P
 xGzc526farslsssREb+OxpOMG7MBThHLpOkPMs1NCZLXTbUQqTXfpfBO7ZrQEIdBeOlNK1uZ
 0QFpSWTeeAcWSS7vyKkTVQcexQueVvmZrA7Yy1rwYPcegpUdAZ0+4QMHfkLqQcfnghOXNWLu
 v52iIRzADQBkj/I/7LTkUtbqzmnZnmhZjmaRkJC1oO7xSPtyqh7PrfHwKD1hkTfjtTyfN6mF
 K12TDR1+GGibWW2xXc32jc49B/n8bg8MJKAIiphtIOIjvhpw60bMBKWqGEvhoyvOazgWxa2+
 XkklMFBYBe+nnRdma6rV/E3BTh6i8n7zvYxVqRkRLY0LvEbQN/L/AEqZNScxPf5UZllsp7yr
 h302WQsIcSJQ/cnQzmjuK4GC1Cpw6Rmz4PgOQTh3tQXc81c7lKt7ES+0tTDdMpAD/60oY6C+
 NjZfusqMq+SWnqLkwxg1MfgOBFBh8Ib1S7qwk5y4GoOgFt7T5EJxBy/r1cop8CnKhNP6Wsqd
 60d5iAr4s+PfP+XZgNdNvpfvHHeFAlYSi8Rl56cm6XXZ3uBRr22uvKCfMOlaWXRKA=
X-IronPort-AV: E=Sophos;i="5.90,165,1643691600"; 
   d="scan'208";a="65201145"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=GBSnIszL6TeG6MzsilOqWKq7yE/e6fpou60SfEzEIbgSQe4oU7m2l9Jd73dBxTbp+pJngxa2yDlfjMP6Rpr7nC7O0jul6mWjkwxFAw+y7J5azCBCoieYWf12FMuzhZYa/Z3cNdypEZp+kuzrnO94nwF/IzQt9HBOyJdlKx4AXAiTX7ULH8UtwkjilXhMPlIWsgqd2G/p80friPfyzvet8FwOhJBRZ5WVyQ2XcN+sMbh2DjzLH3xrzNvxYFAPrBX2AFOhI5BBnLIyw2T09k0JPPk6FjhOcRxWHm0hKg0g6ECmUtryT7nK1gYsQc4ZyhdjAZyUYrA6whaq1NJexPrQ9w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=sSfz3JrLBHR4TCcvnQS5kyjyxRvABmDE0EWhL3JGJxY=;
 b=ZHrFj9ZYznHVDMZrXQbo798LdN3wgW/48FFhHVZev9rBut96oXCYJqnW9swN7G352NHPd63kYzYI1DMxDIDn32vk0YdUXq7ds4wKm33MIs99P3V14BTx157Q9glnxc4SGW3hT8fCA1aSX+5LAHVSXpRLg31BLyyMIcY873nSLUueP5qUNSmv5dehSrQhitm6onVw/VYVs9Qm6r7CGlffcWLZZIoLkwIkryKmPiAFi07myIYDE17PWdZeVJjSi70M/RPa5BS6wYaHV6T5FrbDYpOjM1j/u1WjDqP2tGFGf3KuwxcK6Ul/UHx2z/Bs8nCV9Db32kTIcmF/R3lHgMMPBA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=citrix.com; dmarc=pass action=none header.from=citrix.com;
 dkim=pass header.d=citrix.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=citrix.onmicrosoft.com; s=selector2-citrix-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=sSfz3JrLBHR4TCcvnQS5kyjyxRvABmDE0EWhL3JGJxY=;
 b=YfOd6HJ0zu51LU8Wq3xN6YOa50rbDoZjvMSKE8ADk/onHweU8EdNTldDiHHBcSMxyke0sRBFO38tcQ/UMkYym/Yf/DtP3nUo2Zkj/uuQzmZCzVi6WjLsaTUUPo45OC7YWegINTTGOPthy9J7HzN46jS0uuVUKpbuvk0vIu9x+1w=
Date: Tue, 8 Mar 2022 17:22:36 +0100
From: Roger Pau =?utf-8?B?TW9ubsOp?= <roger.pau@citrix.com>
To: Jane Malalane <Jane.Malalane@citrix.com>
CC: Xen-devel <xen-devel@lists.xenproject.org>, Wei Liu <wl@xen.org>, Anthony
 Perard <anthony.perard@citrix.com>, Juergen Gross <jgross@suse.com>, Andrew
 Cooper <Andrew.Cooper3@citrix.com>, George Dunlap <George.Dunlap@citrix.com>,
	Jan Beulich <jbeulich@suse.com>, Julien Grall <julien@xen.org>, Stefano
 Stabellini <sstabellini@kernel.org>, Christian Lindig
	<christian.lindig@citrix.com>, David Scott <dave@recoil.org>, Volodymyr
 Babchuk <Volodymyr_Babchuk@epam.com>
Subject: Re: [PATCH v5 2/2] x86/xen: Allow per-domain usage of hardware
 virtualized APIC
Message-ID: <YieCzN163roN8EcB@Air-de-Roger>
References: <20220307150609.10662-1-jane.malalane@citrix.com>
 <20220307150609.10662-3-jane.malalane@citrix.com>
 <YidAU63TsVO/X1Q+@Air-de-Roger>
 <c20a3e9f-770c-3d2a-a332-ce836a4192da@citrix.com>
 <Yid+F5LdtMhs01tM@Air-de-Roger>
 <07334c85-92af-4986-d8a0-7b61f785c22d@citrix.com>
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <07334c85-92af-4986-d8a0-7b61f785c22d@citrix.com>
X-ClientProxiedBy: LNXP265CA0096.GBRP265.PROD.OUTLOOK.COM
 (2603:10a6:600:76::36) To DS7PR03MB5608.namprd03.prod.outlook.com
 (2603:10b6:5:2c9::18)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 5b4a7e1c-595f-41f9-eb3e-08da011fdda8
X-MS-TrafficTypeDiagnostic: BN7PR03MB3603:EE_
X-Microsoft-Antispam-PRVS: <BN7PR03MB3603060ECAC20D8F2C5DE1F78F099@BN7PR03MB3603.namprd03.prod.outlook.com>
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: VzXS6q3NKnnWgG/CAZiKCHtF4FzF+6iGTUOjoLoK/5qmZkAUKcyjiOOEvXdfI5yPNUFHCRq3QmnNiDA9CWYF42cXKf5jobkYO0gLqLHYphKWQpGa6NzAx0JaDwEUoWS6lz4DIfJ9doqB6BAf6J5hBFPRBYPc1j3JkrPa0xoIVzH0DWKA8zJvjhjToOZvZVrpJVqdfb8X9Zej8iKT/j6XI2OIKoaXdrt/vRlm/2nq7aLT4mBhOkrbI4whq0U23cb2r3y9T5JVjk8P3ljEwaV8HrfogoqdeJHWJO33BLLUo1+jhNEzY+RbRqwrOirM8yYmnEFDXOcXmAL7Koo8b0htgGZSpWtEz7znPmJH5IcTSsI/OuvxlCeR++fuBu2TW7fu6jLJSBZJ3VDPtSJ7C/E9Ss6GikwHPligfl8fjwU6v33ZSKIKfjsMwDV22cwkOFrpxbNS6cJP7lHF+ETBbnmy7aD1eNU4c2qndhmqhlKrrdmPTz4DHNcJmWHcM6lisRNlo1qaPP8ZxjTzbPwGlZqIxI51jdXekKtzRtqxBFj3lnt91i1EAkB3ZoFe6OJnMGfGTHa2Pb85yBe6a0r0WUhCdkljDP5mUMOJ0ax5JrKtGeG9Qe0zGQE9ydUlpEFZ0f3iP5xFuAXsFu8lJOua922lIA==
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DS7PR03MB5608.namprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230001)(7916004)(4636009)(366004)(6862004)(66556008)(316002)(4326008)(53546011)(66946007)(54906003)(8676002)(38100700002)(86362001)(66476007)(8936002)(82960400001)(2906002)(5660300002)(33716001)(6636002)(9686003)(6512007)(26005)(186003)(6506007)(6486002)(6666004)(508600001)(83380400001)(85182001);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?WDg2OHN3MThaZlZhNnF4elhrYkk1M29ROEdJRHE1UmJkYytPSU1ncXJjM2ZN?=
 =?utf-8?B?cTUxVnJlZFhFQ2lzRjQzOC9oeGZxSU5BNk54Qy9IdWdmczZxMjRGU0UxTzNV?=
 =?utf-8?B?Z253RWhqTTRYVGZUa2d6TFMybGNjcVNrNnUrNmxteVMvYnZjemg5SHhlR1ZT?=
 =?utf-8?B?VFVQRVFaRHVZU08yeG03eGMzR3BkRFlXTVpyUWFOTW91QlhzMTdlZnZwdUdj?=
 =?utf-8?B?SnNERHJaejMraVJlMC9DLzBJMjl1bVZJTlN4SXE2dDk0OXhZRVFwV01DZzlk?=
 =?utf-8?B?VXZKcDUydnBueVdZd3c1dEVWNndYME5UTVRFcFM0Q2RlMk5nNGo1ZzFHZGF6?=
 =?utf-8?B?cXhKd1MxbTNPZnI3MEJOSi9CNVVjWjhuOWZYNm9zWmZWbGl0ZDZVSmhIdzNS?=
 =?utf-8?B?TXRuRWJxTm9OcVFucXJJTzNoY010dlZWNExyRC8vREtwbHVrL3JMaE13dFVa?=
 =?utf-8?B?WlJlODZibkhGNlZRQ1M0bEdUc1YzT0FrR0w5bGpXNlJvMEtDdjVySFYwR3h5?=
 =?utf-8?B?bW53Uk1oZWdzUHJDN0FiNVBzUHg4RFRJSnQ4M0JWcURqVjZrOUVXUXRIVGhU?=
 =?utf-8?B?ajdZSlpxVk41cjRhamoyanNReDJDdFdwTGVKenpKN0o3T1l5ZDhXUlIrWnhw?=
 =?utf-8?B?OTF1bGQ0eGJGTWN2S2p6WlBIZHl4M0t6anpTRU03QWg2REZQMzFQUFRsS04r?=
 =?utf-8?B?czkyM0dQWXBnemNOUC84RmNtbGNBVGNoemQ5VmprNHBKNTc1ZTlQeVFKWUFl?=
 =?utf-8?B?dFF6WUlsbW1sTkdNK3FrRDFTV3FnMkEvYklOTnhmUWc2ZjBQejF0VVc5U0Vv?=
 =?utf-8?B?ZDh4VUU4QTJEVlg0V29pUUV2YkcxMFp0VkIrZDAxRUtYKzBTNHZxeEs1VFR0?=
 =?utf-8?B?VUZIL0pBWGhuYm5lR2hHVldvd2tkTU9wVGpvU1hycmVQb2gyZ1BsUTdPTllk?=
 =?utf-8?B?alRFSlhXMlBMUlBDN25zUzdDMEhJOFVEZ3JMOUdhK3B4WTAwZ3ZnUjNqdHRw?=
 =?utf-8?B?ajdUaEhTNzlvd0dVV0QyUXJjNldXMGt5M29vQWQ4dm5WOEFYZE5BWWdNMTlL?=
 =?utf-8?B?VlZ0YzhFL0EwTzZuSGk2K0haSWFoc0c5NFVPOVkyd3lwd2xxTEtacnFXamMw?=
 =?utf-8?B?clB3S3FvL3ZrRkRTN0tDWUlJUUc1clZvZWM2S2ZzZjlGT0dUMmY0OUlOYTRT?=
 =?utf-8?B?cVdFditsdG1SRlBXUEZoaVp3bW5iWGMvT3Y4NVo5enNvSVRqdmRqdzIxSUlE?=
 =?utf-8?B?aXoxL3lqV0t3czE3MjljSm5kbllHenRXZkpneE5oL2dhUUh2UytaMG4zZXVp?=
 =?utf-8?B?bEJHRGNCbmNXeGt5clQ3dWJXNDkrOFMvejFpcjB6b0Nnb2hsWERGcVVzZjVY?=
 =?utf-8?B?WnZLZUdIYWFLVUtWTVU0cldlc0k1d0U4dHBqYjhsS1I1Nks4aHh6bWNESkFH?=
 =?utf-8?B?REpDSFlUTzdsK0NIbW1YRll6Zkg2ZHRNanpEeVMyb3RYSzlWKzg1dzl3S29R?=
 =?utf-8?B?UGtwbmk3ZW5xMENkTWZJN2VTWTNmUDI5Nk10eld4ekJmS0NiRlE4Z1RCQmNW?=
 =?utf-8?B?VksrOUM1cU5mVFFlcCtHc0RFWmk2Yy9Sd3ZoMmZPblplYmJvUlBCckJLVjIz?=
 =?utf-8?B?Wm1YWmJwR24rLzZrZDRsZFYwQ3BHcXAvUmxFQnFIdWlkVExodlpDNnh5WHFr?=
 =?utf-8?B?aEpjT0VOV2dQamV0S3VXcFZBL05BT2ZhR3ZtaS9RbjY5SVkrWFR3NnVvcm9u?=
 =?utf-8?B?VFgxL2psOE1yalRnSG44bzE5TmdRMFhnS2VRUE5id2NBRTdqSWJvanI2NjVK?=
 =?utf-8?B?dGl5RU1KYmNnS2p6UXpKTG9HNU5sYmxwNkNhaXhxWkd2NGZvcEozNEF2TGpX?=
 =?utf-8?B?UUhyTE5PMlJiQzJWbDU3Tk9QVFNFODRKMkF6WHZEZXlOazVwUStnVmdkUGNv?=
 =?utf-8?B?ZXJLWjQ2eFhtNDBOMzBhSjNYd1Q4bUQ2ZVVRU3gvUVlzc2NwZEJiaC9yd0Vv?=
 =?utf-8?B?SjlNUWFpTm82aGxFdXNEOFJ4bzF0T01lTVJrMG1nbjFWL0xsODN5TDJoRzg4?=
 =?utf-8?B?Qk1HNWwvc2lpeWNtU2xRazlNSjVYUkgyRGpWZE5DTWE1TWVWR0pIM3JMVGJ0?=
 =?utf-8?B?RWthVEdjTXpNSmdhc1FYa09tdHFNUUc1aktBOEsvNkFuOWU5WGpPM2REMnVM?=
 =?utf-8?Q?8yDpQHU49mkiRznmldAYEiE=3D?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 5b4a7e1c-595f-41f9-eb3e-08da011fdda8
X-MS-Exchange-CrossTenant-AuthSource: DS7PR03MB5608.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 08 Mar 2022 16:22:40.2982
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 335836de-42ef-43a2-b145-348c2ee9ca5b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: dfwtyb1BhK6XaXECbgPqkdU5kcV2KUgpEcJuSHQVpUdkUyeqNxPJoJ7+KQh79jm4PfgbzMZLqt5kV91gut+ZVg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BN7PR03MB3603
X-OriginatorOrg: citrix.com

On Tue, Mar 08, 2022 at 04:16:21PM +0000, Jane Malalane wrote:
> On 08/03/2022 16:02, Roger Pau Monné wrote:
> > On Tue, Mar 08, 2022 at 03:44:18PM +0000, Jane Malalane wrote:
> >> On 08/03/2022 11:38, Roger Pau Monné wrote:
> >>> On Mon, Mar 07, 2022 at 03:06:09PM +0000, Jane Malalane wrote:
> >>>> diff --git a/xen/arch/x86/include/asm/hvm/vmx/vmcs.h b/xen/arch/x86/include/asm/hvm/vmx/vmcs.h
> >>>> index 9119aa8536..5b7d662ed7 100644
> >>>> --- a/xen/arch/x86/include/asm/hvm/vmx/vmcs.h
> >>>> +++ b/xen/arch/x86/include/asm/hvm/vmx/vmcs.h
> >>>> @@ -220,6 +220,9 @@ void vmx_vmcs_reload(struct vcpu *v);
> >>>>    #define CPU_BASED_ACTIVATE_SECONDARY_CONTROLS 0x80000000
> >>>>    extern u32 vmx_cpu_based_exec_control;
> >>>>    
> >>>> +#define has_assisted_xapic(d)   ((d)->arch.hvm.assisted_xapic)
> >>>> +#define has_assisted_x2apic(d)  ((d)->arch.hvm.assisted_x2apic)
> >>>
> >>> Those macros should not be in an Intel specific header,
> >>> arch/x86/include/asm/hvm/domain.h is likely a better place.
> >>
> >> Actually do you think hvm.h could be better?
> > 
> > I guess that's also fine, I did suggest hvm/domain.h because that's
> > where the fields get declared. I guess you prefer hvm.h because there
> > are other HVM related helpers in there?
> 
> Yeah, that is why - tsc_scaling_ratio also gets defined in domain.h for e.g.

I'm fine with placing it in hvm.h.

Thanks, Roger.


Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 215DA784A64
	for <lists+xen-devel@lfdr.de>; Tue, 22 Aug 2023 21:26:31 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.588698.920274 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qYX14-0006rO-24; Tue, 22 Aug 2023 19:26:14 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 588698.920274; Tue, 22 Aug 2023 19:26:14 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qYX13-0006ot-Ue; Tue, 22 Aug 2023 19:26:13 +0000
Received: by outflank-mailman (input) for mailman id 588698;
 Tue, 22 Aug 2023 19:26:13 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=u85s=EH=citrix.com=prvs=59133c41f=Andrew.Cooper3@srs-se1.protection.inumbo.net>)
 id 1qYX12-0006on-W3
 for xen-devel@lists.xenproject.org; Tue, 22 Aug 2023 19:26:13 +0000
Received: from esa6.hc3370-68.iphmx.com (esa6.hc3370-68.iphmx.com
 [216.71.155.175]) by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id be43eaf2-4121-11ee-8782-cb3800f73035;
 Tue, 22 Aug 2023 21:26:09 +0200 (CEST)
Received: from mail-bn8nam11lp2169.outbound.protection.outlook.com (HELO
 NAM11-BN8-obe.outbound.protection.outlook.com) ([104.47.58.169])
 by ob1.hc3370-68.iphmx.com with ESMTP/TLS/ECDHE-RSA-AES128-GCM-SHA256;
 22 Aug 2023 15:26:02 -0400
Received: from BYAPR03MB3623.namprd03.prod.outlook.com (2603:10b6:a02:aa::12)
 by DM4PR03MB6032.namprd03.prod.outlook.com (2603:10b6:5:393::12) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6699.24; Tue, 22 Aug
 2023 19:26:00 +0000
Received: from BYAPR03MB3623.namprd03.prod.outlook.com
 ([fe80::afa:50df:158a:a912]) by BYAPR03MB3623.namprd03.prod.outlook.com
 ([fe80::afa:50df:158a:a912%5]) with mapi id 15.20.6699.022; Tue, 22 Aug 2023
 19:26:00 +0000
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
X-Inumbo-ID: be43eaf2-4121-11ee-8782-cb3800f73035
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=citrix.com; s=securemail; t=1692732369;
  h=message-id:date:to:cc:from:subject:
   content-transfer-encoding:mime-version;
  bh=9RyAhmxVAgXw8vKE3ZMff8xIGMb/io3NgEjlvIQwtNQ=;
  b=GdpfTIpynR56VyFc31OekAs8p6P8OSqxOf2Q39jxivxZoFsxlxE7D6B5
   7S7NZJujoM6DTO0tP2ASyNmp9FexB+uGNMx72DvCkCSq35K8yG2oCAiH2
   k7DfpaV72cyXAJnvDa0m/358jznKhJw0Ug1TyK1KRh6qCxxvd7GHwIj0R
   k=;
X-IronPort-RemoteIP: 104.47.58.169
X-IronPort-MID: 119568923
X-IronPort-Reputation: None
X-IronPort-Listener: OutboundMail
X-IronPort-SenderGroup: RELAY_O365
X-IronPort-MailFlowPolicy: $RELAYED
IronPort-Data: A9a23:7l8ibqs7iRayA67CEo+YLHSv4efnVE9fMUV32f8akzHdYApBsoF/q
 tZmKWiFP/3eMTSnKN9yaY2y90hXv5bSyN5nSVRrryphEihD+JbJXdiXEBz9bniYRiHhoOCLz
 O1FM4Wdc5pkJpP4jk3wWlQ0hSAkjclkfpKlVKiffHg3HVQ+IMsYoUoLs/YjhYJ1isSODQqIu
 Nfjy+XSI1bg0DNvWo4uw/vrRChH4rKq4Vv0gnRkPaoQ5A+EzSFOZH4iDfrZw0XQE9E88tGSH
 44v/JnhlkvF8hEkDM+Sk7qTWiXmlZaLYGBiIlIPM0STqkAqSh4ai87XB9JFAatjsB2bnsgZ9
 Tl4ncfYpTHFnEH7sL91vxFwS0mSNEDdkVPNCSDXXce7lyUqf5ZwqhnH4Y5f0YAwo45K7W9yG
 fMwFB0HZQ2dqbuPm52aUbVLpNguAuy2I9ZK0p1g5Wmx4fcOZ7nmGvyPz/kImTA6i4ZJAOrUY
 NcfZXx3dhPcbhZTO1ARTpUjgOOvgXq5eDpdwL6XjfNvvy6Pk0osgP60bou9lt+iHK25mm6xo
 G7c8nu/KRYdLNGFkhKO8262h/+JliT+MG4XPOThp6M00AzJnQT/DjVLfHqdn6TkrnesVuJEL
 VU523IRoqQboRnDot7VGkfQTGS/lg4RXZ9cHvM37CmJy7HI+ECJC24cVDlDZdc68sgsSlQC1
 FWEgtfoDjxHq6CORDSW8bL8kN+pES0cLGtHbylUSwIAuoDnuNtq0EOJSct/GqmoiNGzASv33
 z2BsCk5gfMUkNIP0KK4u1vAhlpAu6T0c+L83S2PNkrN0++zTNfNi1CAgbQD0ct9EQ==
IronPort-HdrOrdr: A9a23:Mg44K65ux3i9f+MTcQPXwCDXdLJyesId70hD6qkRc20mTiX8ra
 uTdZsgpG/JYCp4YhwdcK+7SdO9qB/nhOBICPAqU4tKPzOWx1dATrsM0WKK+VSJcREWntQw6U
 4KSdkMNDSfNykKsS6XizPIb+rIuOPnzEjG7d2uskuEgGlRGtpdB+QQMHf4LqWVLDM2fabQ8f
 Knl6l6T9zJQxQqhj/SPAh9YwAmz+e7864PhnY9dnsaAPHnt0LN1FYCeyLouCsjbw==
X-Talos-CUID: 9a23:j5ON0G1mcIvJ1dPMfLO2ILxfJu0veWDD4i7peGCZEjpOaqGYZ3rN5/Yx
X-Talos-MUID: 9a23:R7MaRwUa0Zrmtijq/GLFpRdcaZpM2rajOFsLiLgn4/aLOQUlbg==
X-IronPort-AV: E=Sophos;i="6.01,194,1684814400"; 
   d="scan'208";a="119568923"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=Bxxas6vHotCu1SVaagZmBArnD8+IOQ8ERmiHIaDxOM1tr6zcEctX1jUhSoKtJUfenom6Hr6DxH6P9YaQpRGXqtssfTEfICipNNB8PzPCkNd2ZmfJtFcvO0c4ULoxU3/9JWnT24avKwRR7wyaEtsantYj3Obg1/HQ8Pm+9b0Wl0WZNNJcfbVkzROREBRCa3i8qvl5xnrSH+eXdXeQLi4WJHtRjsQxsqpxf/0DnDzxq9MRF3VqzCQniqC9eWYt/e7EfkWqmZGkf/IuXrX0EwKGl22a+iFw6Pt+jUOuVbg0CjOWsYMj6kNiuafT/l7xu5akcV+ZxnwGOPP/dssOOpeEFw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=9RyAhmxVAgXw8vKE3ZMff8xIGMb/io3NgEjlvIQwtNQ=;
 b=NqI2gPqlAfXc+z8J5fqicMJAla5zFMuptKD1PKwh2EN1VnnQuFMeLFGCgxHoTGgDRPvomFcXnmcJsx2l4KWiKobmnG4KByfqU4KznasojmZpEfhwdRdy0EiPkRO/OEPVVh1/FmYpWuf/5t8jc5p6V4wdq4Kyogv8ePmdOocv4UyIMvBrEkTtizMDeZ21DXOO/5n1TXV5BfzRGHZU/CeqNSkWrLG4VHOljUp6U9qB8ZMS5oCs0djebaSVqw5Kkm5Xg9eJI28Hz5jm2xwgXLXDfXs1n+UI7yuR4RxV/R27kcXFI9nxazUhMDEXmv/2trZ1+CBrMjCFLdlkUp08YK11xg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=citrix.com; dmarc=pass action=none header.from=citrix.com;
 dkim=pass header.d=citrix.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=citrix.onmicrosoft.com; s=selector2-citrix-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=9RyAhmxVAgXw8vKE3ZMff8xIGMb/io3NgEjlvIQwtNQ=;
 b=mlAtADTOCRpPCZzs6YeFosYlI9lPaNCIsDyFJq8dKoq0N3VGFyV9nylDaqz7OkzKIQ3ofQ27zSGHGR7zTI3B5W0l45dXpMnJl9pJs+rlf+J9c7PkzhGTaJ7WVApdFRGW+Q7z5p5rHbgdEVqhbgNkGtTjo+9CZfuDVLwTCxdOsb8=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=citrix.com;
Message-ID: <033f7255-9f9c-5ab8-3035-6b79084f9663@citrix.com>
Date: Tue, 22 Aug 2023 20:25:54 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.13.0
Content-Language: en-GB
To: xen-devel <xen-devel@lists.xenproject.org>
Cc: Jan Beulich <jbeulich@suse.com>, =?UTF-8?Q?Roger_Pau_Monn=c3=a9?=
 <roger.pau@citrix.com>
From: Andrew Cooper <andrew.cooper3@citrix.com>
Subject: 4.17 backports
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: LO4P265CA0056.GBRP265.PROD.OUTLOOK.COM
 (2603:10a6:600:2af::23) To BYAPR03MB3623.namprd03.prod.outlook.com
 (2603:10b6:a02:aa::12)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: BYAPR03MB3623:EE_|DM4PR03MB6032:EE_
X-MS-Office365-Filtering-Correlation-Id: 89acdcae-9618-4d3d-ab39-08dba3459dda
X-LD-Processed: 335836de-42ef-43a2-b145-348c2ee9ca5b,ExtAddr,ExtFwd
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	B6xkJ1633Ap4Ijfez/evzqxrztOOnDK2uZZQkaFbp3YRo6ACBxZKkwZhgbOhL4YrDUxYE1FnL/r5lW6xLhnxs0DA5z713N1fcOubI2EZdfVBcdiS4lPYzohtemGI2gF1vv5v16WQYYH+G8atBiuRpr+4uVKLRTPxe9K5UoZL9oIaVOdgN+oZ+TBVXSLWhmV7KKr/IKGdex7HE4v34J080sRLtiniBovVMPzUBFTaxoNgI4IbIpXq4l4eiaVz366AJRUXiSJKEbm80BEpHGv91SUzFfGpK/OD2OpgRTBJPbewTeunNXkPu72USHgxWe3U9qgsKM1H7sOCAmYibKgTvRTti2QKU1qdAQV92DYrniNjHcvXLn35lBlARMc06LWAWMqDuDOc/2uuoqQf2EAFVSWAPLj630Y6t2Lvp2wB96qsNhjRJW4JCcMJpKAD7qao0pc83S4xpriWZxY7y/7bIuYq++X1F3BdXxH6P8PIZ6umZThGoDUJ1YuuB852LgFPvbVtm2fKXV5K7bAv5Qd/r62iFoRc8YyvtLKSTkJ3+6bB8ZE2rG3pFUolEYQrGNOcHEOLK+QbYxkMFhgiUlaNinek3ipHQUMo9/7leFjsLCynp6aH32M+JSHrxJTUx3EwsVuLqvFWY00w0jrkJD+uDg==
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:BYAPR03MB3623.namprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230031)(396003)(136003)(376002)(39860400002)(346002)(366004)(186009)(1800799009)(451199024)(54906003)(6916009)(66946007)(66556008)(6512007)(66476007)(316002)(8936002)(8676002)(4326008)(2616005)(107886003)(82960400001)(36756003)(41300700001)(478600001)(6666004)(38100700002)(6486002)(6506007)(2906002)(4744005)(83380400001)(86362001)(31696002)(31686004)(5660300002)(26005)(7116003)(45980500001)(43740500002);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?SmhsWitjYTRwTEZ3a243TTgvL1JmRW1uWTRCeXZkUG1weUN4ZDhYemdtWmhi?=
 =?utf-8?B?U3d5V2xzTmFCZ1piYU1MZC9nckRtNTR2N3ZoMnBPcHNaVjh1aXIzRmRXWHI3?=
 =?utf-8?B?TUkzZHBBTE1IekdJWHBLSGlNclFMZU1zTll4bGFFQms4OEF0TUlkVjF2TFJ2?=
 =?utf-8?B?akdLY2E3OXQ0SlZIdnpIZ24vUGFIR2RwN1hPSVRwMms2QmN6ZWFJR1J1ZGNG?=
 =?utf-8?B?eWdoSlAxY3pkbmYyZUNwRm1abkRPK2M1bElHTUx3QUtNdWJ4LzdaeFFpNGox?=
 =?utf-8?B?RDFNQlJIMGh1OStTeFBhdjZjOFY1M3RDWnUyNnFpQmdLa1ZldWZkNVg1RExv?=
 =?utf-8?B?ZURTbXV0eGYzU25SVVpnYm9KOWdlRjVtUGp5RnN2dDNlZnNXTHpHZ3VwQWtI?=
 =?utf-8?B?NW0rOFBTempMeml0MzBOMFBFbzN4UWYvYXpyNk9SOTdjQnNvSmxmamlOM3A1?=
 =?utf-8?B?WEF3YUlCakdXSnNaZFJ2VkxpbHhYZ3ZlU0RNT1NySVV2UFEvNTFOU24rNk1j?=
 =?utf-8?B?WmhTZy9RU1hrc3E4aXhaMHViNlg4N0w5ZlI4cU4rS3FLSnF1V1BmeHZTLytF?=
 =?utf-8?B?b0RCb2RkbHd2OXJhWTJleFhXU3k2eUk5QXBPblRDMXlvRU1tZG9Mbkh1cWtN?=
 =?utf-8?B?eGZQK28yNjVSUTVvQlNlVk4wSWRObmxFTDJKZG5Rd1JJVkp0K25weUhmYjV2?=
 =?utf-8?B?SjluVkNiZW1CL3dTUlMxcURYaDdIb2NRWFYzUnhaYlVsTVBZTGtJaGRMRDJz?=
 =?utf-8?B?NkV6NklGVUJVOWt3T3JQZHpzeGFJYm5kclYxRmEzQVE3bkZ2SXZNY004WTZ2?=
 =?utf-8?B?cDFYb2NtMDBOTU5qSnRNVmhKM0k0UGFKYlpuZUJPWGRPZ2xqc0NvWUordTRo?=
 =?utf-8?B?bGkvNmtycC9zTUdPTURPVzV1TFRucmpkU0w2TGljUmhhU29XdWFTYkdrSUJq?=
 =?utf-8?B?QXpxai9qT1NlUVUyd0lBeE5EaERRZFAzam1XWjRpeW1xTUxSZGtvalE1QkMx?=
 =?utf-8?B?K3hRSEx3aUM1VkFtY2NONUhlemFmZlV6RDdRcUFoS216Q1V4T3VVdURaSkYw?=
 =?utf-8?B?QUpIUGVqT2FiN2lMeE5GTTZWcVRmZFRHeDludDNiY21MRnFWOEhSajRCZDJV?=
 =?utf-8?B?YmVZUi82SEJkV3NablF4dHpHVnAzOXA0YnhtajFWRXBWSzhSanBOdjJUYnJ1?=
 =?utf-8?B?UHBoQVZPd0ZITmN0VmZKWGJTVnZRUXVLUFV3dExTbEtwVURSRCtnTWF6VFZq?=
 =?utf-8?B?a2VuM2d4RjMvSFFjK0RmZjR5U0doMDkyWHZlUFdRWmUwZXZaM0NwaFBPTHEr?=
 =?utf-8?B?bXZMTENwQUE4c1FEcGM2bWxvNGdPcjlURjlxMlZJcHZJNlhzQVVYYklzdnZC?=
 =?utf-8?B?WXcvWm11c25sd2NMMUxvRmQrRXkwc2Y2aEpYZUhZN2ZRUnJoYmtZNUNjY1ZU?=
 =?utf-8?B?b2tuMEQ0eWxvZGd0cW5ScXJIc28vaS8xdDhYaFlzd2hpcEVXblFLeWNZVUtJ?=
 =?utf-8?B?cEJ6ZHFyQU5JQW9wR1l6NktYaEJ1S0NNbFZ3M1NGR2k4WDQ0eTRteVBGN3Zz?=
 =?utf-8?B?eGVoTUlodVVxdzVPMnQ1eDNUOHZrbjYra2M3SDZNTFRYT05NelR3bVVEbHR1?=
 =?utf-8?B?NGIwM1BwTUg2aElIM2JJVkNEUzJqZzI1dVVsNEVjYml3eFdWd0tUaTBxL1Iz?=
 =?utf-8?B?Ui81dHJOY3V0ZkxEc2FGMUptN3dSWjlKTzFJMFA2L0FRMm9neEM5Ykp3eDNT?=
 =?utf-8?B?ckZ0RUMvQkd4UitycGtEZVloNStXVlkrTjBnVUl4V3dKZGRaSXNLMkZORG02?=
 =?utf-8?B?Q29BR1Z2T1FaSEZacUdmNnI3QWMyQTNZYzFVNVFseUhXbERpQ3VyKytCKzJQ?=
 =?utf-8?B?QTZpN04yZFhLNW9yaDBaSlYwQ0Vobys2ZmhqT2ZqMEJoUXBCbkN3OXh5Vmt6?=
 =?utf-8?B?K1FKcmZiNGtMVC9VeDNwTHYyYVBEV2d4MkF5MitsRTlMZzEyV0dNRTVvdkxO?=
 =?utf-8?B?cXAzTXRaOGhNTnl4WWR5SndZMVlLODZ0WVgxV2dnWWhUYlN4MUNGeTVRNHNB?=
 =?utf-8?B?TCs1cTJrRXp1NXBQQ1FMa0FYakFodlpROXdFMVlZalUxeG9zUnRUdS9TY3Jj?=
 =?utf-8?B?dHFLeDR4b2tJYnpNaDNBTzVLY3hneDBjdkxFUTJ4WE0ybWp2QkVtZ0hSeGt1?=
 =?utf-8?B?cmc9PQ==?=
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-0:
	dVbXiOr0yZGykv1k8MbvuDSEqBmAMbjLkbSx7Dw6UEvAlNpsuX0ZzqElBZZkvG1Vq4BkFT9KaLRKYPNGhBb5p2oyFGj4Wi3DimjmlNdu2BGsOjgUY8bN7LhZNHaEmCaqWx5kYpUZpvhlDxyV/KEZpcdkEjoPLlZrKXiq6bWibjHZS3AkMnbJZI6ZrCpKMxUSXWomlN6Zo0AknL1+PPfVNNCxrlDlG883ddT2ZLq4oQfoAYOEpXmy680wtx/aT0u+wb7kqY5MJNyL6vytBwA6baZNdmPKepWRlwYZTus3WRhAyA/ACp/90T7JN+Van8SHF3ksAz9/P+WPEl1g/R2AmpTKFYSTd/IYp0ri1BdE2uaJW81dI8bfpUYIixBRU79G8/SQi2+/5hnNNMjzzO60/zQwuG4bbOsJsKyFDur77EJeoiBgLC/31d5HEDoEf71Lfn2/VWsoo5rq2cM4l+USG0/ErNlB2gsKBIgQAFYqlpIk6prF4/o+KxP72/6r9eh9TLQPb4yxyP+qwYJvV2dYHSkEVMAxZZTjUSsZPw6nBAMCE70YYShcvUNMFKMtGNP3DqYSM4t9hiaLCB5wQApXtRHGAwOcZt1+bJXcX8V2Mpl05zVVKRKN+bf94GJrQam2qIt7sDsCOutYUny1MCg1qg36/Emb7g9feYNBxTYMcn8mUGSszRRGAs75EMymTPPkDbk4A6HxklhamS5V858s426uIRMuHp3LF+6AbOcurnLRMd3/OnzKOZ4BaTEZRKqr+/Tmf/EgFHs+96gNjRYEgFcr2MVpcrfZVk1rd6IwoGE=
X-OriginatorOrg: citrix.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 89acdcae-9618-4d3d-ab39-08dba3459dda
X-MS-Exchange-CrossTenant-AuthSource: BYAPR03MB3623.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 22 Aug 2023 19:26:00.2755
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 335836de-42ef-43a2-b145-348c2ee9ca5b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: y6PblJFaM+8pjngjYw7Bt5MR69CnEktSyjJXTWhyO/svIhWFnCnfrhYkuB5U/qkSZnmHQg+XkdLgozWKAAH6URrNYm5MXUAp+KzjNwdgINc=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM4PR03MB6032

Hello,

Looking at the patchqueue, the following should be considered for backport:

19c6cbd90965 xen/vcpu: ignore VCPU_SSHOTTMR_future
0946068e7fae x86/head: check base address alignment
eaa324bfebcf x86/trampoline: load the GDT located in the trampoline page
aab4b38b5d77 xenalyze: Handle start-of-day ->RUNNING transitions
c81b287e00b1 xenalyze: Basic TRC_HVM_EMUL handling
813da5f0e73b x86/ioapic: sanitize IO-APIC pins before enabling lapic
LVTERR/ESR
cdc48cb5a74b x86/ioapic: add a raw field to RTE struct
ef7995ed1bcd x86/ioapic: RTE modifications must use ioapic_write_entry
a478b38c01b6 iommu/vtd: rename io_apic_read_remap_rte() local variable
3e033172b025 x86/iommu: pass full IO-APIC RTE for remapping table update

Everything here is fixes for issues we've had customer bugs about.

~Andrew


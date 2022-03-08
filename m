Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 28B4B4D1998
	for <lists+xen-devel@lfdr.de>; Tue,  8 Mar 2022 14:50:28 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.286897.486589 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1nRaEB-0007f4-KX; Tue, 08 Mar 2022 13:50:15 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 286897.486589; Tue, 08 Mar 2022 13:50:15 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1nRaEB-0007cE-HR; Tue, 08 Mar 2022 13:50:15 +0000
Received: by outflank-mailman (input) for mailman id 286897;
 Tue, 08 Mar 2022 13:50:13 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=fWwI=TT=citrix.com=prvs=059ab6e88=roger.pau@srs-se1.protection.inumbo.net>)
 id 1nRaE9-0006oM-75
 for xen-devel@lists.xenproject.org; Tue, 08 Mar 2022 13:50:13 +0000
Received: from esa5.hc3370-68.iphmx.com (esa5.hc3370-68.iphmx.com
 [216.71.155.168]) by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id abdf1119-9ee6-11ec-8539-5f4723681683;
 Tue, 08 Mar 2022 14:50:12 +0100 (CET)
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
X-Inumbo-ID: abdf1119-9ee6-11ec-8539-5f4723681683
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=citrix.com; s=securemail; t=1646747412;
  h=from:to:cc:subject:date:message-id:
   content-transfer-encoding:mime-version;
  bh=ApJmu/csqEudMLqpJ6fTNTRd1xLjxspTzGCX/2ZvO6c=;
  b=eeuBXJoqei4JiuiBNQCIXfvhfuowYG4/oPqs2pZO/gJBey32cKAA/4lD
   tqfC1IRjZ9H67xx6WqSH9Y1AYd6/GYaPFTSXdvjX4yPSHG0uFoZd00CmV
   umJB8aI9kaY4SXRXQL4WfXMrJsEX6V9Pye6jP3+gD9S6hqrTicQkCB1TG
   c=;
Authentication-Results: esa5.hc3370-68.iphmx.com; dkim=pass (signature verified) header.i=@citrix.onmicrosoft.com
X-SBRS: 5.1
X-MesageID: 65183154
X-Ironport-Server: esa5.hc3370-68.iphmx.com
X-Remote-IP: 162.221.156.83
X-Policy: $RELAYED
IronPort-Data: A9a23:JRR0laA6sVG0GxVW/93jw5YqxClBgxIJ4kV8jS/XYbTApG8h3zBTy
 WQWWzjSPv2LZ2qjfdxwOoqz/U4B6Jfcy4NjQQY4rX1jcSlH+JHPbTi7wuYcHM8wwunrFh8PA
 xA2M4GYRCwMZiaA4E/raNANlFEkvU2ybuOU5NXsZ2YgHWeIdA970Ug5w7Vh0tYy6TSEK1jlV
 e3a8pW31GCNg1aYAkpMg05UgEoy1BhakGpwUm0WPZinjneH/5UmJMt3yZWKB2n5WuFp8tuSH
 I4v+l0bElTxpH/BAvv9+lryn9ZjrrT6ZWBigVIOM0Sub4QrSoXfHc/XOdJFAXq7hQllkPgpm
 egWspG9SD4SFYqSv8QwWRtVSHpxaPguFL/veRBTsOSWxkzCNXDt3+9vHAc9OohwFuRfWD8Us
 6ZCcXZUM07F17neLLGTE4GAguw5K8bmJsUHs2xIxjDFF/c2B5vERs0m4PcGgW5g3ZkTQZ4yY
 eIYbzR2USvBaCFxYE1IOskanOKqjHPwJmgwRFW9+vNsvjm7IBZK+IbqNN3Za9mbX/J/l0yTp
 n/F12nhCxRcP9uaoRKH+H+xgu7EnQvgRZkfUra/85ZCn1m71mEVThoMWjOTq/SjllS3Xd4ZL
 kUO4zcvtoA77kntRd74NzWorXjBshMCVt54F+wh9BrL2qfS+xyeBGUPUnhGctNOnNQtWTUg2
 1uNntXoLT9iqruYTTSa7Lj8hTGvPSkYK0cSaClCShEKi+QPu6lq0EiJFIw6Vvfo0JulQlkc3
 gxmsgBm1ohIisMG1pyA1neZpBKBrJrEFVU6s1C/sn2e0it1Y4usZoqN4Ffd7OpdIIvxcmRtr
 EToiODFsrlQUMjleDilBbxUQer3v6rt3Cj03AY3d6TN4QhB7JJKkWp4xDhlbHlkPc8fEdMCS
 B+C4FgBjHO/0ZbDUEOWX25TI5lypUQDPY68PhwxUjaoSsIpHONg1HsyDXN8J0i3zCARfVgXY
 P93i/qEA3cAErhAxzGrXeob2rJD7nlgmT2NGsCmlE33jOH2iJuppVEtagDmggcRtv/sneko2
 4wHa5viJ+t3CoUSnRU7AaZMdAtXfBDX9Lj9qtBNd/7rH+aVMDpJNhMl+pt4I9YNt/0Mzo/gp
 yjhMmcFmAuXrSCWcm2iNyE8AI4DqL4i9BrXywR3Zg32s5XiCK7yhJoim2wfIeF3pLY9nKQvE
 5HouayoW5xyd9gOwBxEBbHVp41+bhW7wwWIOiuuej8keJB8AQfO/7fZksHHqUHi0gLfWRMCn
 oCd
IronPort-HdrOrdr: A9a23:GRd/5a7pu+pPGxkA4QPXwKvXdLJyesId70hD6qkRc3xom6mj/P
 xG88536faZslwssRIb+OxoRpPufZq0z/cc3WB7B9uftWfd1leVEA==
X-IronPort-AV: E=Sophos;i="5.90,165,1643691600"; 
   d="scan'208";a="65183154"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=hQC82P4o3otIfRBsDLwsGNx5yeSoV6bElQ0tJDKqVbvAragzSQPacPU6saRMNIGXaZFYhKqTiVs8ufQGYsChj0ejWbjYgvaGjCTTM2w17x1dHHmKCx2Nen36bNY0hRF0+ahwoU5BX1WFmYlf5Ws7Hfu9E6RinvKqqCPWMFJP6fby/W+73cX7wRHjixmaEZZXqvBpuToOumDsZWhaUFENa/5QsLjkLfMl7vuqIrKPFZb2afT3+/Y2nITZ2RYOY6+SspoL1f9cOcIjpxOzQNNfAjRZ+z9jJtq+xYuO2ezHlEzXCCbl9vPvSLoHEkIa1pV8IGo08y4j41vguL8FiPnszw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=hZ70NmD9WZ+be6okT6ZM02Z4gO63tJJRl36GZkXlk+E=;
 b=aep31cxAu/jkNfQSlpMBcoUqdSm6fXpfUW6THEHIxrOclPHyvafHdAE+DL2TQLJ7yv4nzCIMSjtELncgL7DNr+aW2FLJqOmR8PuWgCGOLNf1dUlZPcM2wsXImq7p8KX6iRqbJEkXcO9uP3jOkL15+A2Kw94yxirnqqJQ2jOGjH/Kl4ULJzQyENBpe0KHeMdRv8X1rov+ZjikM7tJYRR5//ZfsK2VHUsgYkYxf7yYsBLUxAESOWRBDqvnt8h8dlTNdRI3MCI/U15+awL9QZGMCshMpbZTMwU6yfRYyGUlEq+4aSSWsJu8dr098JeDWFDrS/UC3GDR7DqG1ob04vrgXQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=citrix.com; dmarc=pass action=none header.from=citrix.com;
 dkim=pass header.d=citrix.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=citrix.onmicrosoft.com; s=selector2-citrix-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=hZ70NmD9WZ+be6okT6ZM02Z4gO63tJJRl36GZkXlk+E=;
 b=HXD3L2ZleQLHGg81hqqMNsdkPNLXyHoho9tmSR5Z50MPr7vAfBmKKZjxEhF+BWFrZQTl8Bt5010nnLhFkz5gdtoiyPVqBKtcSf56T99YeowTFS/MMZg7H39JI7rcsdaESu77f/cceafYISwxX9fiiZf65n4DCBS2BaKWDqpjEgk=
From: Roger Pau Monne <roger.pau@citrix.com>
To: <xen-devel@lists.xenproject.org>
CC: Roger Pau Monne <roger.pau@citrix.com>, Stefano Stabellini
	<sstabellini@kernel.org>, Julien Grall <julien@xen.org>, Bertrand Marquis
	<bertrand.marquis@arm.com>, Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>,
	Jan Beulich <jbeulich@suse.com>, Andrew Cooper <andrew.cooper3@citrix.com>,
	Wei Liu <wl@xen.org>, George Dunlap <george.dunlap@citrix.com>
Subject: [PATCH v3 0/2] livepatch: enable -f{function,data}-sections compiler option
Date: Tue,  8 Mar 2022 14:49:22 +0100
Message-ID: <20220308134924.83616-1-roger.pau@citrix.com>
X-Mailer: git-send-email 2.34.1
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: LO4P265CA0049.GBRP265.PROD.OUTLOOK.COM
 (2603:10a6:600:2ac::12) To DS7PR03MB5608.namprd03.prod.outlook.com
 (2603:10b6:5:2c9::18)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 01e24ae6-ebc4-4c31-856d-08da010a8dc6
X-MS-TrafficTypeDiagnostic: DM5PR03MB2618:EE_
X-Microsoft-Antispam-PRVS: <DM5PR03MB2618CDBE4A41A0E472E293B18F099@DM5PR03MB2618.namprd03.prod.outlook.com>
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: ouxseUvpfCHRpww8v9W4tQG3TsjSO31SXleNKW5i18635/7Ex+xmsvnLEDXU2MX32HX0E3T0/dpPhAAHUU3GqhZt8TmoNvrveg5jC2nF/7mD6VqqgOPartveKB1OofdSCLlZtseUs+XHCpiFoRLCainWZQ75SWYHil+bF+vtT7mt1MUbLaVqz/P1X4KAEa2LT8JQ0cU5wWTzxHB69S5WlAKSaq7l57MvjkNQZlByZcH1fB/AzLQfn7cYKrqM5P7fXBeMVhIigFAsjrc6YltXVgmpGmFFB18iW9rmL1ugoJ+ehsquQkX2FUvqVgsX46OD5C4mQMQNs8pmCbxX1J1lnjKhexS5I9HEHNscEAHXsDFhTH7yXdJ9YEjatQz+kVn1wN7GA6lZMuOEeSD+2mXFw2jjQ9rV+LuHuAC0M9o3alJ7QFQTyHLke+UWTYCJCwpdpNL6BWqCvEMNeD9TQqf7Eefc7wC+xz696KRrbrqIlZFdcNsRkxPu77DWaztW1G54u4r9eWXtyqXczx/ZYS7j95A4JxZ/QVzdIUbt26oNqp/IKa5/zH9yT2zgTZ5LNYjpehF3CnLTJ8qpqvckpDnMjPPM6zuy/PLXyNi8Avas8Et9OXadVbbd3crTB2hH9MpHBZqh6kKr3Bq6vUw5GZxUVA==
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DS7PR03MB5608.namprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230001)(4636009)(366004)(83380400001)(66946007)(4326008)(508600001)(66556008)(66476007)(8676002)(8936002)(5660300002)(6506007)(6666004)(36756003)(4744005)(6486002)(26005)(2906002)(86362001)(316002)(186003)(38100700002)(6512007)(82960400001)(54906003)(1076003)(6916009)(2616005)(107886003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?M280VnhYdEhqblJ4UUViOU5CSUd0Q3NtVTRYeG9LNHYwd0tEZi9BNmNhWE4r?=
 =?utf-8?B?Sk9aNzhPK2RGWk92b1BHdkVJYWlLOVNJZS9pK2xmY002N2pTaXM0cmptb1Q4?=
 =?utf-8?B?VWIyNlFKTmFhcjVWYWlJV1dSS1RnbVRnMFhHY2MrT3l6bXRYUys5TkNtSC9Z?=
 =?utf-8?B?dlZFTTBaT3ErNlNoWkhHTmRuSW1OdUVJaHNKRXltQ2VPdUhORjFFVnF1Q2Ix?=
 =?utf-8?B?SUE2NmROeGtsV2FZUjdnSEE3b0FZY05BNmhZM1A2RlZCNG4rbnVVVCtRSEVB?=
 =?utf-8?B?QnBhRTNGVFJudXQ2TGl6Q0ZkcFRPUHk2dDZTWjFUN3BHQk1zajJ3VmNFYTd6?=
 =?utf-8?B?R1psOTY1UkdqMU5PdmE3M2tvbFFFUG9aVXFGaVBaT0I3bEF5L2lIVEQ0ZGVl?=
 =?utf-8?B?RG9ON2JIN3FGcHB1Vk1MOUNyMk40ZmJobDEyOUlMcmRSNU5tZ0xCZGlGNzkr?=
 =?utf-8?B?VjN6cHdwNmZvb1ZITk5uRkZ3QWljN0dDV1R2cDVIN1JNbGFpdDBPTUI4U1VU?=
 =?utf-8?B?Z09mc043K2ZWRVJlRWR2L2gvSWhLSE5qS1JNcUJXYnk0Qy9QWlNmK1kzd3hj?=
 =?utf-8?B?eFQyZ0NmdjNHK1hpL3RuR1NJY3dsdktEa0dFV0YvVWQ0Rk95bGFLK25CV0Ni?=
 =?utf-8?B?cWR3NWk5bFdBVXpRSmV1TVlFVnp2WXhXTWErckNIblNZb2V0b2xlRkNaYTN3?=
 =?utf-8?B?ZWs5bjA5Q2dTVDBBSzF3ZTM3R21KK2wya2R1NG9COUh5ZUFEYWNYUDZjbjhW?=
 =?utf-8?B?c2d1cFhoeU1XSndhTE5tZVZQdGVPTCtRKzBuUG9lZ2habWs5ZlJ6L0hGSlow?=
 =?utf-8?B?NDBWOVgzWEtwUnNqbHdEamd4dHFza0hEc1JESEhITFZNS3pveEhKM20zNVhh?=
 =?utf-8?B?N21VWlMrMnA2cWtKaGlLSEdLaFdmWE56K0Ixdml2WEJmZGNSMTIyMkRKdnJv?=
 =?utf-8?B?Qm1ldmFQRHlMK3pBVTFDTlNtdjczM3YzRDhQN2JBQ2tBMHRGU0dzcDM1cUoy?=
 =?utf-8?B?K0NXbDVoZWZNOUJlc05SZ1pDTGRDWmF6TWR0QTZIUGExZ1JOc29PekRxR3hI?=
 =?utf-8?B?OCt4S1RZWDg2U2RWRjgvWEVjcGdQR0xjaEo2VXorZmpnNjJSZ01lQkt2R1dv?=
 =?utf-8?B?L3o0Yzl1K1VsQVZjZElXV21QQkJMUUNTMjFYOUtmNUFyUHdYNkpaWFRPZlZV?=
 =?utf-8?B?MTFwbWlvSlpnd3VIcFhZd0VTTC9OSDM2WTh5VkRWcTl3UmV0RHYvczA1ZUl3?=
 =?utf-8?B?MEoxNUNrMFlyMGp2SFhkWGNmM3Jxa0FobHVHM0JDUlRPYjVjWlVvNHdCSXFM?=
 =?utf-8?B?OTR2VHJKbEp6RHdHUXRLT21JM1FZQklmVSthOCtsNXUrWmNkZHo5NUdmVXl4?=
 =?utf-8?B?a2luUVErckltSmZrc1ZUSmZhZkFYM1NDL0RkUUp5cUllcFRzbGFSN0tITndY?=
 =?utf-8?B?TE13NWErbkdDZnlQRUJuVHRpL24rK2xFYis4Y0dpaFY3cDVmT2RmY0Vra2Ev?=
 =?utf-8?B?a3N1RzJuOFdsNWRSL0lyWVd1R0ZZcTlEZ01PTkRCaDE4ZEFZai9Wd2hLQU5T?=
 =?utf-8?B?R1YzOFllNjgzTzRiY2hOZjNqaHkza1RpdWVHOHVCOU04UC8wRkloNnRwN0dp?=
 =?utf-8?B?SWNnU0VFMlBzN21obE1FalVDOElZRnkyY0pubERJNHBXTXQzNHdsZGFqOERy?=
 =?utf-8?B?YUV1djRrdW9kV21sbmhNczlYMk9PYTkvcmdJNzhaellyaDRJK1pKWDUwZFRu?=
 =?utf-8?B?VHZqeW14dkU0VDYyMWNLb3VxMVdMSnRSRklsMzJNTGlYOUFWTDZzT2lJbm5q?=
 =?utf-8?B?TlR0a2R6MGJ3WnFWbTFEeTQvY2VweE43ZEIzeTB1QW91b1RxVmk3d0ZqaXpF?=
 =?utf-8?B?cHhqUnFpVzQ5U3pIZ0liM2tjWVdwblZsTGY1SHVZK2MzNWFMWjhwT3dBa1g5?=
 =?utf-8?B?ektrMDRzWmlCQ1YzOE1Kekd2U3VyTDNTSHJZUVFsZ0pJRE9xazdzWS8wR1lK?=
 =?utf-8?B?SENhMWI5TVhJdGRNY0lRaDZGSlcxcTk4TUtBWmprMzRhY0x0c0JtOE5iRzRl?=
 =?utf-8?B?ZFlVZWFIQmxMSTJBOUNDQU5CcllINGhCNnlSQU5KOXNHd1RiMHVJeSt3Ykhu?=
 =?utf-8?B?aUt4V3RUMUdmdEZ2d2tMaTNkSVlqaTMzMnlicWNmUm5ITm9iQzBVMEkveXFs?=
 =?utf-8?Q?Lo9Dsdwex4wzFC162UxJGjQ=3D?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 01e24ae6-ebc4-4c31-856d-08da010a8dc6
X-MS-Exchange-CrossTenant-AuthSource: DS7PR03MB5608.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 08 Mar 2022 13:50:06.8119
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 335836de-42ef-43a2-b145-348c2ee9ca5b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: xijtrkE2KXem2jAnyS9oh/1sxDzC5ct191CWqfDCZTatIHsaTdTUvBSdPkYcChYrh5j+ZoR7heR0J6FNy7DPBA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM5PR03MB2618
X-OriginatorOrg: citrix.com

Hello,

The content in v3 has been split in two patches, but is still mostly the
same. The main difference is that first patch does a bit of cleanup of
the build logic now that the header object file doesn't need to be the
first one passed to the linker script.

Thanks, Roger.

Roger Pau Monne (2):
  xen/build: put image header into a separate section
  livepatch: set -f{function,data}-sections compiler option

 xen/Kconfig                 |  4 +++
 xen/Makefile                |  2 ++
 xen/arch/arm/arch.mk        |  2 --
 xen/arch/arm/arm32/Makefile |  3 +--
 xen/arch/arm/arm32/head.S   |  1 +
 xen/arch/arm/arm64/Makefile |  3 +--
 xen/arch/arm/arm64/head.S   |  1 +
 xen/arch/arm/xen.lds.S      | 49 ++++++++++++++++++++-----------------
 xen/arch/x86/Makefile       |  5 ++--
 xen/arch/x86/arch.mk        |  2 --
 xen/arch/x86/boot/head.S    |  2 +-
 xen/arch/x86/xen.lds.S      | 22 ++++++++++-------
 xen/common/Kconfig          |  1 +
 13 files changed, 54 insertions(+), 43 deletions(-)

-- 
2.34.1



Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 050244ED9CE
	for <lists+xen-devel@lfdr.de>; Thu, 31 Mar 2022 14:46:32 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.296952.505659 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1nZuBv-0008Ku-4o; Thu, 31 Mar 2022 12:46:19 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 296952.505659; Thu, 31 Mar 2022 12:46:19 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1nZuBv-0008IQ-1g; Thu, 31 Mar 2022 12:46:19 +0000
Received: by outflank-mailman (input) for mailman id 296952;
 Thu, 31 Mar 2022 12:46:17 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=lDhN=UK=citrix.com=prvs=08274bcc4=roger.pau@srs-se1.protection.inumbo.net>)
 id 1nZuBt-0008IK-Fc
 for xen-devel@lists.xenproject.org; Thu, 31 Mar 2022 12:46:17 +0000
Received: from esa4.hc3370-68.iphmx.com (esa4.hc3370-68.iphmx.com
 [216.71.155.144]) by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 8cb3c620-b0f0-11ec-a405-831a346695d4;
 Thu, 31 Mar 2022 14:46:15 +0200 (CEST)
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
X-Inumbo-ID: 8cb3c620-b0f0-11ec-a405-831a346695d4
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=citrix.com; s=securemail; t=1648730775;
  h=date:from:to:cc:subject:message-id:references:
   in-reply-to:mime-version;
  bh=ZYlpn569WkXX4+JDJnC1Yq8ss753qGyDv8wWbYUlZM8=;
  b=gwYi3ykpF9OezbLjwWIrSfi58A0YHcAQAK5cp0gBgTZNI6HkMJT4p4Kj
   /TrklEd4D+XCjHZ1/dXkG/sLtfAbs9s8Dga7n0uXSGT0NondmjNjtZ0bt
   SLqY+IXdTCfSXmVi78BWk7gC35p98BAXaF2aKOtQDXAN3LbgTFC2Om/Y/
   Q=;
Authentication-Results: esa4.hc3370-68.iphmx.com; dkim=pass (signature verified) header.i=@citrix.onmicrosoft.com
X-SBRS: 5.1
X-MesageID: 70039788
X-Ironport-Server: esa4.hc3370-68.iphmx.com
X-Remote-IP: 162.221.156.83
X-Policy: $RELAYED
IronPort-Data: A9a23:BYEBpq9tFHvpF8wlryNHDrUDJX6TJUtcMsCJ2f8bNWPcYEJGY0x3n
 GBMWz/XbvjZYTH8etl0bt6x/EMH7JfXy4AwQVQ5qHs8E34SpcT7XtnIdU2Y0wF+jyHgoOCLy
 +1EN7Es+ehtFie0Si+Fa+Sn9T8mvU2xbuKU5NTsY0idfic5DnZ54f5fs7Rh2NQw2oPgW1nlV
 e7a+KUzBnf0g1aYDUpMg06zgEsHUCPa4W5wUvQWPJinjXeG/5UnJMt3yZKZdhMUdrJ8DO+iL
 9sv+Znilo/vE7XBPfv++lrzWhVirrc/pmFigFIOM0SpqkAqSiDfTs/XnRfTAKtao2zhojx/9
 DlCna62VD4qJ7zRoegQC0leMDtbGaZo/JaSdBBTseTLp6HHW37lwvEoB0AqJ4wIvO1wBAmi9
 9RBdmpLNErawbvrnvTrEYGAhex6RCXvFJkYtXx6iynQEN4tQIzZQrWM7thdtNs1rp8WRa2PO
 JpJAdZpRC7PRFpmMFoXMr4/gdmHjCK4cX5z9WvA8MLb5ECMlVcsgdABKuH9YceWTM9YmkKZo
 GPu/GnjBBwectuFxlKt8HuqivXegCDTV4cbFbn+/flv6HWRzGEODBwdVXOgvOK0zEW5Xrp3K
 VEQ+ycohbg/8gqsVNaVdwazp2KY+BIVRdtLO/Ym4RuJw6CS4gHxLlYDSjlNedk3rvgcTDYh1
 kKKt97xDDkpu7qQIVqR7qyRrC+yESENIHUeeDQfSg8Y/9jkppp1hRXKJv5zHajwgtDrFDXYx
 zGRsDN4l7gVldQM1aiw4RbAmT3EjofNZh444EPQRG3N0+9iTNf7PcryswGdtKseatbCJrWcg
 JQas/qY8dkNFICQrSCAGLULP6uMw/2rNBSJ1DaDAKId3ziq/neie6VZ7zd/OFplP644RNP5X
 KPAkVgPvcEOZRNGeYcyOtvsUJpykcAMAPy/Dpjpgsxyjo+dneNt1AVnfgau0m/kiyDAeolva
 M7AIa5A4Zv3YJmLLQZapc9AidfHJQhknAs/oKwXKTz9i9Jyg1bPFd843KOmNLxR0U99iFy9H
 yxjH8WL0Q5Dd+b1fzPa94UeRXhTcyRrW86r9JINK7HeSuaDJI3HI6WLqV/GU9Y495m5a8+Sp
 i3tMqOm4ASXaYL7xfWiNSk4NeKHsWdXpnMnJy08VWtEKFB4CbtDGJw3LsNtFZF+rbQL5actE
 5EtJpXRatwSG2+v02lMMvHAQHlKKU3DafSmZHH+PlDSvvdIGmT0xzMTVlCxrHNXVHrm6JNWT
 n/J/lqzfKfvjj9KVa7+QPmu00mwrT4anudzVFHPOd5dZAPn940CFsA7pqRfzx0kQfkb+gan6
 g==
IronPort-HdrOrdr: A9a23:/FyAdq8iiYsb0AL5yi1uk+DkI+orL9Y04lQ7vn2ZLiYlFvBw9v
 re+cjzuiWE6wr5NEtApTniAse9qBHnhPlICOAqVN/JMTUO0FHYSr2KhrGSoQEIdRefygd179
 YYT0AgY+eaMbEBt6nHCaODYq4dKaK8nJyVuQ==
X-IronPort-AV: E=Sophos;i="5.90,225,1643691600"; 
   d="scan'208";a="70039788"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=cbP2cMhrdAgAlKAal6okduiqkEorbr65amlLQ2RUAwmuuVtDo9uGuaPJ5qnWFnDd9f1XrJLzB/vv1Pi0lFnteTAvLoAejpJlXPkijWaMGcqTStgkRRzPpq/sBttlSyPKIR85V4l3JnBqhtAs0uB2rOSDL/UdDvGdNBMK9ondZP1QOvB4ebeUpu51WJs23+FTD9rwmtHsUuaV2sjHw8cnQt4qy9XkL7ZI6K6uYi7SBq2wCAWHHPoeuDZaL3+BVjxMUhrL0PHkX+m920jBDq50w1GVpygC+ejOJEfBjtSC6jfChh00mXt8wIoBe0auKo/ivCcdQycjudRLJGqeL9DKGA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=xZpd2z8XCYD0tvsIKMNxnojqkCSYeA76f3AC6XwkPYI=;
 b=Fnwsb+NzrpmRwh//PYbWmCfl1O7uyXlTmvIksACK45LImj27HdRxTFuC7EuJo/tQ4hlWB5GG+26NFCBPugx2fcP84HoH00jSoNHpf1cMYp2kVOSISu28ODweaG/NVd/OSu4+/E36ZeCMPkni6y5xbl89+GvAHhfFFUrnx4hc8VJRkDF57qLZxfqySuAXPlOo3fhN0RxeLij18HyxfPYP9HS+nBmTwUHc8dnKkyaITQNAlimSe4oiZe8dt1kqP/2XsE1piUVB+SEb0943afL0353OlEqc/6m/VUqrUrOU32oeZM/WwWIv1nXpThTQohVhu3BHSsxYDfnubGluTb12Bg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=citrix.com; dmarc=pass action=none header.from=citrix.com;
 dkim=pass header.d=citrix.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=citrix.onmicrosoft.com; s=selector2-citrix-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=xZpd2z8XCYD0tvsIKMNxnojqkCSYeA76f3AC6XwkPYI=;
 b=iX0ancYgpem7KlWAPQ+n9NMin7p825Fumq7dp3b+7M3bvhQKaBcJfoHFCC6oB1v4iPn2G3CD594iGppKaSqPIoF7i7pFE+S+J6kZkASTrY0KfH21DlSaYkozcU0rPG5jyhHHYDldUMdf9MLAWHh9dmsD30maJyoSOFwB6QCnQLY=
Date: Thu, 31 Mar 2022 14:46:05 +0200
From: Roger Pau =?utf-8?B?TW9ubsOp?= <roger.pau@citrix.com>
To: "Daniel P. Smith" <dpsmith@apertussolutions.com>
CC: Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>, Wei Liu <wl@xen.org>,
	<xen-devel@lists.xenproject.org>, <scott.davis@starlab.io>,
	<jandryuk@gmail.com>, Stefano Stabellini <sstabellini@kernel.org>, "Julien
 Grall" <julien@xen.org>, Jan Beulich <jbeulich@suse.com>, Andrew Cooper
	<andrew.cooper3@citrix.com>
Subject: Re: [PATCH 2/2] arch: ensure idle domain is not left privileged
Message-ID: <YkWijXX9P1FSs61W@Air-de-Roger>
References: <20220330230549.26074-1-dpsmith@apertussolutions.com>
 <20220330230549.26074-3-dpsmith@apertussolutions.com>
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20220330230549.26074-3-dpsmith@apertussolutions.com>
X-ClientProxiedBy: LO2P265CA0288.GBRP265.PROD.OUTLOOK.COM
 (2603:10a6:600:a1::36) To DS7PR03MB5608.namprd03.prod.outlook.com
 (2603:10b6:5:2c9::18)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: d8c2b612-3cc4-4e5a-7096-08da13146e2e
X-MS-TrafficTypeDiagnostic: BYAPR03MB3784:EE_
X-Microsoft-Antispam-PRVS: <BYAPR03MB37846C69664E135B1EB511368FE19@BYAPR03MB3784.namprd03.prod.outlook.com>
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 7oaxYWXvKz+kwFfK4skqss4WKhEoYYI7QFcnxNVwcXRY+paw7+wQ6BKHx+HPVo3OgcyvS3P0BH8pUHSxc5qVaBGRMrkobrYBtrvG02U3om7bkqKPqdw8H7aMTD92YOm4sYrO70qQulBEHFe3fhEbpX/8lyLkZCDOFWTLXZ2swipxQpsyglGiixn2K66Sf6VZAYQomQGzlwlG/KLOfcE7BR0fKGwzEMSwr/21F4l8hLy8Rx1BDL0LDmkVeDoay88uS30HW65hYct2yIhKiO2Hk2VfnIeoB5JD3FGCHYyGJzIyBpXKwhYSjJSBJk3VhqSuQgUIJu3QLp30qpKE0T7xmetwkna70mtS/gzHNmgFURPo/hdprUeFRv3jGpSHLGsfOhu2u25mZAu7+v0D/6hcrA1m7f4+n62CTRd1PwRYvp3wKwxyWqaf/q1gc5cV7c67ums8UmUocgXrfwF4YinsJ90G9f0LjS3WSA9arZEYaNUsehHIvSo/SyX146dFEdEBDRVio7hJep0CcNb9UsJMfmp93fMPHFhcJ2O+84Z9EUtM7x6z4hqWwD+H0ZFkzQeuiu8w+Is66c2PFzmMpRd1I4co9LnkZgQwQUIqwQk+ZbEhKjhR6pYPGisyTZWMGv1uXwEjijFstdkNCBQO9bsaHA==
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DS7PR03MB5608.namprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230001)(7916004)(4636009)(366004)(83380400001)(66556008)(33716001)(4326008)(8676002)(66476007)(5660300002)(66946007)(316002)(508600001)(6916009)(54906003)(8936002)(85182001)(6486002)(186003)(26005)(107886003)(9686003)(6512007)(86362001)(6666004)(6506007)(2906002)(38100700002)(82960400001);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?Vjd3cjNIbVhNbjhqS05OOUowTUVDazlVTzNmZmk1MXJxdGgyZU4rRm8xTmNP?=
 =?utf-8?B?SlM4bUJhc1BXQ2x0dE5PNUFmWjhUdHNuS1k4QmdCR25kMUw5WWtUTDB1N1Rp?=
 =?utf-8?B?OVZHS1dpWWtwRWdkdE16a3dvbjk1RFp1SEVOOHplVkp6ZnBjUENSMEVyVTB3?=
 =?utf-8?B?djZXbGxmNHRPbWJYR0RWeHIwUjdlSFNKTXNXSlhFZ2JDSGFMbXBRMnBUVFdJ?=
 =?utf-8?B?bVl6RVlralV2azh2cytQTktzVEFFRXBROHlMSm5BeVVPUmo0UjJNSGRPUVNk?=
 =?utf-8?B?TTczQVZWc3NJTGxsTkZpVk81Slk3SytNWm1jUWRuZUJueVNnbWRKUkxQUEpq?=
 =?utf-8?B?SXhKVHR6QXNKcTJvUjJEdjRYeVlQVEhzNlEzQ3hVUWVFdU8vSzRPcXgwcEN2?=
 =?utf-8?B?VGJCYVh4Y0FLMG5RV1RNYXFGVXE4YkZPZm5sUEpLMkQ2TjVXWTd2Wjc3WE1X?=
 =?utf-8?B?NW45amNxNHpEK0ZpbzhENGZKT3NKSmNYZExpVVdGVnFETEduTVZ6cU55ck5H?=
 =?utf-8?B?NWxhZkVhY2ZNUzEvU1kxTmxkY3dDTTRBVkg0UHp1SksxbW5xd1A5cWJ1NkMx?=
 =?utf-8?B?WGpCYklyOE04OW5BN0xvRGk2M1NvWFNXSm9nbTI5QXZFR1lQSTNONGwvNTlh?=
 =?utf-8?B?ZWdSU2dpTHdaWCtKRUkzcHdKS2h6Ym5lWk9wVitZY05uUmVpNmlJWVVrSHBs?=
 =?utf-8?B?TGFTZXFKdkdqZmloLzlCaGRVWUNld3Z3NlM2amgzMkcxTVRuWmVDbjRMcVpq?=
 =?utf-8?B?Q1ZwZkxBTmRVY1JiN0RBTmp2VGJsa3IvWHFjWTl1ci9pZm91R0h3MjdpNGM2?=
 =?utf-8?B?QWVkTXBuMlplTWp0N2tZU0s0TzNFSzhZdDZwNnByOUNoM0pNTVE1ZmM4emJu?=
 =?utf-8?B?b1pCVU02blI2RVFIWk85d2wzU09NdkFtMUJWRVBibGpXa1J0V3czL1NtS3lx?=
 =?utf-8?B?dXZ1bWw2TEltcEpGZjFoNDR2SXdEZ2crN0kzdG5obEVOVitHODlzalZmZzh5?=
 =?utf-8?B?K1pYeERSdmtCYmhaZkZYbFN2TjZkR2kzVW9PaHVjTE84dVYwMSt2c2R1M2F4?=
 =?utf-8?B?aGNaQy9IMVA0ZkYwdkh6cTZvamszVG1DZ09CR3YzOXJic0s2VytwQVJ2YS9H?=
 =?utf-8?B?M1FGWmFTK1AvTEI0RnR4M1hSSS9kNHZFd090U2VmalBCZXJEcFY5WnBKWStC?=
 =?utf-8?B?NlR3VFJLdG82ZVpXSFVzd0JMbm1NQzdlcHlBb2hDbVZkZUs5alNJanVmbGpQ?=
 =?utf-8?B?QjlLeThLWXp4Y0lFQkdiWEJYRFJ4OHoyaXlLSEVzejE5ckxlU1NqaGQvODdz?=
 =?utf-8?B?a2IybXFnKzlUZGdKRzd5Wk5HS0xVVE93elloK1JKK0dCSThnQ0lTODFzQS9T?=
 =?utf-8?B?UEJUMWlTWTBkVEdNMThHY1BWUVRUVHFqb1JCN0hPeEF0SHBPQVRtTVdJMUI5?=
 =?utf-8?B?dHRLU0JLaUhQMkZ4UDJOakRhREl6QXFpQ245aWhBaDFML3dCT3lYM25mRVR2?=
 =?utf-8?B?SWZySDJCUkRvaStQWkFDOTJQRU16T2xnTyswZG5zcEMzU2sxVTVZMGp0WS9R?=
 =?utf-8?B?VmtWRzF5UjNUdm04eURHaGluWnNqVzRLamtmK0tIK2xvSGd3Wm43eHRVWHl2?=
 =?utf-8?B?dklEUDZsV2NDU2UyVHRRdEFqVXlDSm9wT3ZUaU1BVVZUd0JjUFV4L2JqRnBo?=
 =?utf-8?B?cERsaTNKTS9IRWVjZk1URXhXYkprVktObHJnbUVqdlpBYkpuTkd4SWVwdWJh?=
 =?utf-8?B?UTdXc0dqdjl0Yi94dGNrT3Y2emxnSnlTc0phMGJEWVQxWU5OcDBzUFhtbW9v?=
 =?utf-8?B?K2FWazB5Q1d6ZVZpaEpXaTQvdElwVzR0UDBVR29pcXQyNGNxcEpldkwwVThh?=
 =?utf-8?B?dmFzWGsxdzV1M280aXBxS2ZwbEdTNitCVU41dzlHSDFISWluQUkzWEJSeU8v?=
 =?utf-8?B?VnZSLzhsaW5BVWZTbVZEbTh3bGpzYmpWYTRsa0RnRjZXcGRSZ0xXdmN2NFpO?=
 =?utf-8?B?UjZGcm9Ub3U2d2R0YjBpRGlZTXpMVkMvYjBidlUxODlVUGVmekZhcVpjeUYv?=
 =?utf-8?B?VFhRMFkrbDJoVUpWTy96bUZTQm1Mc21DTHdkV0NXZSt4cm9valhOb3dzeFRx?=
 =?utf-8?B?UDk3d2RpZE1vdDVTUGhhd3pDRlVIZUJRcGk1QittaU9tWEU2WlViUW4zU05F?=
 =?utf-8?B?Qm43K2xob0RwcVc3Y3pnbWdtazhwQXU2S3QrNFZYdDNaWVlxTENUZVFNWGVK?=
 =?utf-8?B?OUpsY3hMZk9EQ0VWVHNiUUxLMUdJckcwRllRZWNody9aR2dWejF0NHdFM1dR?=
 =?utf-8?B?VkxwY0R5TFNuUnNuNktnbzVZVkpVVnVhWHo3dzdNYTFheTkrZ2gvbW5BakJQ?=
 =?utf-8?Q?xCFHQIbL914WWEic=3D?=
X-MS-Exchange-CrossTenant-Network-Message-Id: d8c2b612-3cc4-4e5a-7096-08da13146e2e
X-MS-Exchange-CrossTenant-AuthSource: DS7PR03MB5608.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 31 Mar 2022 12:46:09.6875
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 335836de-42ef-43a2-b145-348c2ee9ca5b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 8njgT+TG9lYvnD2Yub+ZMT4YKnRdovA8iFapG//DZ1xhjOstHPZJK2BJDOMcYZ5cTWLSJMf8f8qI7jR44pHHPg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BYAPR03MB3784
X-OriginatorOrg: citrix.com

On Wed, Mar 30, 2022 at 07:05:49PM -0400, Daniel P. Smith wrote:
> It is now possible to promote the idle domain to privileged during setup.  It
> is not desirable for the idle domain to still be privileged when moving into a
> running state. If the idle domain was elevated and not properly demoted, it is
> desirable to fail at this point. This commit adds an assert for both x86 and
> Arm just before transitioning to a running state that ensures the idle is not
> privileged.
> 
> Signed-off-by: Daniel P. Smith <dpsmith@apertussolutions.com>
> ---
>  xen/arch/arm/setup.c | 3 +++
>  xen/arch/x86/setup.c | 3 +++
>  2 files changed, 6 insertions(+)
> 
> diff --git a/xen/arch/arm/setup.c b/xen/arch/arm/setup.c
> index 7968cee47d..3de394e946 100644
> --- a/xen/arch/arm/setup.c
> +++ b/xen/arch/arm/setup.c
> @@ -973,6 +973,9 @@ void __init start_xen(unsigned long boot_phys_offset,
>      /* Hide UART from DOM0 if we're using it */
>      serial_endboot();
>  
> +    /* Ensure idle domain was not left privileged */
> +    ASSERT(current->domain->is_privileged == false) ;
> +
>      system_state = SYS_STATE_active;
>  
>      create_domUs();

Hm, I think you want to use the permission promotion of the idle
domain in create_domUs() likely?

At which point the check should be after create_domUs, and it would
seem that logically SYS_STATE_active should be set after creating the
domUs.

Also, FWIW, I'm not seeing this create_domUs() call in my context,
maybe you have other patches on your queue?

> diff --git a/xen/arch/x86/setup.c b/xen/arch/x86/setup.c
> index 885919d5c3..b868463f83 100644
> --- a/xen/arch/x86/setup.c
> +++ b/xen/arch/x86/setup.c
> @@ -589,6 +589,9 @@ static void noinline init_done(void)
>      void *va;
>      unsigned long start, end;
>  
> +    /* Ensure idle domain was not left privileged */
> +    ASSERT(current->domain->is_privileged == false) ;
                                                      ^ extra space.

I think you could squash this patch with the previous one and also
squash it with a patch that actually makes use of the introduced
permission promotion functions (or at least in a patch series where
further patches make use the introduced functions).

Thanks, Roger.


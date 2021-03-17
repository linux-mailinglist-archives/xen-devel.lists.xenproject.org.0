Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 957E633EFC8
	for <lists+xen-devel@lfdr.de>; Wed, 17 Mar 2021 12:49:51 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.98666.187260 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1lMUgC-0004kS-Hf; Wed, 17 Mar 2021 11:49:36 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 98666.187260; Wed, 17 Mar 2021 11:49:36 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1lMUgC-0004k3-EQ; Wed, 17 Mar 2021 11:49:36 +0000
Received: by outflank-mailman (input) for mailman id 98666;
 Wed, 17 Mar 2021 11:49:34 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=htWl=IP=citrix.com=andrew.cooper3@srs-us1.protection.inumbo.net>)
 id 1lMUgA-0004jy-Or
 for xen-devel@lists.xenproject.org; Wed, 17 Mar 2021 11:49:34 +0000
Received: from esa3.hc3370-68.iphmx.com (unknown [216.71.145.155])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id 8f73085d-8825-4ac8-ae9f-35f12ccca221;
 Wed, 17 Mar 2021 11:49:33 +0000 (UTC)
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
X-Inumbo-ID: 8f73085d-8825-4ac8-ae9f-35f12ccca221
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=citrix.com; s=securemail; t=1615981773;
  h=subject:to:cc:references:from:message-id:date:
   in-reply-to:content-transfer-encoding:mime-version;
  bh=qSQN8ZkzZ/7nBInBg2N/bvEXaj2QZYkYt3PsxnNHIG8=;
  b=YwVkj5QDqRqZ5MTLpx3u0y8/e3OSqhQNl2Sb+zafYdFsF2YdE3fanR1+
   JeDZdJb9SoJlcs7opEdeygiWlKNvu/9sXsaRxhfnL5QDSS6MAnUolaHdU
   ZLQRdTUhGi43Pi5MAg8RUjAEJfPunjcOQHk0dFJAOr2HE4Y3gtEgMzyTn
   c=;
Authentication-Results: esa3.hc3370-68.iphmx.com; dkim=pass (signature verified) header.i=@citrix.onmicrosoft.com
IronPort-SDR: LGCvD1yZqbJbdHw993E0YPT4ZDHJYA1aC9h8ksVSqzbJ+bPrIVBWuXLhezGB5T9Oq5gmJfdvqC
 2XOdNOTxIitMmJ4rWWALikwFXFic0AC6lDYRaeZSpuo3HLKG30OAoJAi8l5M6Ua83xpo0e/SWj
 a/2zpxsMG/WIdUqPzwuUrSfg4UyS37csvUUYa8iKc1HkkvW8rrSPTmDzppyrZ3dBiousy4gz9O
 q4m/LaWFdZRmPHfE1VmaqvnreJy7qhnas8O3BtA7aehQ9u7fownUveniIm/wDPcgEQQx/mNb+V
 pwA=
X-SBRS: 5.2
X-MesageID: 39476402
X-Ironport-Server: esa3.hc3370-68.iphmx.com
X-Remote-IP: 162.221.156.83
X-Policy: $RELAYED
IronPort-HdrOrdr: A9a23:h37z5q66bndR+ota0QPXwRqBI+orLtY04lQ7vn1ZYQBJc8Ceis
 CllOka0xixszoKRHQ8g7m7VZWoa3m0z/5IyKMWOqqvWxSjhXuwIOhZnO/f6hDDOwm7zO5S0q
 98b7NzYeebMXFWhdv3iTPWL/8O29+CmZrHuc7771NACT5ncLth6QARMHf/LmRTSBNdDZQ0UL
 qwj/A3xAaIQngcYsSlCnRtZYGqy+Hjr576fQUAQycu9Qjmt1iVwYTnGBuV1Ap2aUIs/Z4e9w
 H+8jDR1+GYnNyQjjTd0GLS6Jo+oqqd9vJzQPaip+JQBjHligODbJlsVbuYrFkO0Z2SwWdvqv
 bgiVMNONly9mPwcwiO0GTQ8jil6hkCwTvDzkKVmnTqq8CRfkNFN+Nxwbh3XzGczmhIhqAa7I
 t7m1i3mrASMDb72AP63NTMXwECrDvOnVMS1dQ9olYabZETc9Zq3Ooi1XIQKrgsNgTg5rsqFe
 F/Zfusnsp+QBehY3fVsnIH+q3UYl0DWhOPQk01sseIyTRhnHdg00sCxMAE901wjK4Adw==
X-IronPort-AV: E=Sophos;i="5.81,256,1610427600"; 
   d="scan'208";a="39476402"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=F5cZ4BGGCh3RNiWqSbR6uwBGY9bQmpY2qLRG60bu0sue1Ipn45iTYs8luoGKLARwKFOmQIT49wic88+By/T8w0bmlDCiZkVsEmPLI83gRXc3ZOEuIRPG5hQCgQAVJgQFb65L9FTkB1YemX9IPNUnki7+H0mzSpqBpVEJ3fQRpUvjNylOJ9WmXXSc91bXVop1aH9vuBh3g8TGI6bhL6N/8qLDsxIKYLythGHJsefLxsOIeI8ChjCyfgG8EPgyGuhNI3OKud7w3p9UA9FsrH3tMNgv0sopIbiVGehRBITp6p8RqpBJLXlrm+CN/5Oxxxp5Sx/wMttFKwDxo8tnwtha7A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=qSQN8ZkzZ/7nBInBg2N/bvEXaj2QZYkYt3PsxnNHIG8=;
 b=n0LEuYs4qzbTH1lIvSDx3H+6fgio8OUntL2QDGHQ6objUMhl59Z2L8lBRh1nB+vEIy64+hthl7m3lVdOquq/76Wz4rBVO0PKBGzbbnva+oeLvW2U1qBMpDLDHX7Cy57n7x2sXwLGNF+1IsMAHAUm1CE8Poh/WnA59L5pbXbEZCYW6KAxvXyNVEofPDv6MTmp8JfPERYrH5B1OJ5e0Awz0EMZ7oiUtKfaFceH29U7XxXLfBhfATd+Zt7ovZeu/ElvAdCYHv4v4RwVTRNcooTpPvnMrjewr5T42DKyFsokLyPGvkK0zzPa+HdT6uTItzZru78+FtEXSvnchprELUKPJg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=citrix.com; dmarc=pass action=none header.from=citrix.com;
 dkim=pass header.d=citrix.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=citrix.onmicrosoft.com; s=selector2-citrix-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=qSQN8ZkzZ/7nBInBg2N/bvEXaj2QZYkYt3PsxnNHIG8=;
 b=X/vj04Nc/WhbRgZY2QXTyC/DTCg4YkfvwO4pd6mNafxbbqvbTJoSMq/Mr1MLTFihr/Cob6Vi2K60SLzCIKbrStZb6RrGkJhNDm3Xdys6hCyrMCgQwoAIKWhL/ohRJrDi+cdEY1lQ5vKp3/zieJupbfw6ELUtwHyhrBJ/4DP7bo4=
Subject: Re: [PATCH for-4.15 v2] SUPPORT.MD: Mark LiveUpdate of C XenStored
 daemon as Tech Preview
To: Julien Grall <julien@xen.org>, <xen-devel@lists.xenproject.org>
CC: Julien Grall <jgrall@amazon.com>, George Dunlap
	<george.dunlap@citrix.com>, Ian Jackson <iwj@xenproject.org>, Jan Beulich
	<jbeulich@suse.com>, Stefano Stabellini <sstabellini@kernel.org>, Wei Liu
	<wl@xen.org>, Juergen Gross <jgross@suse.com>
References: <20210317112745.15207-1-julien@xen.org>
From: Andrew Cooper <andrew.cooper3@citrix.com>
Message-ID: <cc98f580-9d92-79d4-49e7-342dc8d6a803@citrix.com>
Date: Wed, 17 Mar 2021 11:49:23 +0000
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.8.0
In-Reply-To: <20210317112745.15207-1-julien@xen.org>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 7bit
Content-Language: en-GB
X-ClientProxiedBy: LO2P265CA0305.GBRP265.PROD.OUTLOOK.COM
 (2603:10a6:600:a5::29) To BN7PR03MB3618.namprd03.prod.outlook.com
 (2603:10b6:406:c3::27)
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: d2016537-59b6-4890-6a30-08d8e93ab88b
X-MS-TrafficTypeDiagnostic: BN6PR03MB2673:
X-MS-Exchange-Transport-Forked: True
X-Microsoft-Antispam-PRVS: <BN6PR03MB2673F73CEF1E40F863C0C9F3BA6A9@BN6PR03MB2673.namprd03.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:4714;
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: tg78Cl4YiaRcrqpVtFbv8DRoD7eRSI+Gbdaefg7bFwGQ9gn4ohrONwo6IfpeUp7Pjtko114K+3jhyh4Yh7eh/AQ+Pm43Kcb3KV5CQ/pjQlxoUsW97ZuCHyXLEPac3ggVyj4EJbTWlHaB+xw80NU9tSnWrvKcgPbfAucRu8cEeNnPF3Umts5aYsp9ogn9/nuEN1L5dmKhRDsGxn06Qtiz5ljuVrct6ARiTJsjHtuUB2SGIja+HbfIxnHyk1t6tLzpASU7ZYpqyO3Yfpakb+cihv3F2C7pQpCvGFWMLLVcaHzagLxpNZ9zSvrh0nzcStxW8GgQf2IyqTfhLCYVtjal8DyZ7ker7NAM0fv6qJsFFJNz7hhq0VExfxhmliT90RHwVOuNmDeWsBYoGTJhjCcbeWjY4ngRUDLoXFETf7hDCQr8SPDg2AalilbG9mBiMQ+OV36hUs872BaZPzBnfEIMHiVMSShBlSirddMx9SumJ+bSdCeUVjd9muKuTkR/3s7E8ZVEzG7Oy+EhqWLXPqQfwNV0puQH531ikcZ9vQEWVq71YQkKrarSJS9iQOp1AwDztoSIdGmSGukU974VgAnO6TWbGGMS9OYEYZzXW1WZyoWJJac0TELOsx4Ir9ju1ropgD5TxJPuj02F3kQo+dWZVg==
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:BN7PR03MB3618.namprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(4636009)(396003)(366004)(136003)(376002)(39860400002)(346002)(26005)(83380400001)(956004)(5660300002)(4326008)(6486002)(478600001)(16576012)(53546011)(31696002)(31686004)(36756003)(8936002)(6666004)(66946007)(2616005)(66556008)(186003)(2906002)(66476007)(16526019)(316002)(86362001)(8676002)(4744005)(54906003)(43740500002)(45980500001);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData: =?utf-8?B?aXR1dTVBRnp0UDI2L3FLTUQ3OGpBS1hMS2o4c1IySXlJU0k3bnBLL2kxVllQ?=
 =?utf-8?B?Slh3YVd2VTNsNUkzWTA2M01sRE9FaWZwTDJjV3BYUFVNeHdwSkNDZnkvRjlp?=
 =?utf-8?B?d29QTXg0WjdyTnNCbzdvOEtlOVU0dEdEblU4dHNRdW9kT1cyYXduNEY1eEFp?=
 =?utf-8?B?cmpPUVpuOFViWmV4QUdyMzhCYkoxdWI4UnBjNmcwVE1LSzdNWHRldVc0emFr?=
 =?utf-8?B?Njh6cTVJTWx5QjR0bDJQQWI2bml0czkwbTJPeER0Rk5walo3T3VYVmt2cVh3?=
 =?utf-8?B?aW9OdkNZcjRoT29VeEwyR3RBUXRWdmsvK29uWWtSZExpWkhqZWpzb0JFK2tJ?=
 =?utf-8?B?cjhzWEJlUTNJS29vcDNlTndrMHRoV1F4djR1bll3bGM0bzVVTU5iam5MQ0NX?=
 =?utf-8?B?bmdjdnpHSWt0QjVYTUs3anhhQnBPWGlBZlVReDlGdFBNRXpNbFJVazZnNkUr?=
 =?utf-8?B?M2VJMmtEZXRhemQzQ29ZRmxyTDF2bUpOaGxYUXh3YnZOYm9YRWZHQzFhcWNM?=
 =?utf-8?B?MXgrVVdBV1JLdUJ1SjNuM0UxVWVOOWR0YXpadGdXWmFneUhxLzAzdEFhb0pJ?=
 =?utf-8?B?dWhkSXFEU3doL05QclFPYndQYmEvM2V1bXhYZ2loSmRlNk43NHVsQVptQzlI?=
 =?utf-8?B?NjNVY3k5bWJrSWZKaVoyY01nVVVtTUNURWFCZTkvTWVWRFdRbitvL3YrT1hM?=
 =?utf-8?B?VVJxREp3RkRERGVET3VNTHlHMzl0YzFFREZLNjI5eXNvZ3RGNVR4WS9KdDdp?=
 =?utf-8?B?bVhEajlaUml1bmxVc2dQVkthUGk0L1I1Q3crNmVmb3JwRHVZMlgwaGc5eTRQ?=
 =?utf-8?B?N1JKa1pjNkRYdk83cThtdURPNk15QlZKcVpKaDZLSXIvNUQ0ZmNmWlNuSllm?=
 =?utf-8?B?K0VUT09XeHU1SmJXR3dKaElpd2xRSmRBUFRUeUNCcyt4WEdMSHkzWGx3Mngx?=
 =?utf-8?B?cGVEclQrMERYZ0NMbkRCTk1kcXJwUjlsbVRPM0s5Q0pEWGJPZmhxTnNyYndE?=
 =?utf-8?B?blVYKy9lWDhyUGlJTGdxenE2UkZwUnlPVFVsQ0pycGQyM3hYOFhLdElXb3dz?=
 =?utf-8?B?b0ZQU1kxWFcxUk03N2ZXSmFvZ1FpK1BtSVBaYm8yZWhxWXZOWGdyR2FITkUw?=
 =?utf-8?B?RHZmc0JYSE5TdUNXOS9jc3hlamx4ZjBvZjVjVStBc3AvZ3VjMGE4a2QrSU5P?=
 =?utf-8?B?am1YUWlESkpNdVg4Z0h0cmdsZE9FcGE1WUhTUE80Ly8wWlhFWmdHSXFpRXZk?=
 =?utf-8?B?UkpvSThkcFZqR3I4MHFxOG1jMUVWc2dNNnRsM2xaczUwdi8yY0taWnoxY2tJ?=
 =?utf-8?B?ZmFsV1JlbStsb056Q0JNQkdtQ21pSnprR2JNZ0Q0VmNGUHdpT2gvVkpqbkJT?=
 =?utf-8?B?dVYvanlTQkZvS3RNa0hYZm5PNWpST0hmUFdCVjM2YlZNUnVDQzB5aUowb1Vh?=
 =?utf-8?B?VENRdGlRL2NXTmFRanVNbjlEWGFtOFB4UVJFdGY5V0laRStUUDc2Q05RZEVN?=
 =?utf-8?B?VklLamttWDU0dVdxQnptYXdjR1ZPcHlvOUZ1NXJ0THhhS0UwTXAvNkJNcWdX?=
 =?utf-8?B?RXBzbFR6TlJzZUtuRHZ1a0REWnpOY3VqSHp2aWUvR1BvZHlWQjdMY0xyVTlJ?=
 =?utf-8?B?K0xlMjZKcVRzMjNvbnhGRnNxbWMyMmNXaTZ2bnd5MWxkWWVoMGNQb2VlSmdz?=
 =?utf-8?B?clNNVG93L09UcGRuTEVKSTJCWi9aZ3QzSVdKRWh6V1c4MzVla09XU0dhWk91?=
 =?utf-8?Q?WgtEc35PjLtOhfPKoUoqoBA32KFllz/o1i+iSgr?=
X-MS-Exchange-CrossTenant-Network-Message-Id: d2016537-59b6-4890-6a30-08d8e93ab88b
X-MS-Exchange-CrossTenant-AuthSource: BN7PR03MB3618.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 17 Mar 2021 11:49:28.8393
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 335836de-42ef-43a2-b145-348c2ee9ca5b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: ozd9N/IzRHmqdgHDeTZYOM3E92aa2ywwzE0d9L34mUQUYo3jNfHdvUvphAtY8EgjSbAaMBWAy5H7ytsuBMizluH3mPLz+zU2Ln49jAPThmA=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BN6PR03MB2673
X-OriginatorOrg: citrix.com

On 17/03/2021 11:27, Julien Grall wrote:
> From: Julien Grall <jgrall@amazon.com>
>
> Support to liveupdate C XenStored daemon was added during the 4.15
> development cycle. Add a section in SUPPORT.MD to explain what is the
> support state.
>
> For now, it is a tech preview.
>
> Signed-off-by: Julien Grall <jgrall@amazon.com>

What about oxenstored ?

~Andrew


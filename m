Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 5A5254D6496
	for <lists+xen-devel@lfdr.de>; Fri, 11 Mar 2022 16:29:57 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.289161.490599 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1nShCm-000888-J4; Fri, 11 Mar 2022 15:29:24 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 289161.490599; Fri, 11 Mar 2022 15:29:24 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1nShCm-00085o-F1; Fri, 11 Mar 2022 15:29:24 +0000
Received: by outflank-mailman (input) for mailman id 289161;
 Fri, 11 Mar 2022 15:29:23 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=RXIo=TW=citrix.com=prvs=0626a3ed1=roger.pau@srs-se1.protection.inumbo.net>)
 id 1nShCk-00085i-Ui
 for xen-devel@lists.xenproject.org; Fri, 11 Mar 2022 15:29:22 +0000
Received: from esa6.hc3370-68.iphmx.com (esa6.hc3370-68.iphmx.com
 [216.71.155.175]) by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 0552e04b-a150-11ec-8eba-a37418f5ba1a;
 Fri, 11 Mar 2022 16:29:21 +0100 (CET)
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
X-Inumbo-ID: 0552e04b-a150-11ec-8eba-a37418f5ba1a
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=citrix.com; s=securemail; t=1647012561;
  h=date:from:to:cc:subject:message-id:references:
   in-reply-to:mime-version;
  bh=bK7jgMrHM0d3pPZ1cR8Yq1a8EfEJPtb+x1j9X46bgeY=;
  b=JlIxSXbI2dxweZ4nAFwGjVyeFl0AgYarMC/V1JzsF80SYr6YCriCNa0h
   Na6MAZNl9L4dMzYu9Hja5Rvl7YntdA8lJ1po07B+3ZO6RORHCoJcPTCL+
   4Sfl+5ZU4cbAbP7kbCkK4WzhZiI6ferWiW+dbRlxj2tSeicu+6VOaKhxw
   g=;
Authentication-Results: esa6.hc3370-68.iphmx.com; dkim=pass (signature verified) header.i=@citrix.onmicrosoft.com
X-SBRS: 5.1
X-MesageID: 65951722
X-Ironport-Server: esa6.hc3370-68.iphmx.com
X-Remote-IP: 162.221.156.83
X-Policy: $RELAYED
IronPort-Data: A9a23:qLhtTaN2iDp1JITvrR2Jl8FynXyQoLVcMsEvi/4bfWQNrUoigmEPn
 GFMX2CCOq6LZzOmfdB0PN/g8U4OvcKDy9ZqSgto+SlhQUwRpJueD7x1DKtR0wB+jCHnZBg6h
 ynLQoCYdKjYdleF+lH1dOKJQUBUjclkfJKlYAL/En03FFcMpBsJ00o5wbZi29cw27BVPivW0
 T/Mi5yHULOa82Yc3lI8s8pvfzs24ZweEBtB1rAPTagjUG32zhH5P7pGTU2FFFPqQ5E8IwKPb
 72rIIdVXI/u10xF5tuNyt4Xe6CRK1LYFVDmZnF+A8BOjvXez8CbP2lS2Pc0MC9qZzu1c99Zl
 4kOu4Crb1YVGu7Bx8YXDxBdTgI5BPgTkFPHCSDXXc27ykTHdz3nwul0DVFwNoodkgp1KTgQr
 7pCcmlLN03dwbLtqF64YrAEasALNs7kMZlZonh95TrYEewnUdbIRKCiCdpwgmph25kRR6y2i
 8wxdiFCNBTtXgxzN04wFIg+wvnytyD6fGgNwL6SjfVuuDWCpOBr65D9PdyQdtGUSMF9mkeDu
 nmA72n/GgsdNtGU1XyC6H3ErvDLtTP2XsQVDrLQ3vxgjUCXx2cTIAYLTlb9qv684ma1Q99FI
 E0K8wIgt6U//lenCN7nUHWFTGWs50BGHYAKSqtjtV/LmvG8Dxul6nYsEWICZsA9kp4KYX8ni
 X2Dw9rsWB8oiejAIZ6CzYu8oTS3MCkTCGYNYy4YUAcIi+XeTJEPYgHnFYg6TvPs5jHhMXSpm
 m3R8nBi71kGpZNTj82GEUb7byVAT3QjZio8/U3pU22s9WuVj6b1NtXzuTA3ARutRbt1r2VtX
 lBYyqByD8hUVPlhcRBhps1UTdlFAN7fbFXhbaZHRcVJythU0yfLkXpsyD9/Plx1Fc0PZCXkZ
 kTe0SsIusMNbSD1Mv8vO9vvYyjP8UQGPY20PhwzRoATCqWdiSfdpH0+DaJu9zyFfLcQfVEXZ
 s7ALJfE4YcyAqV71jumL9rxIpdwrh3SMVj7HMihpzz+iOL2TCfMFd8tbQvfBshkvfjsiFiEr
 L5i2z6ilkw3vBvWOXKMr+b+7DkicBAGOHwBg5cOJ7DZfVY+Rj1J5j246epJRrGJVp99z4/g1
 nq8RlVZ2Bz4g3jGIh+NcXdtdPXkWpMXkJ7xFXZE0YqAs5T7XbuS0Q==
IronPort-HdrOrdr: A9a23:N8FA26w7YDe0pIz4yvapKrPxwOskLtp133Aq2lEZdPULSKOlfp
 GV8MjziyWYtN9wYhAdcdDpAtjmfZr5z+8O3WBxB8bYYOCCggWVxe5ZnOnfKlHbakjDH6tmpN
 pdmstFeaPN5DpB/L/HCWCDer5Kqrn3k5xAx92ut0uFJTsaFJ2IhD0JbDpzfHcGIDWvUvECZe
 ahD4d81nOdUEVSSv7+KmgOXuDFqdGOvJX6YSQeDxpizAWVlzun5JPzDhDdh34lInhy6IZn1V
 KAvx3y562lvf3+4hjA11XL55ATvNf60NNMCOGFl8BQADTxjQSDYphnRtS5zXgIidDqzGxvvM
 jHoh8mMcg2w3TNflutqR+o4AXk2CZG0Q6X9XaoxV/Y5eDpTjMzDMRMwahDdAHC1kYmtNZglI
 pWwmOwrfNsfF/9tRW4w+KNewBhl0Kyr3Znu/UUlWZjXYwXb6IUhZAD/XlSDIwLEEvBmc0a+d
 FVfY/hDcttABKnhyizhBgu/DXsZAV4Iv6+eDlMhiTPuAIm30yQzCMjtbkidzk7hdAAoqJ/lp
 T525RT5cBzp/AtHNFA7cc6MLyK4z/2MGTx2Fz7GyWUKEhAAQOJl6LK
X-IronPort-AV: E=Sophos;i="5.90,174,1643691600"; 
   d="scan'208";a="65951722"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=i5uOO7ylvF85zRmAtE0wJI+uq+OOsOMMdZ/II7twbBguLeXVWD93v9rCrPXGG5pDND9J1+tmxLPUiLajpQtOOe324WwGmwDFWz2pXbaCiSfAu3yjo33bfIXcrPtwfBP31CD+kLP9hK45xbRqHFuQEhYH/6AjXFo7LLWGZ7d/6IwxdHwLzQZhDBWusYIs+b8Wv0Djpu7eoxpqSVDdGPpCX8F/rJrxyK3XMXhZfRJMag30ii+RiFfpeK+UG8pKkDHmgTly14Kl5rIaCSz4n/T+Kc/goBUD6ZvMM/G8nLCoKEQ7fEeEt0eJznRC6Vf+/4SqDt9R1InkmEqmuFQlmkxvPg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=VBo92vs/J2whbFMGg3aG7kvVyctYctEerkmEdGhcIH8=;
 b=RX2ht63DNJQk77E4pGyJ9/l/oX1/04C3H6b4VvljhDzSkEx/gaFoYKXmdzxFtUX6z7aElLrrR9HucdJr97bxE7A9n73+sAc1fjlzWp53pAKh8u1OEiyIXo49Tb3n8ttKa8R3ZERQlmSYs0setpQNenAOWSpfTQVbHdOy5QqJIdGpja3FYtL99wHAKGZMwCvHwgKZL6gjqJCZw0EiIfJwWFML1KL5Vm7yNZa+m45Epdi8K/PFOQwPJ+n4emAKRp2+WKfXJ4tkMCsPD/5BLM3D33/7g23mSXvlk1R0Lq6vhl2j2RhkoWFkvKy7ULMv/bIU6ggEAzMRE5uSsFswspAnag==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=citrix.com; dmarc=pass action=none header.from=citrix.com;
 dkim=pass header.d=citrix.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=citrix.onmicrosoft.com; s=selector2-citrix-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=VBo92vs/J2whbFMGg3aG7kvVyctYctEerkmEdGhcIH8=;
 b=jhh8g4I0Q5Va0TbalAQUpwf9cSPAoEH+QXWqaM9VetfM9FemVkFSeHiYU2v9HO4xJwNz4FpbJFUDHOqIrtvSa5OTT47U8xsRdtlORKfISatgTy048xKmsHRxIeIffOYPqtol+U4LhDr+jVme8m4sBCNObbR4NIwa0K5Ce9cCOE4=
Date: Fri, 11 Mar 2022 16:29:01 +0100
From: Roger Pau =?utf-8?B?TW9ubsOp?= <roger.pau@citrix.com>
To: Jan Beulich <jbeulich@suse.com>, Colin Percival <cperciva@FreeBSD.org>
CC: "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>, Andrew
 Cooper <andrew.cooper3@citrix.com>, Wei Liu <wl@xen.org>
Subject: Re: statistical time calibration
Message-ID: <YitqvQxsJ1/hqfrg@Air-de-Roger>
References: <1ea5815b-df22-7884-d28b-bdcc1741e349@suse.com>
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <1ea5815b-df22-7884-d28b-bdcc1741e349@suse.com>
X-ClientProxiedBy: LO2P265CA0032.GBRP265.PROD.OUTLOOK.COM
 (2603:10a6:600:61::20) To DS7PR03MB5608.namprd03.prod.outlook.com
 (2603:10b6:5:2c9::18)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 88d0f47a-e9e2-4ff1-f81b-08da0373e190
X-MS-TrafficTypeDiagnostic: CY4PR03MB3318:EE_
X-Microsoft-Antispam-PRVS: <CY4PR03MB3318E8C07E85342D17B9CC6C8F0C9@CY4PR03MB3318.namprd03.prod.outlook.com>
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: Bkk6z6EAJN+JQdiIC4Y478jEuEOzn8d+uc17X2YxaINa3EIq+M14lYpSU4jwSbQFknWLeEcax4Xz1uRNabPSAM838UEwqyN23Yasn72Lgcme8fdkOUXHZjL/Q3Y2Kjn9A8mKpWatxZzUHdF1IToUQCHqxdJImTOvBcx5Af175w0LF38xTyTtWqo6VpPmdSK1uYb2TAe4yD5HkXoKAOCO6ore0yL3zSoZLfnZlwVBU5wQp3UD32YzGeFf6fjIf5eFFXCwi/54Mfv+N+evgWlE+yUT0YNUK707Mc3AVucR/GVDE3QRluwW3GoNM87/n1bXBv8K+NcDaxyDb7okX8lyXtmm5blWesW2KquwbTIphiN/gOOnwd1Bkyor1MdjRfk+j7QfchmaYRYTQdmBHmK17ngG+pjDJG2ohozLWTCa4X2FbUrkepgYxLuFqSx9m59Sz3UfGAQRJoJWDnjU3ORDs5mlYijZMBcr5pYNkprqm0o8e8adQhwvCuEQ1zWqnWzJhRB3LTpFNgiyLmBVnkNzWsr6Pt+aS2iHo9cVkRAjbv6IXwGAqaFr6zECSIWaPAbGsTNbaRXXCxUg5YhuTDmTBkIxv6X60NS3Vf513BzpJrck9YdqLoiL8LFqaAtYEJHRSYbyg0kVQjRfAfwUwaKiWTYTJogyxz8bexGYu2hXL0d1t+V4g/2WHlN/jLobFNkYnpOPAo6XV7xh9uHPhNx5sBS57tgBOX/UjvjzdGavNTA=
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DS7PR03MB5608.namprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230001)(7916004)(4636009)(366004)(66476007)(85182001)(9686003)(6512007)(38100700002)(33716001)(66946007)(6506007)(186003)(26005)(3480700007)(83380400001)(6666004)(86362001)(7116003)(6486002)(5660300002)(8676002)(966005)(54906003)(8936002)(2906002)(82960400001)(110136005)(316002)(508600001)(66556008)(4326008);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?bUMvT2ZiUldUbE5maERid283Q2ErcGNKSkdlaFBqdW5BZnZ0d2dySzJKelN1?=
 =?utf-8?B?NnhBbCtCYVE1U21DSGJjbWVWQ3ZDMXgzZ3NzcHRlOW8wdGdyQzFrRXNHYzRr?=
 =?utf-8?B?MUVESmVXK1UrTldFazc1aVVOa0ltakRXWWxhQXc3eTMzblA0ZUx0bXZNYmoz?=
 =?utf-8?B?R1JxalNwR05VVWpVUDhManA2T2pXYnVJeWVEcFgxTTBEbVo4alVuSng2amhG?=
 =?utf-8?B?S09Nd0xzdFZCM0t5NkFZZzlsQ3EwSVREaWUrVmlFVjRvUkFoZE1nMWVGWWNV?=
 =?utf-8?B?UG15R3F1UHg1ZGdnM3I1cExVY3RqSG1IL3ZqS2hIblNaTHRoTUZzQ2VMUS9i?=
 =?utf-8?B?R3JSTWt3M09iVFNWbzZXeG1BVk1rQ2t2SkVLcnRIQnhWbjV5ekFQbjl1bzIx?=
 =?utf-8?B?S3M2WUQrWlBJUG9KSVRMei9MYkl3R2l2S2VVazlmVUgrTVBlV0Y1Y08zVDM4?=
 =?utf-8?B?TE9KSzltR3ovZ29SS1NIb3pXTjEzVDN4bVVqZXExSk8zYkhZYzZrWTBzQ3Fz?=
 =?utf-8?B?bXdsK0pkeFFMbTBuU1lGNFQ3dHdOdzlCRUNzSDdWRmtZK1hJNHl2eVRBc0E3?=
 =?utf-8?B?T2NkQWtJaEZwTElwSmlZQ0tTUjVsL1FpTmUvNWR0R2FhN0hYQ3FhcjF6K3Zv?=
 =?utf-8?B?bUhtUjYxKzUwVC9sRlY2QTM4UGYyMWpRT1VNakM0S1d4SWJGTy9zL2U4T3Y2?=
 =?utf-8?B?Q1ovTTBjd2xZRER5YXdzOFhYUFhGVVB5QmpiME5YMjhjQ05wNzBGRytLUDFP?=
 =?utf-8?B?d2Q1Y2FWMzVuZTBiZ29JYkF0V1JlTDc0THJOa2Y4cS9CWTVxejEwOVZYWndv?=
 =?utf-8?B?UjRBTWo0bTcvNmhwbW9zUXU1Z0R4SUtsWjNvZy95bFg2cncvMmlkTnRVQmRl?=
 =?utf-8?B?d0xyTHRneCtHN1BlS0U3UTlvQ2hERzkzcFp6MWNRRUcwYmhsU05Jb1NSWWNj?=
 =?utf-8?B?UjJxMXhnRzduNTY0Yi9pS09EZ0gzZ2lXSWllRytNZVBZYnVRaXhrNWM1d2dv?=
 =?utf-8?B?aG8wY2hzL3ZzdmRYb2VjdlFQRFFPZkhIa0lxRHRmSXNScW4zNnUxaHVJaWRK?=
 =?utf-8?B?eHU1TVJHNVNSNFVSeStPZnlIZGZEQTFWdEJ5L3FZWVBVcEJxUWNmOURNVmMx?=
 =?utf-8?B?OWZ6U3podmJBWmhaYzUwNk5QNFJzTDlPb0dvTlN2bU9OOTlHOVlFTkc1ZDkx?=
 =?utf-8?B?bGJ0SEJzc3Z2M0lyWDdIcHRPWTNGL29YS0xINysyQWFtUmhmTCtqVEtzcjJs?=
 =?utf-8?B?MXlpcFdIek4zUGdJb1dTTm16a0hQQ20yWS92bUFyRnFmNUFMNmNuM0VEUlQ1?=
 =?utf-8?B?ZXB3akNKUU1XS3MxVkwvNEl3U3dMTUJVb2Q0TVFmRVppWURoLzRHbTRISWNa?=
 =?utf-8?B?ZGFIWHgxd1MwUFBhRFl0U3lqOHZsejdTblRic1YwcE9FdGJNQXFGdGxaWlUz?=
 =?utf-8?B?MlZjK0RQbjhOUEZ3d1phWWpIYzEwazZXSC80UUZpaGNmTjhscVJlSmYxN2J3?=
 =?utf-8?B?TXJnTWF4SlRFSStyaVhtOExSYnhMbVpLM0dUbDBSZ1hac1ZTRlJrZGsvNGxJ?=
 =?utf-8?B?bm1kdmo0cDlzdVN0WWlkcE1SOXFUaU1qckVYTDc0c1dvR1pzRElVYnZCOGN1?=
 =?utf-8?B?b0lrRld1T3dRRVptQ0VlVEVIRCtkYkE5L21hRnRTOUY1akU5YVVjRzZ4dndP?=
 =?utf-8?B?cE12OG9nVVdHenJ2T0pmdWN2cFcvYlhnQXQ0UitwTG5vS011ODc4dklDcDdS?=
 =?utf-8?B?UXpQVnFkRmQrOWhTTGlUYzlUWGMzYTRNbWpKYlFnK1RDS0JFNksvcExObng4?=
 =?utf-8?B?MmF1M0RNRURNNlZLM0xVdjJYeUhKQWViWWRnNm5TUVlaOWQ2V01FWExSSkhN?=
 =?utf-8?B?UHhjWENNcElyeURmcEhBQWc3SzFSYzJuQlZkK20xTlBEUlhIcWd3Nkp2TVh4?=
 =?utf-8?B?cVhwbVZVUHN0cnNxMk5UMHViNTV3bWxxU0JlR0VSRTdEVFVhc2t2ZVZjWWpl?=
 =?utf-8?B?dkVDcndScVFGa3dkdVpQU2o5YnpQSmJlNThidE9wRkpMS1NoOEFPMDljQ1NS?=
 =?utf-8?B?cjZvRGRlY1hPOXlxTkZ1SVpTcmpCVTlFRHNacDBOY3JOOXd5Nnlza1FidHdp?=
 =?utf-8?B?RU9uVzkwOUk3cnFpSFpWTDBDOHZuczFTelVOOTA1WVR0ZURqTFNyS1lmK3ho?=
 =?utf-8?Q?IFbHYWQKg/wwJuhXZb434Kg=3D?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 88d0f47a-e9e2-4ff1-f81b-08da0373e190
X-MS-Exchange-CrossTenant-AuthSource: DS7PR03MB5608.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 11 Mar 2022 15:29:06.8720
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 335836de-42ef-43a2-b145-348c2ee9ca5b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: r4DJM2yPLjpMNC5pt3zmgyW3nRMSeDiyMaZd9H6UE2+boeoe4sDOwjYoVZMogG0GeemW+eY2E8qLMRTPKYzAfA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CY4PR03MB3318
X-OriginatorOrg: citrix.com

On Tue, Jan 18, 2022 at 04:03:56PM +0100, Jan Beulich wrote:
> Hello,
> 
> Roger pointer me to a FreeBSD commit [1] introducing such there. While
> we don't start at 2000ms (but rather at 50), this still looked interesting
> enough to take a closer look. I think I've mostly understood the idea and
> implementation now, with the exception of three things:

I have to admit I didn't really look at the commit in detail, just saw
it go by at the same time you where working on improving our time
calibration, and assumed it could be interesting.

> 1) When deciding whether to increment "passes", both variance values have
> an arbitrary value of 4 added to them. There's a sentence about this in
> the earlier (big) comment, but it lacks any justification as to the chosen
> value. What's worse, variance is not a plain number, but a quantity in the
> same units as the base values. Since typically both clocks will run at
> very difference frequencies, using the same (constant) value here has much
> more of an effect on the lower frequency clock's value than on the higher
> frequency one's.
> 
> 2) The second of the "important formulas" is nothing I could recall or was
> able to look up. All I could find are somewhat similar, but still
> sufficiently different ones. Perhaps my "introductory statistics" have
> meanwhile been too long ago ... (In this context I'd like to also mention
> that it took me quite a while to prove to myself that the degenerate case
> of, in particular, the first iteration wouldn't lead to an early exit
> from the function.)
> 
> 3) At the bottom of the loop there is some delaying logic, leading to
> later data points coming in closer succession than earlier ones. I'm
> afraid I don't understand the "theoretical risk of aliasing", and hence
> I'm seeing more risks than benefits from this construct.

Might be easier to just add Colin, he did the original commit and can
likely answer those questions much better than me. He has also done a
bunch of work for FreeBSD/Xen.

> Beyond that there are implementation aspects that I'm not happy with,
> like aforementioned delay loop not dealing with a TSC which did start
> from a large "negative" value, and which hence would eventually wrap. Nor
> is the SMI (or other long latency events) aspect being taken care of. But
> any such concern could of course be dealt with as we port over this
> logic, if we decided we want to go that route.
> 
> My main concern is with the goal of reaching accuracy of 1PPM, and the
> loop ending only after a full second (if I got that right) if that
> accuracy cannot be reached. Afaict there's no guarantee that 1PPM is
> reachable. My recent observations suggest that with HPET that's
> feasible (but only barely), but with PMTMR it might be more like 3 or
> more.
> 
> The other slight concern I have, as previously voiced on IRC, is the use
> of floating point here.
> 
> Jan
> 
> [1] https://cgit.freebsd.org/src/commit/?id=c2705ceaeb09d8579661097fd358ffb5defb5624
> 


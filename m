Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 44AC94ED9B7
	for <lists+xen-devel@lfdr.de>; Thu, 31 Mar 2022 14:37:13 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.296936.505635 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1nZu2w-0006AM-PP; Thu, 31 Mar 2022 12:37:02 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 296936.505635; Thu, 31 Mar 2022 12:37:02 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1nZu2w-00067j-MH; Thu, 31 Mar 2022 12:37:02 +0000
Received: by outflank-mailman (input) for mailman id 296936;
 Thu, 31 Mar 2022 12:37:01 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=lDhN=UK=citrix.com=prvs=08274bcc4=roger.pau@srs-se1.protection.inumbo.net>)
 id 1nZu2u-0005xJ-Rj
 for xen-devel@lists.xenproject.org; Thu, 31 Mar 2022 12:37:01 +0000
Received: from esa6.hc3370-68.iphmx.com (esa6.hc3370-68.iphmx.com
 [216.71.155.175]) by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 40e43981-b0ef-11ec-8fbc-03012f2f19d4;
 Thu, 31 Mar 2022 14:36:59 +0200 (CEST)
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
X-Inumbo-ID: 40e43981-b0ef-11ec-8fbc-03012f2f19d4
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=citrix.com; s=securemail; t=1648730219;
  h=date:from:to:cc:subject:message-id:references:
   in-reply-to:mime-version;
  bh=NQUlK1k5EbMcsLiX5ijQEQwuStcTYf2gUDtmKdx0Dm0=;
  b=FHjmv1CSFm0jaARfPvBHdFKbP6VxQ+r9U1TE4uwtEUoyQWzpkAWMBi+H
   dVVbx1z0YXtlrrRW2Ue6hN63mQgAXmIMuvCyWZ4sGk7hhCqRkdWeWW5lx
   jF2UdC7Ty+aQsOim8TEG5zcX7xHdZSohdBEpcR7Sc/JH1nbA44DJHdBLi
   8=;
Authentication-Results: esa6.hc3370-68.iphmx.com; dkim=pass (signature verified) header.i=@citrix.onmicrosoft.com
X-SBRS: 5.1
X-MesageID: 67553416
X-Ironport-Server: esa6.hc3370-68.iphmx.com
X-Remote-IP: 162.221.156.83
X-Policy: $RELAYED
IronPort-Data: A9a23:Wf9y8KohYQz29jQLmgfU4rdfQbBeBmLJZRIvgKrLsJaIsI4StFCzt
 garIBnXPvmNMWX0e4h+O4XjoUIA6JLRndQ1GQU/ryhgEH8W85uZCYyVIHmrMnLJJKUvbq7GA
 +byyDXkBJppJpMJjk71atANlVEliefQAOCU5NfsYkidfyc9IMsaoU8lyrZRbrJA24DjWVvW4
 oqq+aUzBXf+s9JKGjNMg068gEsHUMTa4Fv0aXRnOJinFHeH/5UkJMp3yZOZdhMUcaENdgKOf
 M7RzanRw4/s10xF5uVJMFrMWhZirrb6ZWBig5fNMkSoqkAqSicais7XOBeAAKv+Zvrgc91Zk
 b1wWZKMpQgBeYvI38RabQJkCCBibf1hyOadE3+/vpnGp6HGWyOEL/RGCUg3OcsT+/ptAHEI/
 vsdQNwPRknd3aTsmuv9E7QywJR4RCXoFNp3VnVI1zbWAOxgWZnea67L+cVZzHE7gcUm8fP2O
 ZVENGEzNUqojxtnFFcIJowzvLaRj3CgKyRngg2rq5cr2j2GpOB2+Oe0a4eEEjCQfu1Xl0CUv
 HPb/Ez2BxgbMJqUzj/t2n6jiuLAhyrTRJMZFLr+8OVjxlKU2AQ7ExYRSUf9rfCni1WWQM5WM
 Ugd8GwvqsAa+FSwS9jhXzWxuHOeogMHQN1UDvE77weWjKHT5m6xFmUCCzJMdtEinMs3XiAxk
 E+EmcvzAj5iu6HTTmiSnop4thvrZ3JTdzVbI3ZZE01VuLEPvb3fkDqIaNIkMOmLleHuGC2gk
 xe69XIMgLUc2JtjO7qAwXjLhDelp57sRwEz5xnKUm/N0j6VdLJJdKTztwGFsK8owJKxCwDY4
 SNaw5T2APUmV8nlqcCbfAka8FhFDd6hOSaUv1NgFoJJG9+Fqy/6JtA4DN2TyS5U3ic4ld3BP
 Re7VeB5vsY70J6WgUlfOdjZ5yMCl/SIKDgdfqqIBueim7AoHON9wAlgZFSLw0fmm1U2nKc0N
 P+zKJjwXShEVPs5lmfpGo/xNIPHIAhknws/orihknyaPUe2PibJGd/pznPQBgzG0E90iFqMq
 IsOXyd74x5eTPf/ckHqHX07djg3wYwALcmu8aR/L7fbSiI/QT1JI6KBkNsJJt0+94wIx7igw
 51IchIBoLYJrSacclvih7EKQO6HYKuTWlpgY3R2ZAz4iiV7CWtthY9GH6YKkXAc3LUL5dZ/T
 uUfetXGBfJKSz/d/C8aY4W7p4tnHClHTyrXV8Z5SFDTp6JdejE=
IronPort-HdrOrdr: A9a23:7odmTaEV9PJjriczpLqFBpHXdLJyesId70hD6qkvc3Jom52j+P
 xGws526faVslYssHFJo6HnBEClewKgyXcV2/hqAV7GZmjbUQSTXeRfBOfZslnd8mjFh5JgPM
 RbAtlD4b/LfCBHZK/BiWHSebtQo6jkzEnrv5ak854Ed3AVV0gK1XYBNu/0KDwQeOEQbqBJa6
 Z0q/A37waISDAyVICWF3MFV+/Mq5nik4/nWwcPA1oC5BOVhT2lxbbmG1zAty1uGQ9n8PMHyy
 zoggb57qKsv7WSzQLd7Xba69BzlMH6wtVOKcSQgow+KynqiCyveIN9Mofy9wwdkaWK0hIHgd
 PMqxAvM4Ba7G7QRHi8pV/X1wzpwF8Vmgjf4G7dpUGmjd3yRTo8BcYEr5leaAHl500pu8w5+L
 5X3kqC3qAnQi/orWDY3ZzlRhtqnk27rT4JiugIlUFSVoMYdft4sZEfxkVIC50NdRiKpLzPKN
 MeTf002cwmMW9zNxvizypSKZ2XLzkO9y69MwY/Upf/6UkVoJh7p3FosPD30E1wsa7VcKM0lN
 gsAp4Y5I2mcfVmH56VJN1xN/dfWVa9CC4lDgqpUCHa/ec8Sjbwl6I=
X-IronPort-AV: E=Sophos;i="5.90,225,1643691600"; 
   d="scan'208";a="67553416"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=MW1bP/eBRnIX0yVT+M875lWK+MlUruiy9w0sflvJXVrFWQ+BtP/fKebv5EjmLaO8nMwlYIXaGlfNLRfAeljPFAA1B8VuAFZgjTNASj+7A3qMzqWB7VDOHdx3duLJH/4w/hNe8EAKU8hLFqSt0FW2hGZRGHljIQlAUSp+h0oFnnTW3PXNShQgvSbuMVOb1JSzM5HIBGvgdhvAJ7buZInde793howqyaLcb1NdGi8W37LfsZMoY3rymMqsPZ647hmRrfj5T9J1z5/nNzmYzS8jdw7yH9Aa/RAsPMxcechDlGC14YSwfPiR9AdwI1gucQYDM/MT55VR0O4NPZlhBX3oBQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=qUD+Aef2G2wBse57yFY1CeNDuTTiUsMk8fpA8sTCLuQ=;
 b=No7xCWSAB3wX3023MMlbOl16VHEjcbY/kZN2OY209gdD6W9hleqlR/PE1XQLOQ7S+8jUIjqGp7+WZln6Wwraq2w3LbDAGbvAoe7rf75pVwYf43yZhelNYF6uy7bkROl+NTF4SaQyuwKT6oGkqcahNYcPuS7ZotvsPhmfqtCPxpto6PjiLVC9RgbXXVQ9Dxv2O1/3VS8TvL6Jbmzr01O7/l+WQmcHGA8LxOM9zKQJNy73yZfgbsqz3bKT+X6q1GYf8gvacvPfI2PROC/zdg/NgbZZgU9ytiA4htGXsKOuz7vc+RO3Y6c/2bfZ6k9yHMCodpO2bPAaiqI2unSLOcXPhg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=citrix.com; dmarc=pass action=none header.from=citrix.com;
 dkim=pass header.d=citrix.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=citrix.onmicrosoft.com; s=selector2-citrix-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=qUD+Aef2G2wBse57yFY1CeNDuTTiUsMk8fpA8sTCLuQ=;
 b=LbynnO9fiwyKg2obMSefO0I4IBhf45BfqSG6CA8DJBmIunjkoUql9UK4+tEwA2AamdKQyt12S8lPCKGYJpZWAlnW8I/uBo/l5aHo0Z9iLJsPqvG1liE7BHg8hHtfwdTKQSKplb8Fg1hrEwlJlnAc0iUa2w5hbkMUszgzv93yC54=
Date: Thu, 31 Mar 2022 14:36:46 +0200
From: Roger Pau =?utf-8?B?TW9ubsOp?= <roger.pau@citrix.com>
To: "Daniel P. Smith" <dpsmith@apertussolutions.com>
CC: <xen-devel@lists.xenproject.org>, <scott.davis@starlab.io>,
	<jandryuk@gmail.com>, Daniel De Graaf <dgdegra@tycho.nsa.gov>
Subject: Re: [PATCH 1/2] xsm: add ability to elevate a domain to privileged
Message-ID: <YkWgXhFVq/fD72CB@Air-de-Roger>
References: <20220330230549.26074-1-dpsmith@apertussolutions.com>
 <20220330230549.26074-2-dpsmith@apertussolutions.com>
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20220330230549.26074-2-dpsmith@apertussolutions.com>
X-ClientProxiedBy: LNXP265CA0051.GBRP265.PROD.OUTLOOK.COM
 (2603:10a6:600:5d::15) To DS7PR03MB5608.namprd03.prod.outlook.com
 (2603:10b6:5:2c9::18)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 96d43e49-fcdb-4868-78b2-08da13132267
X-MS-TrafficTypeDiagnostic: CO1PR03MB5859:EE_
X-Microsoft-Antispam-PRVS: <CO1PR03MB58592111DEE3928E8985C8828FE19@CO1PR03MB5859.namprd03.prod.outlook.com>
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: ++zj76/6ep1GG0OkqH5AuJBr71e4Yg8zWnXHBUvUYH8A7M0L8/u2VuUFcK8TwYOOAXDlKuWn20LgjNrkWWhmTEEgob4n7xgMqhlDXsdWsTCErxVdylkGS6OVrWh5e3FdR9pK1aOhYUfJjLtsKLlWxJaIBIG3tdPnujqbYGxgflI6FC4dtO7rPO3zSyzUKvwrzWvcWCOHgSrFMFVbYlvUnillubRAzLw2Zz0L7fLaVS5WsT8BckyTaogMcF9h2m0t3sfpRN4N6KUP6YWTi/m82IekotFCbfw9Bm4PFQ3JZrFfR+YlO7xDtP43sx09aOyogT+uxoMqaDEKbKU+TmN+iKx+K3cfAZ4PsQm+WecPkAsjxeff75oT0vMPql/LqTQg4hFJto+qjB2nlSsk3z5Wyqj/lW1FyOwYP92Aes5frBYqQIg5kY+KDeb2R6CqO1U2WiPLAyKfiKgeO5Z461kBebYJhsgglhrgOjq88fZhqOomd3HBrk/BGYe3zoSfEvGiFJC2kiG45+zYkoNaXXOG6grglCgpU8wvkMNpyfVHEYXWhDswb1DiQyrWLG6ydQwfd+hly5/ucAD7HxAlmaDx/sS60gjEaIfWc2JgOhv3RwGRwgteMKtCdcWiJuyzFsaLx3YVVFv/5USmfpm/DTsFRA==
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DS7PR03MB5608.namprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230001)(7916004)(4636009)(366004)(26005)(8936002)(86362001)(66556008)(66476007)(66946007)(6666004)(6512007)(6506007)(6916009)(33716001)(316002)(9686003)(186003)(8676002)(2906002)(83380400001)(85182001)(5660300002)(508600001)(38100700002)(4326008)(82960400001)(6486002);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?TzRGTFN0VEhWa0N6K21ZU3Y3WGh2NFRWcVRmMXorVnIxZ3FXSWk4QWZneHJ4?=
 =?utf-8?B?VEFTQTdSN0g0Zmh5ckZzT1EzRy91VkZaUVlZcU93bjRpVjZ5MTFWYnM5QzB6?=
 =?utf-8?B?V1B0Y1dRSXY3Q0o1UjJBM1ZBVnhVajd5R2FFeVFMOXNnWmltekwxdDVDUU1Q?=
 =?utf-8?B?dC9xWHZrajZ2TWxFRFphTDBwSzZOVHc0WDJDS1hyazBFN0ZsNHI5VnJaTGVJ?=
 =?utf-8?B?MHdnVGl6QnlaY0JobzFhcHgzWGlTWU5STm5meVVHL09IVnNnMmRoRHN5aU83?=
 =?utf-8?B?dFNQTGN3VXJ4Zk1VOUVGUjM5V2dyelA4RHFWRTNKdHdVb0puM3FZck96TzRy?=
 =?utf-8?B?YVVjOWxhWU54cWFWclVDREJsMzdaeWNkRmZWR3I3L2NQOFp0NEZOMmlFTXMr?=
 =?utf-8?B?Z2svOEhreFIvYnpRUktKdi83TFJaV0xsakVmeGxtUmxBSloyTHQwOEJIejJJ?=
 =?utf-8?B?TTRaN2dNdTkyRU1VQ1lSWUU3c1ZPc0lNK1U0ZWV1Qy90cFZnUlhVL2VpQWJt?=
 =?utf-8?B?MVhhYVA2bVlBN3NFd2VoZHdWR1ZUM2s5RzFicFI4VGlpRVhqZGRYNjlXV0Rh?=
 =?utf-8?B?VG51OVk5aEdxaWZUVUJiWHFCK29idml2a0NuczlUcDFrL2NrTy90M01OSE9s?=
 =?utf-8?B?UGs5OUhMNkd4NkJGOVJVWG9kRWZHOG0reUVmVmlsNFBDdUZZdDZ6cFlNVW9R?=
 =?utf-8?B?YlJrMk9veXhNYWVVSndmU0haVFlPZFluYktMSElhdXE2SXFGK0p0U2t3OGdD?=
 =?utf-8?B?OFlsUXh1TUxQNUZGdURpVXc5Wll4MXYwbmx6N3lMT1JFSU1MazM0Wm9tazRQ?=
 =?utf-8?B?dWRJbURDM0xFTVRZcDIrWENBUmpyWFZBbjdZYi85d3dpUHVRNTU3amNMc0VE?=
 =?utf-8?B?MllhSXdicDdYOGJaTzhlcWVDSllFOWRUd2pIeWl5bW5LZDY1Ni9kb3E1dzdW?=
 =?utf-8?B?M3JITlczNWNWWDBETmVmNkVoOG5KTjJueStwQTMrMEI4WlYreWZkSXhsejNi?=
 =?utf-8?B?MXFtem5mRFR0c3B0UU9NZVVHQ3J4WTlFVk82NHJlOUNIUmRjU0cwSStlMUNL?=
 =?utf-8?B?S3VmUURuQTdHajNsUmc2VHZNNUY4RTdoam4wWjB5T1ZaK2NsZFBpcWdBbUNn?=
 =?utf-8?B?TDZUR3AwZjRXbFNCSUxkQkV0WENYaGVlcWFWek1TWU5HZVhReU5hc3V5SE96?=
 =?utf-8?B?Ymp5VHUrdWFjS1BpOU5Vc0F4dkg5MXpBR1pYVWF4WnRMN2xXTzJiUFlReEJX?=
 =?utf-8?B?RS8rUEU2eVdheGp5MnRsKzdiYkpGbVg1QjluQ214dXp0emw3VFd5SEJwejJP?=
 =?utf-8?B?WmZDaGw1Tk03WTZzb1V0djhBTEFkR3daVWJFL2dwUkVVbkYrSUNFcVFObXUz?=
 =?utf-8?B?ckFDR0s5eG44YkNnMWZwcURJRThYamg2cFZ5MUJqZTBsWSs0eFdBSjZKU3NG?=
 =?utf-8?B?dExhcnZNSlk4eWNOWHhIQko0bHJsMEYxVTY5RUZJZnFNWnVtbVN2OWs3VVRV?=
 =?utf-8?B?bHg5NiswRFdWMnpYL3l6Mk9NTTYzQWFYS3FsSWFJS0R5dTBUQmdWdVNORWwr?=
 =?utf-8?B?aGhmcUpUOVpHU1R6bGJsYU5qQUJ5NEF4QzNONG1mSENRMCtRamdTQ2JWR1Bh?=
 =?utf-8?B?dzJtb2M0VkFtcUd2d0RJbCtUN3FvQ1lNOTdmSnNVTi92LzY0T1Y1VGJQemZD?=
 =?utf-8?B?bzIvMlFCdUdoZWJoTnZFbk5IQkxObU90N2ZCQnIrdXR5bzZ4a1JtY3d6bmxk?=
 =?utf-8?B?YkhqM2l2anJ5SU9taWdEUjNIbnJ4MkRub2RGWmVabkFFVXVreDBELzRycDNt?=
 =?utf-8?B?ZnBwWHRmUCtrbGFYRysrSHAwYU5XRXdYS0g4RXArWFZoL0RmU3ZHdG93R0ha?=
 =?utf-8?B?T1l2N0owWnI5QzNHK2pEd3Bhcm4wSkJBODlhL0k3NnpSR2Q4Zldva0NRTStB?=
 =?utf-8?B?VUpuRWJSU1JNNHZOOFNPdXE3RFFoUWFiR3JxUnNGTTdXY054Wm9QSmc0S1h2?=
 =?utf-8?B?bEM2VG5aUWRucVRKQmFzVFQ4RXZ5OVZhNEFVT0VlYzAzdXRzWUp3bEFxakI3?=
 =?utf-8?B?TjdDZ1VvaUdrZzVoa0pQWE1aYjJodGRGSDNxRUdyMTJ2MEJMZm5ZL3JJM0xN?=
 =?utf-8?B?bWpUWStOR2Fib1BmN2ZGSzNmUCtTVy9MTTRPOVdkSDNjbDVsRnMya0JHN2ZE?=
 =?utf-8?B?aStUSlJJV29ZdkVtbGhTYVRrVXoyOFFlYkdMQ1owSFRMZFVnY25KMFF2bDE4?=
 =?utf-8?B?Z2RObEtHU094S1c5WUdSd2Rva1Vjczk3SStjTW5LUGY1cEhsYjVIM085Mll2?=
 =?utf-8?B?V04yc2xFSnVnYUp0QnpmVklBeWcrMHRNbkpCa3A5L2t4ZE9DT2RIZkJ3VjVJ?=
 =?utf-8?Q?KJ3fmwoFLATAQCmM=3D?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 96d43e49-fcdb-4868-78b2-08da13132267
X-MS-Exchange-CrossTenant-AuthSource: DS7PR03MB5608.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 31 Mar 2022 12:36:53.1202
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 335836de-42ef-43a2-b145-348c2ee9ca5b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: cIfqU5wzuo4R84Ecw40eOchmnRKzfGxIonlbe7E7vQWu9lSUwXir2yCbJ/gogqdRTaXgqapmUWSN5BM9lPMzhw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CO1PR03MB5859
X-OriginatorOrg: citrix.com

On Wed, Mar 30, 2022 at 07:05:48PM -0400, Daniel P. Smith wrote:
> There are now instances where internal hypervisor logic needs to make resource
> allocation calls that are protected by XSM checks. The internal hypervisor logic
> is represented a number of system domains which by designed are represented by
> non-privileged struct domain instances. To enable these logic blocks to
> function correctly but in a controlled manner, this commit introduces a pair
> of privilege escalation and demotion functions that will make a system domain
> privileged and then remove that privilege.
> 
> Signed-off-by: Daniel P. Smith <dpsmith@apertussolutions.com>
> ---
>  xen/include/xsm/xsm.h | 22 ++++++++++++++++++++++

I'm not sure this needs to be in xsm code, AFAICT it could live in a
more generic file.

>  1 file changed, 22 insertions(+)
> 
> diff --git a/xen/include/xsm/xsm.h b/xen/include/xsm/xsm.h
> index e22d6160b5..157e57151e 100644
> --- a/xen/include/xsm/xsm.h
> +++ b/xen/include/xsm/xsm.h
> @@ -189,6 +189,28 @@ struct xsm_operations {
>  #endif
>  };
>  
> +static always_inline int xsm_elevate_priv(struct domain *d)

I don't think it needs to be always_inline, using just inline would be
fine IMO.

Also this needs to be __init.

> +{
> +    if ( is_system_domain(d) )
> +    {
> +        d->is_privileged = true;
> +        return 0;
> +    }
> +

I would add an ASSERT_UNREACHABLE(); here, I don't think we have any
use case for trying to elevate the privileges of a non-system domain.

Thanks, Roger.


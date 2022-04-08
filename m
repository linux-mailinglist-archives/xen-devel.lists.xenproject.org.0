Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 1D5B34F938D
	for <lists+xen-devel@lfdr.de>; Fri,  8 Apr 2022 13:11:11 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.301405.514378 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1ncmVy-0002Z8-Pj; Fri, 08 Apr 2022 11:10:54 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 301405.514378; Fri, 08 Apr 2022 11:10:54 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1ncmVy-0002WS-Mh; Fri, 08 Apr 2022 11:10:54 +0000
Received: by outflank-mailman (input) for mailman id 301405;
 Fri, 08 Apr 2022 11:10:53 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=d3bc=US=citrix.com=prvs=090ff2996=roger.pau@srs-se1.protection.inumbo.net>)
 id 1ncmVx-0002WM-E7
 for xen-devel@lists.xenproject.org; Fri, 08 Apr 2022 11:10:53 +0000
Received: from esa6.hc3370-68.iphmx.com (esa6.hc3370-68.iphmx.com
 [216.71.155.175]) by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 8c8c2d89-b72c-11ec-8fbc-03012f2f19d4;
 Fri, 08 Apr 2022 13:10:52 +0200 (CEST)
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
X-Inumbo-ID: 8c8c2d89-b72c-11ec-8fbc-03012f2f19d4
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=citrix.com; s=securemail; t=1649416251;
  h=date:from:to:cc:subject:message-id:references:
   content-transfer-encoding:in-reply-to:mime-version;
  bh=8bXHeHhTsI/wl6MOO/7onxex2EW9xcyKUhsMiCcmNoU=;
  b=hth4d0qeUBU8ZA/T5VmmPlhkfN+WxvOcsZCf3mkyuwGpR3UZsW9HIk38
   nORpNeMYkwzZVcnJMtjKWf0E18QUj9VrJniKkbPYhs+vmSqJarWEZSzRk
   eIq4DTFQNMiy8dJqcrR72BaDu8vhZafaWBlA++OsDjHx82qM1tKeSh4ol
   s=;
Authentication-Results: esa6.hc3370-68.iphmx.com; dkim=pass (signature verified) header.i=@citrix.onmicrosoft.com
X-SBRS: 5.1
X-MesageID: 68248070
X-Ironport-Server: esa6.hc3370-68.iphmx.com
X-Remote-IP: 162.221.156.83
X-Policy: $RELAYED
IronPort-Data: A9a23:/cA4ga9zpSqPt9qUZVYsDrUDoH6TJUtcMsCJ2f8bNWPcYEJGY0x3n
 zdNCmCPPf+La2OmLtBwOtu280xSvsWHx4A2HgBs+S88E34SpcT7XtnIdU2Y0wF+jyHgoOCLy
 +1EN7Es+ehtFie0Si+Fa+Sn9T8mvU2xbuKU5NTsY0idfic5DnZ54f5fs7Rh2NQw3YDpW1rlV
 e7a+KUzBnf0g1aYDUpMg06zgEsHUCPa4W5wUvQWPJinjXeG/5UnJMt3yZKZdhMUdrJ8DO+iL
 9sv+Znilo/vE7XBPfv++lrzWhVirrc/pmFigFIOM0SpqkAqSiDfTs/XnRfTAKtao2zhojx/9
 DlCnbbtQwo1IIr0o+JHaDh6Aht1J4h9v4aSdBBTseTLp6HHW37lwvEoB0AqJ4wIvO1wBAmi9
 9RBdmpLNErawbvrnvTrEYGAhex6RCXvFJkYtXx6iynQEN4tQIzZQrWM7thdtNs1rp4eR6qOP
 5VBAdZpRDbORzpvJw82NL4vnr/ytEGhKzx69k3A8MLb5ECMlVcsgdABKuH9eNaHWMFUlUawv
 X/d8iLyBRRyHMOb4SqI9DSrnOCntSHyXo4IBaC73vFviVyXgGcUDXU+RVa95PW0lEO6c9ZeM
 FAPvDojq7Ao806mRcW7WAe3yENopTZFBYAWSbdjrljQlOyEuG51G1ToUBZrNdYrqNERfQcsj
 GSovcLTDiZKi/qsHCf1GqivkRu+Pi0cLGknbCACTBcY79SLnLzfni4jXf44Tvfr04Sd9SXYh
 mnT8XNg3+l7Ydsjjf3TwLzRv967SnElpCYR7x6fYG+q5xgRiGWNN93xsgizARqtwe+kori9U
 JosxpD2AAMmV8jleMmxrAMlRuzBCxGtamC0vLKXN8N9nwlBAlb6FWyq3BlwJV1yLuEPciLzb
 UnYtGt5vcEPbSH6MPInPN3oUqzGKJQM8/y/C5g4ifIUPPBMmPKvpnkyNSZ8IUiz+KTTrU3PE
 cjCKpv9ZZrrIa9m0CC3V48gPUwDnUgDKZfobcmjlXyPiOPGDFbMEOttGAbeP4gRsfLfyC2Io
 ok3Cid/40gGOAEISnKMqtB7wJFjBSVTOK0aXOQLLrXTfVc8QDhJ5j246epJRrGJVp99z4/g1
 nq8RlVZ2Bz4g3jGIh+NcXdtdPXkWpMXkJ7xFXVE0YqAs5T7XbuS0Q==
IronPort-HdrOrdr: A9a23:6hRrTa+TAdDwwvXwUwtuk+E6db1zdoMgy1knxilNoENuHfBwxv
 rDoB1E73LJYVYqOU3Jmbi7Sc69qFfnhORICO4qTMqftWjdyRCVxeRZg7cKrAeQeREWmtQtsJ
 uINpIOdOEYbmIK/PoSgjPIaurIqePvmMvD5Za8854ud3ATV0gJ1XYGNu/xKDwReOApP+tcKH
 LKjfA32AZINE5nJviTNz0gZazuttfLnJXpbVovAAMm0hCHiXeN5KThGxaV8x8CW3cXqI1Su1
 Ttokjc3OGOovu7whjT2yv66IlXosLozp9mCNaXgsYYBz3wgkKDZZhnWZeFoDcpydvfo2oCoZ
 3pmVMNLs5z43TeciWcpgbs4RDp1HIU53rr2Taj8AzeiP28YAh/J9tKhIpffBecwVEnpstA3K
 VC2H/cn4ZLDDvb9R6NqOTgZlVPrA6ZsHAimekcgzh0So0FcoJcqoQZ4Qd8DIoAJiTn84oqed
 MeQP003MwmMG9yUkqp/lWGmLeXLzcO91a9MwU/U/WuonZrdCsT9Tpb+CQd9k1wgK7VBaM0ot
 gsCZ4Y542mfvVmHZ6VO91xM/dfKla9Ny4kY1jiaGgOKsk8SgfwQtjMkfEI2N0=
X-IronPort-AV: E=Sophos;i="5.90,244,1643691600"; 
   d="scan'208";a="68248070"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=VV6dmM6g+IAKv4NY9YEVJKmyNQzZS48dizzdx/2UDNQxAGVkThQPLNeMECgUC5DAEtAs63yqqQaOsJWEjOPfJVicaxsBaZb53bYJ0K+YIayoVeTfBm8ICuv1T1G+ql1Qb6gRJBvD3EFCvkV8uCexmUzAVMpOhOS8cpEWhlYSs1e8tODzFWR3XBVECJ48lW03IN4eu9/K6VSothVTiPKPaVygxGfCnZ+O5RTYRYD2TdBQqdbBdaCoZzS2w7paitzjlENNweY9RD30L263vj2fwMMc0LXWz/7D4B3vAAJh/gwfcp0rEDMBOIsfflavJHH5h8o1hzf8DvtWHW3vsvOW/Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=6zIGZihN9QrKO1Zv8VBfev9JOsAi53q1iOoPU3YLL7s=;
 b=ROChJNkLD8IJfbg/22JIHSe+Pvbc1Y2LalCfK+VYeH3gn37GfR/UUKtQ+ngLRx9pzOBHhr6QR8E7pfkRHjnxqO2vph7vTqUCXyCi9iWPjTJ5+NoiVC4lcmKnIG7pHSsGCbYzyAATNxnJ8nndP75sjUkU0Rz2MGsvsvovdLh2fEJoWhTa1XiimH9GvoHSpYzIcQsH6J0Uxfa8DcF/FJNi9rH+nyyZN3Cktw4pcxR2GHe8DV0Vybird2tMZAxDdwgb8uqybLx6bHCmH3oAbdfu4x2QbTWOi+dyGCncwNqI5HGkmN5W8NHI0z9oBhrh9m8Qnb2dxW8/ewKtmceuIGQRMg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=citrix.com; dmarc=pass action=none header.from=citrix.com;
 dkim=pass header.d=citrix.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=citrix.onmicrosoft.com; s=selector2-citrix-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=6zIGZihN9QrKO1Zv8VBfev9JOsAi53q1iOoPU3YLL7s=;
 b=m6HBbbWR5G6g/NehrRaon22XaoLvxogXGcao2He+BAjdPYqn8Oo8k3a2d9iK30uyiR5H0ggJChYflh5ZKd3cCOBu7dcQ44TcRw3VkO1H+UuzSyexAVroj+lEl85+WjT2TSYnghfFYpCdDxnNbMuTNRhralZ0zgh7vb0A3Bfp/oQ=
Date: Fri, 8 Apr 2022 13:10:42 +0200
From: Roger Pau =?utf-8?B?TW9ubsOp?= <roger.pau@citrix.com>
To: Jason Andryuk <jandryuk@gmail.com>
CC: <xen-devel@lists.xenproject.org>, Jan Beulich <jbeulich@suse.com>, Andrew
 Cooper <andrew.cooper3@citrix.com>, Wei Liu <wl@xen.org>
Subject: Re: [PATCH v2] x86/irq: Skip unmap_domain_pirq XSM during destruction
Message-ID: <YlAYMrirDQUz8u49@Air-de-Roger>
References: <20220407145150.18732-1-jandryuk@gmail.com>
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20220407145150.18732-1-jandryuk@gmail.com>
X-ClientProxiedBy: LO2P265CA0267.GBRP265.PROD.OUTLOOK.COM
 (2603:10a6:600:a1::15) To DS7PR03MB5608.namprd03.prod.outlook.com
 (2603:10b6:5:2c9::18)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 20fa5bc1-1c6f-4c4a-ea8e-08da19506e87
X-MS-TrafficTypeDiagnostic: BN6PR03MB3249:EE_
X-Microsoft-Antispam-PRVS: <BN6PR03MB324981936179D5EBADE292398FE99@BN6PR03MB3249.namprd03.prod.outlook.com>
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: GQbcdRAXoRnwi8QHfnMf53xS9nvZneE/XQ+8SDlPlO+9nXkusO+NPF3DysqLIcIfhtFtYJAcVayJNc2+YKgnacsXZX5dibZRM9bgL0s4J2bi/zcQ40cM0Ij0Wt2ALKxRx6v3P6Ylb1C0B2Cp5rrJE6rrn+byFXG2eCCTlixXSQYXMoMKGBcjoSMPwabQUk6AttAdXsCVEy//4fzURGHIfVOm4xDSmVAUYv05RTXR3S8Q/KJaB2K+nY2u3VrLKbcroxjZGNj6Mr/yTYVy7Z28IwVC6CVsSr1k8gtdUgAtFN5mNXJ6brVaCnW/RaSEiWMu/zWrdofFfdCBKkxFghI9d+j6jRL7z5oddmC5xhB5xERy7qgq8Cz7oJwoala3x5jl5AVI4KR1YrXY/ue858VCDX+4BunfMQxWKlL4xan+dXwiArca3dyvgd6vSEL3dZmiB1UdTa/n0xrIJaFqQGPf+5eadtZE5pJakCph18KgDlKTbOqBzyLRq4QgtyhhvdV1S2KO4AhTR+t7aK9xaw+5LpcjjKVtAh7t9Wcj+FeMWt/JnjcI/UGp6AwNncfgjcR3RIVSYnewgSvi1Rw6jYRPXJyaDCaGvKvwMKwr64wBLkOf0OEoJjkCX1IdSgdlUmUWWtVZAjzsL9E8crdDmrJGrw==
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DS7PR03MB5608.namprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230001)(4636009)(7916004)(366004)(6506007)(6512007)(6666004)(9686003)(33716001)(38100700002)(85182001)(82960400001)(83380400001)(26005)(186003)(5660300002)(6916009)(54906003)(8936002)(316002)(4326008)(2906002)(8676002)(66556008)(66476007)(66946007)(6486002)(508600001)(86362001);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?UjlrRkxLcDFSdTBNY1QwYWN0S1NjUGs0dmVmclVPaEZCbnZiWjN1V1dJU1J4?=
 =?utf-8?B?NFQxTDYzM0RpY1U5bFg1RHg3QXY3cm1SSENRTEp5elNFOStXd2l5d2dhRTRP?=
 =?utf-8?B?dlA0ZEpYVllhNmxSVDdwSkJYQkFOWi9kaGZMSWQ4YkRRanV4cjY4ZkFwWnFY?=
 =?utf-8?B?cXl4eFl2NkVWekVkZlAxQi94TGljZ0R5SXR4U3A3cDlpODZ1ZGJwdmpIbENa?=
 =?utf-8?B?WnRRa2ZiM1NaWUFOb3Z2SDBaMVBKdkhZelV2Rk5hRnJMSEJaOUVrOUIwM21K?=
 =?utf-8?B?MENTcmFEUmwvNGlGNGwra0szYnpCSm9qenAwUmtmWDBGbTRGZ3RLc3Y4Z1RQ?=
 =?utf-8?B?M00zdTFDTTdKayt5OXJ3V0RiMmppWlZHZERab0s3eDg5OTNVMXQzODc4VVVO?=
 =?utf-8?B?V3BTY1N5VFB4dEhRblJlWmpjQWg4SWVFNFdtRFdCRzRDNW94OHY3b1dNLzJ4?=
 =?utf-8?B?Z3YyTk1OQkhidTdMRVNXMW5UemtEazdaZFlDbmdZeDRzRGlqZWNKZ3JNVUdp?=
 =?utf-8?B?cktyRUpFVjBmVHAvaFdYajBJbDN5Y3ZsMEN2VG1zTUtkOHFpYmZObjduQ2Qx?=
 =?utf-8?B?Y3psMlliaVI2RmdpQU4vSmJVUGlmY1hYY1E4Y29UY3hrUVJsRWNiN01tODFD?=
 =?utf-8?B?aDNDUnZFSUpGYUo0dTNIVjdWaVZrci9sbFVmM3l1RWdzZGtaRnpyOWhyU3du?=
 =?utf-8?B?TkhLN003dGw5VGlmMHpyS3pidFFIWGpqQjlHY1hObWMxMFJxS0RLNFpOeDdw?=
 =?utf-8?B?NURXU1BOT281SjNpejlQRy9DdW42OUlkRkE1TVA1cVlDU1pKeUkxbHNBSGls?=
 =?utf-8?B?UzRHUzdpV1BCbUtsSVZFMCtMdzcyMkg3NGtQNFVUS3BONnlKc1Jqa3hIOGRH?=
 =?utf-8?B?K0drMnFFZ0FGUjh2MUtHdkkyNXY1ZWhUU2I0azgrdndHWG4vTTJqYjFHWHor?=
 =?utf-8?B?dDJ4N29EMzAwWlRhT3ZzOVZwZUVOblZ5VkEyeWNsYllZVHpFTHlRVjRuNWRi?=
 =?utf-8?B?RE9jRjdOeXJocWFXRlhtM3pTZWJqbUwrMjlTRzNPRG9hWUxEeEF0UFRKaFVp?=
 =?utf-8?B?ekl0eHdIOUJ2NVlXVnNXS1NFQjA0QitDYzhOYUs1TWVTbE5jRjIyTFZTQmNp?=
 =?utf-8?B?UVR3M3VJVExqaGhVdjBNbENMekRTY2Fna1FOdVdkZGhjS1h4cTYwbGZqaDJJ?=
 =?utf-8?B?ZzM0bVpTMitKbWhjRXozL1U4T0JuVW5DcEZtYXo0clFlVUQzSXJQZis1VEhn?=
 =?utf-8?B?REVSc0ZEMkpIK2JpY1p0bEgwaWVrdFY0SDJLNUtFZ2hFckJpZGdUc2M0NVhx?=
 =?utf-8?B?UTJrRDF2aFdjUkNsSjRzcnpickcwNGJHSFpkQlF0aFBDbHFXTGxpQ1VjNU1W?=
 =?utf-8?B?OVBDdVdRbGw0djdjOWl4WUxWbFA1QU0wdGRKSmNiSHlNbnMra3lOZEwwWDFw?=
 =?utf-8?B?RUhUbXFoMi9kcG00TnQ0UTF3eGdUWEc5aDFPTE5abmRCSXBOUms5TkhpN3ZK?=
 =?utf-8?B?VjJhTUFsa2czSHRQQjZKRHBNaGQvTVI1V2o1OFZjSE5UVmdOamZ3aW9TRFpu?=
 =?utf-8?B?bHBMZDJ6Qm1pZ0pWd1cvZWlFTGE2N3cvRmluZmJnWjJiczZGdnpOeTFja1JS?=
 =?utf-8?B?SlRoenpQL2dtZFl4SGt6RFljdUsxWXVOK2ZCQkNVOGV6T0FpcGZ0NkpRdDd3?=
 =?utf-8?B?QXk5WVlsVmkzQnAzc0VNKyt2L0NBVWRURHp4dlNDZVBPeXlVLzF6WU9rMEox?=
 =?utf-8?B?dURzZ2x2eGo4Zm5Mdy82ajJqU2Q3VGZ3NExnRmRLdXFjVjdJMnpJdUFsYTBx?=
 =?utf-8?B?ODZ6U0RTQUdFYUVhK0ZlcTVYaTBEbFVMVzRZOEZOdlorYVk5SUFxWmlnSGlO?=
 =?utf-8?B?TU0yb2FNTDkvR2hIRVNzdnVYL1JSWGRPQ29wdUR3SzExNmNUZ0k3QVFtY2k0?=
 =?utf-8?B?QVBLOEhEaU9wNkl5dWM3d2N0djhxc0U0UXlXSk85Z1JBRzNCL3RQaVJwTEgx?=
 =?utf-8?B?ZlNqQUZYUjZ6cVZSTnBmaGlIZEVOWWRXYUdyblJBa1czT2c0MWkwTmNxQ2ph?=
 =?utf-8?B?aTdJVG01V3pRdGFGOXVnS2lUMWNiOGlLbStpYjhETTIrTW81Y0pUbVFsei9k?=
 =?utf-8?B?S3ZmS1FrbTQ4TmU2Y3p6QzlrTWQyNXVYamk2a2MzNkphb3RWT0QrZWpvMUhU?=
 =?utf-8?B?ekZzcGJRMDg5d3E5UUlaN0lXMFNYVDhmZHl4YkcrR0xLOTVSTVdIUkl4N01Z?=
 =?utf-8?B?R0Q2VXVONUVReGFTSXpJeUtrellaa1l6ZEJNM3ZTSFEybkkvSW1WVzRraDhM?=
 =?utf-8?B?c2ZDOHJzR0xsOWFSdmRWRkRNb2RUa0RnR2gzbUlidjVTZSsyOXltcVRNTWw2?=
 =?utf-8?Q?1KBGH48ff3T+uBmA=3D?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 20fa5bc1-1c6f-4c4a-ea8e-08da19506e87
X-MS-Exchange-CrossTenant-AuthSource: DS7PR03MB5608.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 08 Apr 2022 11:10:47.1012
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 335836de-42ef-43a2-b145-348c2ee9ca5b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: qzCk7wnK++cPU7nciNB7DBxDYUXE1tejxMcWV7ucyGIqj2MPB0EBDWzMjOm+gZZ0ewhZaKMkEtQLHBCdqc1PpQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BN6PR03MB3249
X-OriginatorOrg: citrix.com

On Thu, Apr 07, 2022 at 10:51:50AM -0400, Jason Andryuk wrote:
> xsm_unmap_domain_irq was seen denying unmap_domain_pirq when called from
> complete_domain_destroy as an RCU callback.  The source context was an
> unexpected, random domain.  Since this is a xen-internal operation,
> going through the XSM hook is inapproriate.
> 
> Check d->is_dying and skip the XSM hook when set since this is a cleanup
> operation for a domain being destroyed.
> 
> Suggested-by: Roger Pau Monné <roger.pau@citrix.com>
> Signed-off-by: Jason Andryuk <jandryuk@gmail.com>
> ---
> v2:
> Style fixes
> Rely on ret=0 initialization
> 
> ---
>  xen/arch/x86/irq.c | 10 ++++++++--
>  1 file changed, 8 insertions(+), 2 deletions(-)
> 
> diff --git a/xen/arch/x86/irq.c b/xen/arch/x86/irq.c
> index 285ac399fb..de30ee7779 100644
> --- a/xen/arch/x86/irq.c
> +++ b/xen/arch/x86/irq.c
> @@ -2340,8 +2340,14 @@ int unmap_domain_pirq(struct domain *d, int pirq)
>          nr = msi_desc->msi.nvec;
>      }
>  
> -    ret = xsm_unmap_domain_irq(XSM_HOOK, d, irq,
> -                               msi_desc ? msi_desc->dev : NULL);
> +    /*
> +     * When called by complete_domain_destroy via RCU, current is a random
> +     * domain.  Skip the XSM check since this is a Xen-initiated action.
> +     */
> +    if ( !d->is_dying )
> +        ret = xsm_unmap_domain_irq(XSM_HOOK, d, irq,
> +                                   msi_desc ? msi_desc->dev : NULL);
> +

Nit: I would remove the extra space here, but that's a question of
taste...

Reviewed-by: Roger Pau Monné <roger.pau@citrix.com>

I wonder if long term we could make this cleaner, maybe by moving the
unbind so it always happen in the context of the caller of the destroy
hypercall instead of in the RCU context?

Thanks, Roger.


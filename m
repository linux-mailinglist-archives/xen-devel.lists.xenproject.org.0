Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id CA6C040A944
	for <lists+xen-devel@lfdr.de>; Tue, 14 Sep 2021 10:33:02 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.186277.335001 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1mQ3rx-0001gI-L6; Tue, 14 Sep 2021 08:32:45 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 186277.335001; Tue, 14 Sep 2021 08:32:45 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1mQ3rx-0001dF-H9; Tue, 14 Sep 2021 08:32:45 +0000
Received: by outflank-mailman (input) for mailman id 186277;
 Tue, 14 Sep 2021 08:32:44 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=K1wc=OE=citrix.com=roger.pau@srs-us1.protection.inumbo.net>)
 id 1mQ3rw-0001d3-4O
 for xen-devel@lists.xenproject.org; Tue, 14 Sep 2021 08:32:44 +0000
Received: from esa5.hc3370-68.iphmx.com (unknown [216.71.155.168])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id 5427d412-1536-11ec-b404-12813bfff9fa;
 Tue, 14 Sep 2021 08:32:43 +0000 (UTC)
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
X-Inumbo-ID: 5427d412-1536-11ec-b404-12813bfff9fa
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=citrix.com; s=securemail; t=1631608363;
  h=date:from:to:cc:subject:message-id:references:
   in-reply-to:mime-version;
  bh=ZezQPooQbQlS0umoJVJdwI8mPZjcPE0V5DvMh+Oe/K4=;
  b=SAbt+qScwP6Nh9nsChqjFwcRH7z8Is3aMT19GxbrrdxnfCsbT47iTBf0
   084LDjKgy1QXzgcSF2K8BbsT0s66TBNJ6zXiOmMcPtTSTu/4QPbminsyQ
   TSOyBdcp13Cxe89MnSMbAOXjoNbY3u2DTyXxYPXEG7uo4o3IhZh2hRGN2
   8=;
Authentication-Results: esa5.hc3370-68.iphmx.com; dkim=pass (signature verified) header.i=@citrix.onmicrosoft.com
IronPort-SDR: cvoL9MUQLVgbPbZQ1EON2NXTngTlhnZMZvV9P0JHsrjO95o4Kc0jVK2qBGyp4YoYNnilRHHN/s
 pKorCaSGcbgHEZfO1XgcsCHYCdUKAh6pDgETNDfqQfyAW+ckVhqmSbiiwuE9XSQmkjQefd0qAg
 CWvTuf8oXTyJ/ynzF6ZlDE7mNQamAu+4Bid3kDRF6CU5p3Cm2I7KJGMhs1xNwrzMyhvRdaRFpA
 8UA0smURnM2+8e9Gex1fFxOWM28+kNag6cRnTjNqH1hgktT0pj0CoOdb1FzcAMKNyeCSPLzPxQ
 rxdci4R7WcDCiX7r/jpL9LO4
X-SBRS: 5.1
X-MesageID: 52248973
X-Ironport-Server: esa5.hc3370-68.iphmx.com
X-Remote-IP: 162.221.156.83
X-Policy: $RELAYED
IronPort-Data: A9a23:9xEIlarOdfLmYXYsGQI/CI2ADkReBmLvYhIvgKrLsJaIsI4StFCzt
 garIBmDPK2CM2v2KNx3bt/j9hxQ65fSx4MySwVp/HsyHilGp5uZCYyVIHmrMnLJJKUvbq7GA
 +byyDXkBJppJpMJjk71atANlZT4vE2xbuKU5NTsY0idfic5Dnd84f5fs7Rh2Ncw0IHlW1rlV
 e7a+KUzBnf0g1aYDUpMg06zgEsHUCPa4W5wUvQWPJinjXeG/5UnJMt3yZKZdhMUdrJ8DO+iL
 9sv+Znilo/vE7XBPfv++lrzWhVirrc/pmFigFIOM0SpqkAqSiDfTs/XnRfTAKtao2zhojx/9
 DlCnb2VWS12O7X3pM8cc0UFGh5FbfJcw6CSdBBTseTLp6HHW37lwvEoB0AqJ4wIvO1wBAmi9
 9RBdmpLNErawbvrnvTrEYGAhex6RCXvFJkYtXx6iynQEN4tQIzZQrWM7thdtNs1rp0UR6qON
 pVCAdZpRDTqbAZrF00vM7IVnvXypXvUTgNg8U3A8MLb5ECMlVcsgdABKuH9YceWTM9YmkKZo
 GPu/GnjBBwectuFxlKt9nOqm/+Kni7hXo8WPKO3++Qsg1CJwGEXThoMWjOTsfS/z0KzRd9bA
 0gV4TY167g/8lSxSdvwVAH+p2SL1jYeUddNF+wx6CmW17HZpQ2eAwAsTDFbb8c9nNQrXjFs3
 ViM9/vjAiZuq/uSUm6H8amPriKaPjIcJmsPIyQDSGM4D8LL+d9pyEiVF5A6TfDz3oad9SzML
 y6ijQ0ureoWlfU3/KSboQ3OvAn8+YLyUVtgjunIZV5J/j+Vdab8OdfxswOGvKofRGqKZgLe5
 ylfwqBy+MhLVMvUxXLXGI3hCZn0v67tDdHKvbJ483DNHRyW8ni/dMh75DhkLS+F2e5VJGe0P
 Cc/Ve5XjaK/3UdGj4csOOpd6OxwlMAM8OgJsdiOMrJzjmBZLlPvwc2XTRf4M5rRfK0QrE3CE
 c3DLZbE4Ykm5VRPk2PtGrZ1PU4D7SEi32LDLa3GI+Cc+ePGPha9EO5dWHPXN7xRxP7U8W39r
 ocEX+PXmko3bQELSnSOmWLlBQtRdiZT6FGfg5E/S9Nv1SI9RDh6WqOOmOh4E2Gn9owM/tr1E
 riGchYw4HL0hGHdKBXMbXZmabj1Wo14o259NispVWtEEVB6CWp2xKtAJZYxY5c98+lvkax9Q
 /UfIp3SCfVTUDXXvT8aaMCl/oBlcR2qgyOIPjakP2djL8IxGVSR94+2ZBbr+QkPEjGz6Zk0r
 Yq/216JWpEEXQljUprbMar901OrsHEBs+tuRE+UcMJLcUDh/dEyeSz8h/M6Oe8WLhDHymfI3
 gqaG05A9+LMv5U04J/CgqXd99WlFO53H0x7GWjH7OnpaXmGrzT7mYIZCbSGZzHQUm/w6Z6OX
 +QNwqGuKuADkXZLr5F4T+Rhw5Uh6oa9vLRd1AllQinGNgz5FrN6L3Ca9sBTrakRlKRBsA67V
 0/TqNlXPbKFZJHsHFILfVd3a+2C0bcfmyXI7ORzK0L/vXcl8L2CWERUHh+NlC0Cc+clbNJ7m
 b8s6JwM9giyqhs2KdLX3Clb+lOFImEET6h65IoRB5Xmi1Zzx1xPCXAG5vQaPH1bhw1wD3QX
IronPort-HdrOrdr: A9a23:WW820arnXNcFu8vVyO3oKwcaV5vPL9V00zEX/kB9WHVpm5Oj+P
 xGzc526farslsssREb+OxpOMG7MBThHLpOkPMs1NaZLXLbUQ6TQr2KgrGSoQEIdxeOk9K1kJ
 0QDpSWa+eAc2SS7/yKmTVQeuxIqLLskNHK9JbjJjVWPHlXgslbnnhE422gYytLrWd9dP4E/M
 323Ls6m9PsQwVdUu2LQl0+G8TTrdzCk5zrJTYAGh4c8QGLyRel8qTzHRS01goXF2on+8ZuzU
 H11yjCoomzufCyzRHRk0fV8pRtgdPkjv9OHtaFhMQ5IijlziyoeINicbufuy1dmpDk1H8a1P
 335zswNcV67H3cOkmzvBvWwgHllA0j7nfzoGXo90fLkIjcfnYXGsBBjYVWfl/y8Ew7puxx16
 pNwiawq4dXJQmoplWy2/H4EzVR0makq3srluAey1ZFV5EFVbNXpYsDuGtIDZY7Gj7g4oxPKp
 ggMCjl3ocXTbqmVQGbgoE2q+bcHEjbXy32DnTqg/blkgS/xxtCvg4lLM92pAZ2yHtycegB2w
 3+CNUaqFh5dL5jUUtMPpZwfSKJMB2+ffvtChPaHb21LtBOB5ryw6SHlYndotvaP6A18A==
X-IronPort-AV: E=Sophos;i="5.85,292,1624334400"; 
   d="scan'208";a="52248973"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=awWTx/jNK4zh1zBWnqhfovflqthpRwZz/2u4F+SH8fy7n6QwSKuQSaK+VbmyrTQoWsT1cTZRytbl/ITne2w4hsjYJO6jsgalygw84+YV5pZeMId94mZoHpah/n+bZQ0U3UliySduBN1oG8OPKeMcEdIfJYVPuHz45z0ZQUIpXXgyx8aNxohJLtR7GP1ZXS+DhJREN/+di2qzYlDQk750V0CpOFRh+B+loUBTM37IlLT9fBg3CoLBJ5aIoC8e29wfbVWOERcFyyxfRZc3WxMW8oJDrDai572uvBv8vav6C5SdhjMTMI7LFAsjagtRrwr0q4gkUQRBElYiXHIimejWMw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901; h=From:Date:Subject:Message-ID:Content-Type:MIME-Version;
 bh=wrQC+1b7iEYcqIUfkjJLrWIXe0PichpEoEMz0g+BwNM=;
 b=fjtdxbag+iVHLVaL1uQoMs6JDoqjuhwMLwZjKZeTZAAMjTBphd8yMZmOG2sH75pBg1WK+th0YUlUfgtylJyYfsDHiOJsmBPJjdITccrMaHBo34/yqo1sUqV4J0RhCkIr58150WLET5xj/nuElN5lfbQWiAa8XC94Be6NDgMHp8THNsrby7n+HBVSxjQNYFzjw/sPR/LaG/C9XxHCsNwJjp7RzJY+BVBWTZLXCC0yNgsdBoZUJg9oL1VUu4mRJDh3l/KxQpStxVRtrqRYXAV5V89bxDUD76Taj/6vJKQZp+1nLjZYf6paKGBiTrog/c/+CFxpiY0Qbifpv2I80VA8vA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=citrix.com; dmarc=pass action=none header.from=citrix.com;
 dkim=pass header.d=citrix.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=citrix.onmicrosoft.com; s=selector2-citrix-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=wrQC+1b7iEYcqIUfkjJLrWIXe0PichpEoEMz0g+BwNM=;
 b=vOX1CYcoVuCYjxJZYI3Z23+qPyUXdzNOgpjFV98t6jMhMDvOXskz1hCMOA+uNmeXXi3cKQmeYDDFaKXRiilGCxNQiqt2DjRjChPqf3AFyvOkzOzLKmS5n6hnrtjLUAjt9+TNtifc/PXB3+/Qc87teAALPV9ZvCMVRlfRMufFB8w=
Date: Tue, 14 Sep 2021 10:32:36 +0200
From: Roger Pau =?utf-8?B?TW9ubsOp?= <roger.pau@citrix.com>
To: Jan Beulich <jbeulich@suse.com>
CC: Juergen Gross <jgross@suse.com>, Boris Ostrovsky
	<boris.ostrovsky@oracle.com>, Stefano Stabellini <sstabellini@kernel.org>,
	lkml <linux-kernel@vger.kernel.org>, "xen-devel@lists.xenproject.org"
	<xen-devel@lists.xenproject.org>
Subject: Re: [PATCH 0/9] xen/x86: PVH Dom0 fixes and fallout adjustments
Message-ID: <YUBeJLvWXukyGSFf@MacBook-Air-de-Roger.local>
References: <4efa804e-3250-227f-00c7-347581366cd4@suse.com>
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <4efa804e-3250-227f-00c7-347581366cd4@suse.com>
X-ClientProxiedBy: LO4P123CA0422.GBRP123.PROD.OUTLOOK.COM
 (2603:10a6:600:18b::13) To DS7PR03MB5608.namprd03.prod.outlook.com
 (2603:10b6:5:2c9::18)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 1fb221f9-8cc5-4098-28d2-08d9775a36ea
X-MS-TrafficTypeDiagnostic: DM4PR03MB5998:
X-Microsoft-Antispam-PRVS: <DM4PR03MB59980174E82C64E38A8624328FDA9@DM4PR03MB5998.namprd03.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:10000;
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: VaRrgc3YzXsET2YHohp8d+P9Sw8aQ/KXZwKSDxV2Uu0RDjZhUpqUjEIGoWSoJ/FDKLk+5MfKZFtuU7IugC7mAjlzACZhR3ESc1RHZXG1/yZf9LGu3tqszwQifOlqHlXTwHmPrCSj82lRSWWo6PEPgLKZQSvOnJVcuuy8d0YOAg1I3N20foBnFNw7Hdzt05tI4484wV7X6LdbVTC0vOgS4fSVW3gepYFL/D/hxnz7f/QYivlOBhZZ06lRHQ3ugm8VClRZpVwuKisVJ1LB7AFHDaPP3RNkwBscGvV3g5Oz8HBxZcVYHxYWfBCU2Awl8SvWQBAt85cWfOxp6bDOuF9byQmXaGnmwUJxGnq/Vy84cZIHX4O/MCn9sm9cm3zfa20XjDlFA5ImSreqZZbhXP0s+Y01/Ta46QtHk8xsa8y/M+R/wAaGJkxDLjxXNOOnHglMBkK6fICNCEDQ+8UeFjumvZfGKi7uu4ZML+PXQz75Nco97elh4SavBOWgMN7KuWVTdUki1nCXnRxFSS4nTG42utMPJdVOazWh7ET/+buIbm2q4cIV3fzhtmIPGhXeL5rCRkqLSDTdzBcSGWq9Al74Ub5OyYquoL1j5pQqKgQWIMbGBWT3B9OWfh9LMg9OIIo3+N4T0ynWLbRIDCAODzcFWw==
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DS7PR03MB5608.namprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(4636009)(376002)(346002)(366004)(136003)(39860400002)(396003)(4326008)(6486002)(38100700002)(6666004)(26005)(9686003)(2906002)(8676002)(6496006)(54906003)(66556008)(478600001)(66476007)(956004)(66946007)(85182001)(186003)(316002)(8936002)(86362001)(6916009)(5660300002)(83380400001);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?aGN6WGxUSzltaTVUcXhFZGVuOUdudERxNWVXRmIxeWRJR3lKVUMvckxjeUdh?=
 =?utf-8?B?VTY3M1dZUVdYZkRraXN1ZzV1L2lCUHVPSnNxOUpNcWNXNmRmb2xOalJ5cXBS?=
 =?utf-8?B?WU1XVENKbTRvckN4RG5yWWw2YkZiNGJaa2NKbHZWVUd0Q0JiaTJ1L21BVGYy?=
 =?utf-8?B?TXdLNzB2bFpUUFRyVkJab1dlQUVtSG5tY1Yydy9udHhhU0UrUlYxZzFQaXpW?=
 =?utf-8?B?bmE1VHpLQjE0ci80Y01abndiSmJ2UGVhbC93cFovMG9DeUVXUk5WTjg2TDEy?=
 =?utf-8?B?blRmSlZ5UFQwVUxlQzljTGJnTkkrM2N5MjZiTUpYR1RFUHgwSUJScEFPTWVk?=
 =?utf-8?B?cURuUkR0YlJCZWNMV2Nod0NvbnRNMGxRN3c4dkhzZ0xlKzNzWDkra2xNTFZx?=
 =?utf-8?B?RlRWbyszczErbUk3MWo4TjFTWVJMYis4ZENYY1NJK1R2U21aTGJCWkc2WGtX?=
 =?utf-8?B?R1JEUHRWcTZyeXcvUVRVNjMzaDBqTE9vd2NsUW9CUktjaG4zTW9wdDU1V2dN?=
 =?utf-8?B?UzgxeVJiTThrMllick5RYmVJSk5xZXYvQkRqWWl4eUdvbGh2RWNiNml3S1Ja?=
 =?utf-8?B?RFhOeWRiRmlpZ3VrakZXenQvQUVuamxYVFVHaXhhTEJxWVJHd1ZvbWpIRVE1?=
 =?utf-8?B?WDNueXZoNldJRHZweXdobWNEbnpyMmdGVGpEcWlIUU5NNHgyQ2xXNWdVMkw2?=
 =?utf-8?B?RzdLRUpaWkJQeWVFYkYrSzAvL3VVd3FyQTRqdUpzeFZ2N2pJdlRZa3pYTEpP?=
 =?utf-8?B?SkNjS0luN0JGcEFHUWlxOG0veCsxSW9DNFo4a0ZxVjVaak5PQm9xdzlPV2VM?=
 =?utf-8?B?Q0ZFNGt1dGc2c09HWUpRR2xTUHVzT2R6NXFVbXF4UFlwc0ZmeU1VWHQ2ZU4y?=
 =?utf-8?B?a2NlRmdsaDdud1NqMjI4V0pRWGpmUFFET1o3MW9lKytSU3RIS2F2dFBRdUo1?=
 =?utf-8?B?ejRJc0lIUzZiN0grT0N2VkNlRmlsTnBtWUNMT1U2WXlBY2QrVmtYdDExQWhn?=
 =?utf-8?B?WGlIVWFPOHRWT2xWUkNaZWJ2UmlxZWs2NFdDakFFc2ptUUFkaktqd2k4dlQ1?=
 =?utf-8?B?Rzk2bDNoZUlvUkxQd0FLL1lHZktZMDIxbHNLWGxuU3lpTWhSU3p3U0tUYmNl?=
 =?utf-8?B?b1FGbzNuZ0hBeFN6blhhM3BCUnNHTFl3V1RtZkN4a2J3S1BjN2dOcU9jOTgw?=
 =?utf-8?B?aVBDM1N5ZFRvYmlYWUdqYTRZM3pBRmc1L0xNY3hhalRxQWpFWUFxbnpVS1JP?=
 =?utf-8?B?UjdZSmdyOXRxY3NUOThMWkErQXY3bHN5ZUprZnAvakQ4L3lBOHBvZm9wYWtU?=
 =?utf-8?B?SWtkRmVWVG9iZ25SQWNObitYQ3hFZ1JyVDZkM2gxZ29wSG9xdFhsc09NYVN5?=
 =?utf-8?B?MWY1TjFPNUQ2UnVNcFllbmYrRG9taEg5TFhXZDZVUUkyc0RFZUVCVHI0MGhF?=
 =?utf-8?B?d0pXaUtObi9kZXo1dWFqMCthbHkyaG56QWZjNzM0a1l4NjFuYnRjaVNSeVlh?=
 =?utf-8?B?aEZhakc2d3pMR0djNW9hMFFPYkNNNWU2Q1JUZ3Z3ZjdlNmZFVmxRTFl3V0dB?=
 =?utf-8?B?aXFwU09Yb2hZQ0Z0Z2RTY1A1dDVmZk5adUJ4aFBLS3VuWlJldXhyTUd5SjVw?=
 =?utf-8?B?YjlOQlV0NnBHU05uQ2RRTTcyNmdLYThjelpqemxrTFpWMzVyRnFTTGpFSzRi?=
 =?utf-8?B?anlnRHB3cGlYUTRXVy9Xays4QWQxWnAwOGhKeVVQSFA2ZkZDUExkWWtraHNH?=
 =?utf-8?Q?ZyYw56iLjSHDrocjfRcqVEiCRMqwv4GylWls66V?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 1fb221f9-8cc5-4098-28d2-08d9775a36ea
X-MS-Exchange-CrossTenant-AuthSource: DS7PR03MB5608.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 14 Sep 2021 08:32:40.3679
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 335836de-42ef-43a2-b145-348c2ee9ca5b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: Wg3IqW9xrUbNlHaxYIFTRUi27UYPRzI7Yel5HTt24AEGCbKd1+DptdhhNo4nXCgWohEndo6GAFE3ChT5SlPUyw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM4PR03MB5998
X-OriginatorOrg: citrix.com

On Tue, Sep 07, 2021 at 12:04:34PM +0200, Jan Beulich wrote:
> In order to try to debug hypervisor side breakage from XSA-378 I found
> myself urged to finally give PVH Dom0 a try. Sadly things didn't work
> quite as expected. In the course of investigating these issues I actually
> spotted one piece of PV Dom0 breakage as well, a fix for which is also
> included here.
> 
> There are two immediate remaining issues (also mentioned in affected
> patches):
> 
> 1) It is not clear to me how PCI device reporting is to work. PV Dom0
>    reports devices as they're discovered, including ones the hypervisor
>    may not have been able to discover itself (ones on segments other
>    than 0 or hotplugged ones). The respective hypercall, however, is
>    inaccessible to PVH Dom0. Depending on the answer to this, either
>    the hypervisor will need changing (to permit the call) or patch 2
>    here will need further refinement.

I would rather prefer if we could limit the hypercall usage to only
report hotplugged segments to Xen. Then Xen would have to scan the
segment when reported and add any devices found.

Such hypercall must be used before dom0 tries to access any device, as
otherwise the BARs won't be mapped in the second stage translation and
the traps for the MCFG area won't be setup either.

> 
> 2) Dom0, unlike in the PV case, cannot access the screen (to use as a
>    console) when in a non-default mode (i.e. not 80x25 text), as the
>    necessary information (in particular about VESA-bases LFB modes) is
>    not communicated. On the hypervisor side this looks like deliberate
>    behavior, but it is unclear to me what the intentions were towards
>    an alternative model. (X may be able to access the screen depending
>    on whether it has a suitable driver besides the presently unusable
>    /dev/fb<N> based one.)

I had to admit most of my boxes are headless servers, albeit I have
one NUC I can use to test gfx stuff, so I don't really use gfx output
with Xen.

As I understand such information is fetched from the BIOS and passed
into Xen, which should then hand it over to the dom0 kernel?

I guess the only way for Linux dom0 kernel to fetch that information
would be to emulate the BIOS or drop into realmode and issue the BIOS
calls?

Is that an issue on UEFI also, or there dom0 can fetch the framebuffer
info using the PV EFI interface?

Thanks, Roger.


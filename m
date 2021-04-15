Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 84D1F360C29
	for <lists+xen-devel@lfdr.de>; Thu, 15 Apr 2021 16:48:31 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.111329.212955 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1lX3I7-00037u-ES; Thu, 15 Apr 2021 14:48:23 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 111329.212955; Thu, 15 Apr 2021 14:48:23 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1lX3I7-00037O-AX; Thu, 15 Apr 2021 14:48:23 +0000
Received: by outflank-mailman (input) for mailman id 111329;
 Thu, 15 Apr 2021 14:48:21 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=E4R4=JM=citrix.com=roger.pau@srs-us1.protection.inumbo.net>)
 id 1lX3I5-00032q-MK
 for xen-devel@lists.xenproject.org; Thu, 15 Apr 2021 14:48:21 +0000
Received: from esa1.hc3370-68.iphmx.com (unknown [216.71.145.142])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id ba634281-d9ce-4cc2-95b1-2ebe5457b840;
 Thu, 15 Apr 2021 14:48:16 +0000 (UTC)
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
X-Inumbo-ID: ba634281-d9ce-4cc2-95b1-2ebe5457b840
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=citrix.com; s=securemail; t=1618498096;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:content-transfer-encoding:mime-version;
  bh=Kunq9PfgxSdHoMHI/h5eyL0p/6ZQDQ9CXx7r1toiMfM=;
  b=RpTca5FHx9WpZjxlLdlAE5XQJyhdj/5Xz2g94icGZ0DcXK8dD/0Sx8v6
   j2ya/9rNGI04zI2bZ1ngOjn2FdR2FWPpw6CgbKon0u/0TjT6VqfXkQZuH
   i4DG8vPDsGrZ4XBxseTcOc7cnurCYcojCU4Bxt4DaQ6rbVDTBY97T5Vna
   8=;
Authentication-Results: esa1.hc3370-68.iphmx.com; dkim=pass (signature verified) header.i=@citrix.onmicrosoft.com
IronPort-SDR: FEbPpeL8df1hy1rsFcLMO3YI3udxTCCFg6dhO9v9eOznpAVdz5FcHV4sl7P15zEZq8dR8UHZmA
 OvVgbiklyasegMrCVPZ0+x7GDO/3i8ggPe31C0tmhr6si9Z0ZKyR7z5d/tost+Drcc96iOTJt9
 be1hmZznwyNwE1ZwWa0N1tEu8vEhId4Uwpfk2GJYQyLL5nTvQmhgiHIrLMw2EKEDCj/5AdpJfy
 O5XTRqlP6jBL7uUuAUs+kgz5z3Q4stViB3ivKZOVQBmJsdCN5Z2K9FALYFxmGr70oXElkUqkhO
 leA=
X-SBRS: 5.2
X-MesageID: 42063254
X-Ironport-Server: esa1.hc3370-68.iphmx.com
X-Remote-IP: 162.221.156.83
X-Policy: $RELAYED
IronPort-HdrOrdr: A9a23:tc1wfqgoMcpzAgN7FZ4RXlguL3BQXzxw3DAbvn1ZSRFFG/Gwv/
 uF2NwGyB75jysQUnk8mdaGfJKNW2/Y6IQd2+csFJ+Ydk3DtHGzJI9vqbHjzTrpBjHk+odmup
 tIW5NVTOf9BV0St6rHySGlDtctx8SG+qi0heHYi0xgVx1udrsI1WdEIyywe3cGIzVuL5w/CZ
 aa+457vDKmY3sadYCWAXMCUujFqbTw5e/bSDQBAAMq7xTLsCOw5NfBYmKl9zo9cxcK+7ct9m
 DZjxf0j5/Dj9iXwgLRvlWjlqh+t8DmzrJ4damxo+w0DhmptQqyfoRmXNS5zUEIicWi8kwjnt
 WJgzpIBbUK11rrcmu4oQTg1mDbuV5EgRKSqi778AjeiPf0WS4gDI55jZ9ZGyGplXYIhs1206
 5AwguixvxqJC7H9R6Ng+TgZlVBk0q5pmcaiugDj3BTept2Us4vkaUvuGxSC5sOByT89cQOF/
 RvFtjV4LJsfUqddG2xhBgj/PWcGlAIWjuWSEkLvcKYlxBQgXBC1kMdgOgShG0J+p4RQ4RNjt
 60fphApfVrdIs7fKh9DOAOTY+cEWrWWy/BN2qUPBDOCLwHE2ilke+33JwFoMWRPLAYxpo7n5
 rMFHlCs3QpRk7oAcqSmLVW7xH2RnmnVziF8LAR27FJ/pnHAJb7OyyKT14j1+G6pe8EP8HdU/
 GvfL1MBfvOKnbvBJZp0wXyV4I6EwhcbOQl/vIAH36eqMPCLYPn8sbBduzIGbbrGTE4HkPza0
 FzHgTbFYFl1ASGS3X4iB/eVzfGYUrk5699F6Dc4qw2wIgJPYtcjxgNhT2Cl4S2AAwHlpZzUF
 p1IbvhnK/+j3Kx53z042JgPQcYKUpJ/rP6UTdvqRURO035NZYP0u/vNlx67T+iHFtSXsnWGA
 lQqxBc4qSsNaGdwigkFpaAKWKVj3waoVqQVJcCkqi/5cPoE6lITqoOaehUL0HmBhZ1kQFlpC
 NocwkfXHLSETvolOGYlpAOPfrecNN9mQ+vBsZRpRvkxAGhjPBqYkFecy+lUMaRjwprYzZPnF
 V+/5USh6e6lS+1JXEyh/k5N1NweH2aaYg2fDitVcFxoPTGaQtwRWCFiXihhxY/dnHD2m8Sim
 biRBfkMc3jMx54gDR1w6zq+FR7eiGhZEp2cGl9qpA4P3/BoGxP3eiCYbeT32OdZkAZ+PwUNC
 jIbFIpU0RT7uHy8CTQtCeJFH0gyJlrA/fUC647darPnlyqM4+FmMg9bohp1acgEOqrlOAFUe
 iSIVDIaBz5Dv4kwAyTqDIOPjJupHwtjPPv31nE4QGDrQsCKMuXBG4jYbcRZ+y4xSzDYd2j1Z
 1il9I7veeqKAzKG5e74JCSSwQGEw/ZpG69cvohpp9Vt58jrbcbJeiobRL4kFV8mCgkJMj6lE
 kiUL12zbDINIhoZdETcUtijy4UveXKCEMqtwDsa9VOBm0Fvjv+P9mT5aDPpqdqKkqdpBHoMV
 33yVwXw971Gw+C36UdEaQ+PCB/b1U98m1r+Kene5fLAAunM8FF81zSCA72TJZtDIyEE64XtB
 B0/pWhmPKWbTPx3ETohgRAS5g+hVqPcIeVGwKDGelB7ty8NxCtu8KRkbKOpQaybyC6ZUQejZ
 BCbmoKYK14+38fsLE=
X-IronPort-AV: E=Sophos;i="5.82,225,1613451600"; 
   d="scan'208";a="42063254"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=OL6HwFSEdUhn36uyypCEs90+eC/dHYiZx9cltDvjwN/dBSiUZAHYlyERN+G/jYAOYRTrh2LKi1ij3wwYSbHneArn48qpNCYLIJRgHwMclujQxAJjnM39np38qWbGTyzCtG7TQPkHHrg6chx8GS7glOjCFSRKyndbVnID1QoF2KUukRPZhC71Py1yOBdAfdNcFPdxN6JBRr7jldVhiuuAsoMgjA7ZYAMiSpbmdY2fW5kwQ0QAbos+palp2YwOam2EdH7gk98v230846gef7nFgvVnXURM3v58HJmU8mMzSgpCg4s/Q7tZQzqrvFGhJG8DErPRYu+MDUpRGg52q0tnJg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=JOwBr5KtW140gDg1QrHVd6cRRXtjGL3eSjcb7YdoXo4=;
 b=eg92DNrqdeaqo/mVLYLavp2KI7ptwOw8/4MYC2Su+8kQnSEk/Q571aaKDz8y9ZDlH7tJJiaNE5ZjYvaHMP7a/wifhVnAl/47MHOQzHyLWkZxjjnzGP/Tb4UjIX6uAM9HlvxqbzcldUqzRNg2nQ33eOaGaGUdsEDsUd6y8uE1uwX9JEw8eT8cpHymGV3LJ633jowmBjdkO2492tZm3c4nt0BaN927r3j/4XDsKIwVUo8Iw4VrS1/IMCbGq61MiqY3wQmArNNzdceP0UfYEJ/FCjPwi0bp3nD4fVWs3QFdqV4JY+99BBBM8+MJHgNyJSQUdE+kco3dP7t+PwsS72rr+w==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=citrix.com; dmarc=pass action=none header.from=citrix.com;
 dkim=pass header.d=citrix.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=citrix.onmicrosoft.com; s=selector2-citrix-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=JOwBr5KtW140gDg1QrHVd6cRRXtjGL3eSjcb7YdoXo4=;
 b=m1CZ4Wuvv8pZfsX7eraohBhTXUZWpiBmZSCExXc2DeS2KoX7MJN2vvt716pWtUMgQrt2n2upxOQNzmt9X6GE+SHStJUV/iU7rWIJDu838oBlbGf42CslOryr4ZtYzKPJW1W6rf3C4mbqNFAVzGslVXGsebXrz97iCumzS5zM9Oo=
From: Roger Pau Monne <roger.pau@citrix.com>
To: <xen-devel@lists.xenproject.org>
CC: Roger Pau Monne <roger.pau@citrix.com>, Ian Jackson <iwj@xenproject.org>,
	Wei Liu <wl@xen.org>, Anthony PERARD <anthony.perard@citrix.com>, Jan Beulich
	<jbeulich@suse.com>, Andrew Cooper <andrew.cooper3@citrix.com>
Subject: [PATCH v2 2/2] x86/cpuid: support LFENCE always serializing CPUID bit
Date: Thu, 15 Apr 2021 16:47:31 +0200
Message-ID: <20210415144731.3356-3-roger.pau@citrix.com>
X-Mailer: git-send-email 2.30.1
In-Reply-To: <20210415144731.3356-1-roger.pau@citrix.com>
References: <20210415144731.3356-1-roger.pau@citrix.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: MR2P264CA0122.FRAP264.PROD.OUTLOOK.COM
 (2603:10a6:500:30::14) To DS7PR03MB5608.namprd03.prod.outlook.com
 (2603:10b6:5:2c9::18)
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 5316dbc0-40a7-4017-02e3-08d9001d7f8d
X-MS-TrafficTypeDiagnostic: DM6PR03MB5273:
X-MS-Exchange-Transport-Forked: True
X-Microsoft-Antispam-PRVS: <DM6PR03MB5273C6D876E51F4DC6521A038F4D9@DM6PR03MB5273.namprd03.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:5236;
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: VlxIf4Ami62kJKjfLvVpn/OvsqpY17gIJcFykPHUsUm4QuPD7r3kaZGKnrEgquO8pgWY7f7/Qxqtz8UTMuefHKiBjKoFa2MzXiL98rubL3WTiSlNQUaU7vP2PeMJmnm72NNww0X1C/zJlHyO+pyM6U7QQekTncUqFmeZ13xFUAQzD5ivTZ030bkjoiNLn8hWkbMa5yvZjD38J1DCrp5173KrU5jsMk7n/USgEQcGugRLVHPDjMOpCjswRElnTjDruiCvbjenDwKHKHxklcGh4eKF95SCCS7xy279KVF5Fti3iX98ZgfjapI24JJw2YxAGUNC6FO1s9hGgZBkfIGSFbg+8QqdJvpIdvR5d3ro5w5lSFd2d1Y2fweabMj/FqTCG/QZk9DC82kO+3pLU6wyj+yEU/dllzWilnPne1YDK6iw3GPn+Y+TJQ/MxYsiGHOyjtD9IC5Dlle4+B96y4QFgRzIrRxn4Cuti+n2sCrIKIRXA6Uatxz1kJ1Ohapi4RLKgJQ2TIs+Ce+kH+30EjpNEJlgt1+5hnyKT0R/EzMH4JCmMAHds6/48Pnwa4RGvnVil6tbxENusc0wD2XEbfvg+2H5GEHVax0UtHo/+ZKs2I0=
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DS7PR03MB5608.namprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(4636009)(396003)(39860400002)(136003)(366004)(376002)(346002)(66556008)(66476007)(4326008)(36756003)(6666004)(66946007)(478600001)(54906003)(38100700002)(5660300002)(1076003)(316002)(83380400001)(2616005)(6486002)(186003)(8676002)(6916009)(86362001)(16526019)(26005)(8936002)(107886003)(2906002)(956004)(6496006);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData: =?utf-8?B?amdxckhEV3pOUG0wU3UycG4rWWNKRWxEakNEZzBySHA4cm1aQmR6UUlKWGlm?=
 =?utf-8?B?RERUZUlLQ3U4TVNMQ1UxL3R4T1k4K2xaVjJPbjZ5ZjdZU3dQRHlQVXllenFr?=
 =?utf-8?B?VDRmR3I2M1JlSXQwdEJzQnFZRmxXZTFDYURjbExUZmlsOFl3ODYraDVpYzdL?=
 =?utf-8?B?eHlFaGlFQWtPU3dDQlc1c1NnWlY2TElDQUV1MmdJcWIvc0V6cmJnUDdrTTZm?=
 =?utf-8?B?M0ZUZDhJSFBQNXVvbmJPaTZRRTVRVmZ5Q015U0xQMXowbnRZb0ZIRkdwamNX?=
 =?utf-8?B?VUtVWWRKZFZGUm9YOUVNNktJaHdPdm10NUhmanU0N3pFTjBYK0RGa3NCUW9a?=
 =?utf-8?B?dHo3VmNCRUN2d1ZENC83eVJuV3ZKWUZPbHlIS3Fuck1WZ1l1SHN2RTN6cEdE?=
 =?utf-8?B?VjFRSHpNYmEwZjNXcGJ3dmRqc3BTN2QzY3ZuMUd5WHlBQnBmY3VQOG5WUFdq?=
 =?utf-8?B?QXJhc3lIbEtiOGZ4YUVHbGNQUitvcFh6NlUvM2RCUENOUXdLQkpQNEYxVGN6?=
 =?utf-8?B?N2Y4ckVmUEtwS2VmK0dTNWF3dm9RRXVLNWlMVmtTV1BTUEZsYzUwMWY1MTF5?=
 =?utf-8?B?WjBZblJkUklidkxOVi8wNVhnYW0xR0twT1FQaGtFZmszK1pLKytkTi9SQjBw?=
 =?utf-8?B?T1hZUU1OYi9QWExBb2E4MVJYR1JxVmZ2UmNxYWM1ckJZeUVSL3NkZjlickhE?=
 =?utf-8?B?SXZTNWFaSGNEZU0yeGJWQlQ0YXF1bzNsdytlMHZhb01vTllleVlpcnVYZEtv?=
 =?utf-8?B?S0VJdjVOMXVkbnpCeGhoeC9RK3l0RTRFNmJXcVNVY3B5bC9Gc2N4ZzhTZWpi?=
 =?utf-8?B?Tng0Q2I1cUdCR0VXWWw5VVhDZUZIdEYxVHd4bDFZcWdrRW9zOUM5bDBwMnJl?=
 =?utf-8?B?MlVlcjgzRVVsaWI0dU1HSWZHZTl2aWIxblQ3QVUxSU05eDZ3UVYwK3hERDJj?=
 =?utf-8?B?SDdNVTR4NWRuYzROWE1OWUEzQzJsQmI3ejd3L083dmlhZGliT1g2U1lpY0ZH?=
 =?utf-8?B?WXZvS0R0WXNlZTllWFVvT2hna3Y3NlVCTVcrU0JwUFBDTmpOc2o0Q215NnUw?=
 =?utf-8?B?YlJRTGJzZlJBNDBYWUY5a0haK08yU29KMDg1YVQraVd5VzAzMmpkS01Va3c0?=
 =?utf-8?B?bW9SVTFuMHF5cHR0NTJieUNRRVFmR0VTN1MxM1pVK0RiMEE5UHBSSS80d0Jj?=
 =?utf-8?B?TzBhLzBwdUYvVHNGVFJDOVk4cURWNDFkc2hNTWYwZFRHTmxVUGZmNFZBai96?=
 =?utf-8?B?dkhnazIyN1Noc045RjBwamx2RVNWYjJiSlc3NXFMalQwVURtUHhPZ01JN0Vl?=
 =?utf-8?B?anhOOEh4cmszRlBOUG9pTWozUStCOVYwdXZqbEdJNGN3VXVQcGRoM2VKM1pR?=
 =?utf-8?B?MFBuU1RXSkw1WGcvSmtxRWRjNTBzQVprdjRJNGJ3WkM4RTJndldKNXUxYTIw?=
 =?utf-8?B?N2haWFZVbVJleTJyVlp3eVFHU2t5NUI2Y2tkL25BOS9DS29Nbm9wODNuQkJh?=
 =?utf-8?B?bGhYVHM1MVdld0REaTZEOTNxaVg4SXVseWMvdEFvOFRGNVJUcWRzV1RFSFR6?=
 =?utf-8?B?OHM0Vm1iS1hTemErNDA5VjFKdFVScWhtOCtHemdoNWJ4TUlMN1FIMndSOExZ?=
 =?utf-8?B?ay8ra2lBVFpBZjJFdmtWUmpwUk10Tm1pZUI4V2R1YWdOWEpHL2FHRnlRZTNN?=
 =?utf-8?B?c28vaEtzd3BqdFBST1VXbFVXbTBnTXJvZk4zK3NZZ3hmZUxpSXZ0clpKeUVk?=
 =?utf-8?B?eUp3SGlXa2lLNkF0dDBjQ0tmTU95cDM2TnNac2NodG9nZy8wcWppUUpxcEN0?=
 =?utf-8?B?N09vV0JvTFNxa01qODB2dz09?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 5316dbc0-40a7-4017-02e3-08d9001d7f8d
X-MS-Exchange-CrossTenant-AuthSource: DS7PR03MB5608.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 15 Apr 2021 14:48:14.4894
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 335836de-42ef-43a2-b145-348c2ee9ca5b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 6iZpcfzhz5IGQSRCN/MXPHX0xucbqDzNUwyOs+uXxiKKb3+mBoM1ifIL92UiDJ2z/qD/74mlt7WZsrx5n9+Cvw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM6PR03MB5273
X-OriginatorOrg: citrix.com

AMD Milan (Zen3) CPUs have an LFENCE Always Serializing CPUID bit in
leaf 80000021.eax. Previous AMD versions used to have a user settable
bit in DE_CFG MSR to select whether LFENCE was dispatch serializing,
which Xen always attempts to set. The forcefully always on setting is
due to the addition of SEV-SNP so that a VMM cannot break the
confidentiality of a guest.

In order to support this new CPUID bit move the LFENCE_DISPATCH
synthetic CPUID bit to map the hardware bit (leaving a hole in the
synthetic range) and either rely on the bit already being set by the
native CPUID output, or attempt to fake it in Xen by modifying the
DE_CFG MSR. This requires adding one more entry to the featureset to
support leaf 80000021.eax.

The bit is exposed to guests by default if the underlying hardware
supports leaf 80000021, as a way to signal that LFENCE is always
serializing. Hardware that doesn't have the leaf might also get the
bit set because Xen has performed the necessary arrangements, but
that's not yet exposed to guests. Note that Xen doesn't allow guests
to change the DE_CFG value, so once set by Xen LFENCE will always be
serializing.

Note that the access to DE_CFG by guests is left as-is: reads will
unconditionally return LFENCE_SERIALISE bit set, while writes are
silently dropped.

Suggested-by: Andrew Cooper <andrew.cooper3@citrix.com>
Signed-off-by: Roger Pau Monné <roger.pau@citrix.com>
---
Changes since v1:
 - Rename to lfence+.
 - Add feature to libxl_cpuid.c.
 - Reword commit message.
---
Note this doesn't yet expose the bit on hardware that doesn't support
leaf 80000021. It's still TBD whether we want to hardcode this support
manually, or instead rely on a more general approach like the one
suggested by the shrink max CPUID leaf patch from Jan.
---
 tools/libs/light/libxl_cpuid.c              |  2 ++
 tools/misc/xen-cpuid.c                      |  6 ++++
 xen/arch/x86/cpu/amd.c                      |  7 ++++
 xen/arch/x86/cpu/common.c                   |  3 ++
 xen/include/asm-x86/cpufeatures.h           |  2 +-
 xen/include/public/arch-x86/cpufeatureset.h |  3 ++
 xen/include/xen/lib/x86/cpuid.h             | 37 ++++++++++++++++++++-
 7 files changed, 58 insertions(+), 2 deletions(-)

diff --git a/tools/libs/light/libxl_cpuid.c b/tools/libs/light/libxl_cpuid.c
index aee28b0430d..d3ab66b9a71 100644
--- a/tools/libs/light/libxl_cpuid.c
+++ b/tools/libs/light/libxl_cpuid.c
@@ -284,6 +284,8 @@ int libxl_cpuid_parse_config(libxl_cpuid_policy_list *cpuid, const char* str)
         {"svm_decode",   0x8000000a, NA, CPUID_REG_EDX,  7,  1},
         {"svm_pausefilt",0x8000000a, NA, CPUID_REG_EDX, 10,  1},
 
+        {"lfence+",      0x80000021, NA, CPUID_REG_EAX,  2,  1},
+
         {"maxhvleaf",    0x40000000, NA, CPUID_REG_EAX,  0,  8},
 
         {NULL, 0, NA, CPUID_REG_INV, 0, 0}
diff --git a/tools/misc/xen-cpuid.c b/tools/misc/xen-cpuid.c
index 628e8f5aa25..9a47237f4a8 100644
--- a/tools/misc/xen-cpuid.c
+++ b/tools/misc/xen-cpuid.c
@@ -179,6 +179,11 @@ static const char *const str_7a1[32] =
     [ 4] = "avx-vnni",      [ 5] = "avx512-bf16",
 };
 
+static const char *const str_e21a[32] =
+{
+    [ 2] = "lfence+",
+};
+
 static const struct {
     const char *name;
     const char *abbr;
@@ -196,6 +201,7 @@ static const struct {
     { "0x80000008.ebx",   "e8b", str_e8b },
     { "0x00000007:0.edx", "7d0", str_7d0 },
     { "0x00000007:1.eax", "7a1", str_7a1 },
+    { "0x80000021.eax",  "e21a", str_e21a },
 };
 
 #define COL_ALIGN "18"
diff --git a/xen/arch/x86/cpu/amd.c b/xen/arch/x86/cpu/amd.c
index 9c8dcd91eef..35f22c24762 100644
--- a/xen/arch/x86/cpu/amd.c
+++ b/xen/arch/x86/cpu/amd.c
@@ -646,6 +646,13 @@ void amd_init_lfence(struct cpuinfo_x86 *c)
 {
 	uint64_t value;
 
+	/*
+	 * Some hardware has LFENCE dispatch serializing always enabled,
+	 * nothing to do on that case.
+	 */
+	if (test_bit(X86_FEATURE_LFENCE_DISPATCH, c->x86_capability))
+		return;
+
 	/*
 	 * Attempt to set lfence to be Dispatch Serialising.  This MSR almost
 	 * certainly isn't virtualised (and Xen at least will leak the real
diff --git a/xen/arch/x86/cpu/common.c b/xen/arch/x86/cpu/common.c
index e5c3caf41d5..0eb364f8a65 100644
--- a/xen/arch/x86/cpu/common.c
+++ b/xen/arch/x86/cpu/common.c
@@ -412,6 +412,9 @@ static void generic_identify(struct cpuinfo_x86 *c)
 	if (c->extended_cpuid_level >= 0x80000008)
 		c->x86_capability[cpufeat_word(X86_FEATURE_CLZERO)]
 			= cpuid_ebx(0x80000008);
+	if (c->extended_cpuid_level >= 0x80000021)
+		c->x86_capability[cpufeat_word(X86_FEATURE_LFENCE_DISPATCH)]
+			= cpuid_eax(0x80000021);
 
 	/* Intel-defined flags: level 0x00000007 */
 	if ( c->cpuid_level >= 0x00000007 ) {
diff --git a/xen/include/asm-x86/cpufeatures.h b/xen/include/asm-x86/cpufeatures.h
index d7e42d9bb6a..6c8f432aee4 100644
--- a/xen/include/asm-x86/cpufeatures.h
+++ b/xen/include/asm-x86/cpufeatures.h
@@ -24,7 +24,7 @@ XEN_CPUFEATURE(APERFMPERF,        X86_SYNTH( 8)) /* APERFMPERF */
 XEN_CPUFEATURE(MFENCE_RDTSC,      X86_SYNTH( 9)) /* MFENCE synchronizes RDTSC */
 XEN_CPUFEATURE(XEN_SMEP,          X86_SYNTH(10)) /* SMEP gets used by Xen itself */
 XEN_CPUFEATURE(XEN_SMAP,          X86_SYNTH(11)) /* SMAP gets used by Xen itself */
-XEN_CPUFEATURE(LFENCE_DISPATCH,   X86_SYNTH(12)) /* lfence set as Dispatch Serialising */
+/* Bit 12 - unused. */
 XEN_CPUFEATURE(IND_THUNK_LFENCE,  X86_SYNTH(13)) /* Use IND_THUNK_LFENCE */
 XEN_CPUFEATURE(IND_THUNK_JMP,     X86_SYNTH(14)) /* Use IND_THUNK_JMP */
 XEN_CPUFEATURE(SC_BRANCH_HARDEN,  X86_SYNTH(15)) /* Conditional Branch Hardening */
diff --git a/xen/include/public/arch-x86/cpufeatureset.h b/xen/include/public/arch-x86/cpufeatureset.h
index 42bc8d4279d..732990f2cc0 100644
--- a/xen/include/public/arch-x86/cpufeatureset.h
+++ b/xen/include/public/arch-x86/cpufeatureset.h
@@ -278,6 +278,9 @@ XEN_CPUFEATURE(SSBD,          9*32+31) /*A  MSR_SPEC_CTRL.SSBD available */
 XEN_CPUFEATURE(AVX_VNNI,     10*32+ 4) /*A  AVX-VNNI Instructions */
 XEN_CPUFEATURE(AVX512_BF16,  10*32+ 5) /*A  AVX512 BFloat16 Instructions */
 
+/* AMD-defined CPU features, CPUID level 0x80000021.eax, word 11 */
+XEN_CPUFEATURE(LFENCE_DISPATCH,    11*32+ 2) /*A  LFENCE always serializing */
+
 #endif /* XEN_CPUFEATURE */
 
 /* Clean up from a default include.  Close the enum (for C). */
diff --git a/xen/include/xen/lib/x86/cpuid.h b/xen/include/xen/lib/x86/cpuid.h
index f4ef8a9f2f0..a4d254ea96e 100644
--- a/xen/include/xen/lib/x86/cpuid.h
+++ b/xen/include/xen/lib/x86/cpuid.h
@@ -15,6 +15,7 @@
 #define FEATURESET_e8b    8 /* 0x80000008.ebx      */
 #define FEATURESET_7d0    9 /* 0x00000007:0.edx    */
 #define FEATURESET_7a1   10 /* 0x00000007:1.eax    */
+#define FEATURESET_e21a  11 /* 0x80000021.eax      */
 
 struct cpuid_leaf
 {
@@ -84,7 +85,7 @@ const char *x86_cpuid_vendor_to_str(unsigned int vendor);
 #define CPUID_GUEST_NR_TOPO       (1u + 1)
 #define CPUID_GUEST_NR_XSTATE     (62u + 1)
 #define CPUID_GUEST_NR_EXTD_INTEL (0x8u + 1)
-#define CPUID_GUEST_NR_EXTD_AMD   (0x1cu + 1)
+#define CPUID_GUEST_NR_EXTD_AMD   (0x21u + 1)
 #define CPUID_GUEST_NR_EXTD       MAX(CPUID_GUEST_NR_EXTD_INTEL, \
                                       CPUID_GUEST_NR_EXTD_AMD)
 
@@ -264,6 +265,38 @@ struct cpuid_policy
             };
             uint32_t nc:8, :4, apic_id_size:4, :16;
             uint32_t /* d */:32;
+
+            uint64_t :64, :64; /* Leaf 0x80000009. */
+            uint64_t :64, :64; /* Leaf 0x8000000a - SVM rev and features. */
+            uint64_t :64, :64; /* Leaf 0x8000000b. */
+            uint64_t :64, :64; /* Leaf 0x8000000c. */
+            uint64_t :64, :64; /* Leaf 0x8000000d. */
+            uint64_t :64, :64; /* Leaf 0x8000000e. */
+            uint64_t :64, :64; /* Leaf 0x8000000f. */
+            uint64_t :64, :64; /* Leaf 0x80000010. */
+            uint64_t :64, :64; /* Leaf 0x80000011. */
+            uint64_t :64, :64; /* Leaf 0x80000012. */
+            uint64_t :64, :64; /* Leaf 0x80000013. */
+            uint64_t :64, :64; /* Leaf 0x80000014. */
+            uint64_t :64, :64; /* Leaf 0x80000015. */
+            uint64_t :64, :64; /* Leaf 0x80000016. */
+            uint64_t :64, :64; /* Leaf 0x80000017. */
+            uint64_t :64, :64; /* Leaf 0x80000018. */
+            uint64_t :64, :64; /* Leaf 0x80000019 - TLB 1GB Identifiers. */
+            uint64_t :64, :64; /* Leaf 0x8000001a - Performance related info. */
+            uint64_t :64, :64; /* Leaf 0x8000001b - IBS feature information. */
+            uint64_t :64, :64; /* Leaf 0x8000001c. */
+            uint64_t :64, :64; /* Leaf 0x8000001d - Cache properties. */
+            uint64_t :64, :64; /* Leaf 0x8000001e - Extd APIC/Core/Node IDs. */
+            uint64_t :64, :64; /* Leaf 0x8000001f - AMD Secure Encryption. */
+            uint64_t :64, :64; /* Leaf 0x80000020 - Platform QoS. */
+
+            /* Leaf 0x80000021 - Extended Feature 2 */
+            union {
+                uint32_t e21a;
+                struct { DECL_BITFIELD(e21a); };
+            };
+            uint32_t /* b */:32, /* c */:32, /* d */:32;
         };
     } extd;
 
@@ -293,6 +326,7 @@ static inline void cpuid_policy_to_featureset(
     fs[FEATURESET_e8b] = p->extd.e8b;
     fs[FEATURESET_7d0] = p->feat._7d0;
     fs[FEATURESET_7a1] = p->feat._7a1;
+    fs[FEATURESET_e21a] = p->extd.e21a;
 }
 
 /* Fill in a CPUID policy from a featureset bitmap. */
@@ -310,6 +344,7 @@ static inline void cpuid_featureset_to_policy(
     p->extd.e8b   = fs[FEATURESET_e8b];
     p->feat._7d0  = fs[FEATURESET_7d0];
     p->feat._7a1  = fs[FEATURESET_7a1];
+    p->extd.e21a  = fs[FEATURESET_e21a];
 }
 
 static inline uint64_t cpuid_policy_xcr0_max(const struct cpuid_policy *p)
-- 
2.30.1



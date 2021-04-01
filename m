Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id DF864351578
	for <lists+xen-devel@lfdr.de>; Thu,  1 Apr 2021 16:02:22 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.104510.199957 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1lRxth-0001R4-Ay; Thu, 01 Apr 2021 14:02:09 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 104510.199957; Thu, 01 Apr 2021 14:02:09 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1lRxth-0001Qe-6l; Thu, 01 Apr 2021 14:02:09 +0000
Received: by outflank-mailman (input) for mailman id 104510;
 Thu, 01 Apr 2021 14:02:07 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=m73y=I6=citrix.com=roger.pau@srs-us1.protection.inumbo.net>)
 id 1lRxtf-0001QY-K9
 for xen-devel@lists.xenproject.org; Thu, 01 Apr 2021 14:02:07 +0000
Received: from esa6.hc3370-68.iphmx.com (unknown [216.71.155.175])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id e11e5d9c-195f-406b-83a4-be3862b1d3bf;
 Thu, 01 Apr 2021 14:02:06 +0000 (UTC)
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
X-Inumbo-ID: e11e5d9c-195f-406b-83a4-be3862b1d3bf
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=citrix.com; s=securemail; t=1617285726;
  h=date:from:to:cc:subject:message-id:references:
   in-reply-to:mime-version;
  bh=Ojivi11zgSPs6SiMidM26NiZuuczTbM1QnwxkLx85+4=;
  b=hql9pQwb9wv/zmPh7Gstm2NGo7BkHjqTyqkPVPEXbq1bErmVljC6/+lF
   yWR6sgw3NSnmDlrpwSXz7G1BC3hgYvCwUkhaqUceKENbl0EsmgxWcd5hn
   F3Ij1hnMwL4cPhxq5JKpyViJNwfk7ZbVNtXW4z4NfIOctVVx7yntQmTMw
   4=;
Authentication-Results: esa6.hc3370-68.iphmx.com; dkim=pass (signature verified) header.i=@citrix.onmicrosoft.com
IronPort-SDR: pUB+Xd9Nf3TBudUyYBo7wbkgT5b+Vrd+gPQ14L5qkn4KqsleEDh+Na53IUGLE6eLt8vigSMn36
 TqYZL5AAkfmHJ4oMZujWi56tAD93egz27HQegAdu8HqleWI+tm6ziqncJjsmfoJL/BaNooYCgT
 DFZqdqHORfTuVRzEakOPQ893T/D3AWC606c3xSJn2AAuhji6u16V3xw7Yv6MKhWskLOSLiUrkc
 hDyuakApo8HdVqIuEGVDoNOmpo5dxWuPkljJS/3SgKukcX79JTfq2DCazAqsgkboNnbRVbrcnl
 wTY=
X-SBRS: 5.2
X-MesageID: 40840366
X-Ironport-Server: esa6.hc3370-68.iphmx.com
X-Remote-IP: 162.221.156.83
X-Policy: $RELAYED
IronPort-HdrOrdr: A9a23:UcL8naivYaaT8xME4+DKJiZHTXBQX0tw3DAbvn1ZSRFFG/Gwv/
 uF2NwGyB75jysQUnk8mdaGfJKNW2/Y6IQd2+YsFJ+Ydk3DtHGzJI9vqbHjzTrpBjHk+odmuZ
 tIW5NVTOf9BV0St6vHySGlDtctx8SG+qi0heHYi0xgVx1udrsI1WZEIyywe3cGIzVuL5w/CZ
 aa+45rpyC4f24Wc8S8ARA+LpL+jvfMk4/rZgNDOg4/5GC1/EiVwZPZMzzd5BcRVDtT3awvmF
 KqryXV7riu2svLqCP0+HTU6/1t6b7c4/tFQPeBk80Ebgjr4zzYGbhJf52nkHQLrPq06FAs+e
 O80isIG8ho8XveciWUjHLWqnDd+Q0j4XPj1lOU6EGLyaeSJENYerl8rLlUfRfD500rsMsU6t
 My40uju4dKFhSFpSzh5rHzJm9Xv3Cpqnkvm/N7tQ04baIibtZq3Ogi1XIQOpIBECXm0ZsgAe
 ljAerNjcwmDm+yXjT3uHJiz8erWWl2NhCaQlIassjQ6DROmmtlpnFoifA3rzMlztYQWpNE7+
 PLPuBBk6xPdNYfaeZYCP0aScW6J2TRSXv3QS6vCGWiMJtCF2PGqpbx7rlwzvqtYoY0wJw7n4
 mEeE9EtEYpEnieSPGm7dluyFTgUW+9VTPixoV1/J5ioIDxQ7LtLGmqVE0uqc29uP8Sa/erFc
 qbCdZzObvOPGHuEYFG00nVQJ9JM0QTV8UTp5IVQFSLjsXXKpD7l+DSffrJTYCdUgoMayfaOD
 8uTTLzLMJP4gSAQXnjmiXcXHvrZwje8PtLYern1tlW7LJIGpxHswATh1j8zNqMMyd+vqs/e1
 Y7BLvml6i8tFSn5Gqg1RQtBjNtSmJupJnwWXJDogEHd2nud6wYhtmZcWdOmFyKOwF4VMGTNA
 JEvVx49eaWIvWrtG8fIuPiFljfo2oYpXqMQZtZsLaE/93ZdpQxCYtjfrdwGwXNHxlcgh1rt2
 9HVQ8BSibkZ3PToJTgqKZRKPDUdtF6jgvuC9VTs2jjuUKVotxqemEWRAe0UcmcgR8nQh1dgl
 EZyd5avJOw3RKUbUcviuUxN1NBLECaGqhPAgi+aIJIobzzYw1rQWCWhTuVtgErdgPRhjUvr1
 2kCRfRVeDAA1JbtHwd6Krs/V9uXki2fk57aBlBwMVAPFWDnkw2/f6AZ6K13WfUV0ALxfsFNi
 rZJREIJBl1+tyx3BmJuTqLGHk83K8yNujFALlLScCV5lqdbKmz0Y0WFf5d+5hocO30uugQSO
 SFZku7Kij7B+5B4X3jml8VfA1P7F8qnvPj1Ee7sCyW3HsjDeHTJ1ojbbcBON2Y53XlQfHN8J
 gRt6NBgcKAdkHKLviBwuXrShQGDDX5i2u/VfspppBZprhajso7I7DrFR/zkEha1xA/JvrunE
 wQQK5H8KnMU7UfDfA6SmZ8xB4Vj9yBI0sgjxzuDsI/dV8riWXHP9nh2cu9lZMfRmmArhD3I1
 +R7ml0+OrERTKK0dcheukNCFUTTEg383J5+uyeM6XWFQWxbulGuH63KGW0frMYaK+LH9wr31
 xHyuDNu++cbCzj3g/M+RN9P6JV6m6iBfqIPzjkI58/z/WKfXKWgqWr58avjDD4DRuDAn5o+b
 FtRAg3dcRMij4rkYst9DO9I5aH5H4Yrw==
X-IronPort-AV: E=Sophos;i="5.81,296,1610427600"; 
   d="scan'208";a="40840366"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=Rx2kTgjFNjhdZkQRbGQJJjzImCwDyPZfMXGoWfwl3cQH5lHA1/p+yDMTTHMzDFRXuL5z0bPrLowze32M8BtKccfQmJ6rYG42E2Xo+GLNrBgFlE+SzM5N3Lm7EwWr5DM0m8hhNlBe1oXQCw1F82gPnlUakz6rQ73NpwyoREyHBl7Fk5MbbtZsmq+U7KMV31MIQqbgTYtEThMeSWOWAGNtWMAYNLVvmVyMayMsF0CnKE4paEZMufzdSLrdexyg3TcEmBFfPPULT/Z8oXtbTFsvaHmoeXlzanPpUkk7k0kn5cD338yzv+lEvWlBb5buwSCFkRXFD1aPhkKuLO+EGoX4BA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=zbbjIKru2b5o3Z6Na/+GtpQrrUZlqjlPIiTbirVMMf0=;
 b=M8fMHbJDpssX0QJ8BAXJDAzAKRmz/3+EpYfiWJ/x0luB1eT+gkw9lM4ZycxbS0iPADzsFfJX8cMTZX2eRr2I2smPLWVYApe3Lb9taWvMqq5QlSXiqvYH1AEGZtRSrxxxViiM+/NoxreT1QsgavNX8RWhaV69UyJfpeRw8sXLl42zJGsJ5J5aRaa73z+ZqzA9n3wFVtEubZkRCDS3X3SZwpp1/l4MV7ltLEgvw6pDqbcxPssyFgC0kWshWm4Hif80WdxMrPcYw0CtZNbBY2VuZQYmGmY4KooVkLOod++bApaox+THT8pgqleURP3a34H3xN51pEnVLE1V7qqhIHFMBA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=citrix.com; dmarc=pass action=none header.from=citrix.com;
 dkim=pass header.d=citrix.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=citrix.onmicrosoft.com; s=selector2-citrix-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=zbbjIKru2b5o3Z6Na/+GtpQrrUZlqjlPIiTbirVMMf0=;
 b=BaPnM4iAkmvGeoeTobmqbw4d9h5F10AkhzAlmCLXC+lZY4FvZjMAcsdUt9ezSrNd9+rvXA9WRjzF04NKQyop+KAwtqrqqiFjdIsIUrnTJCACPHlRhu428WQHV7buxvhvZlgVp8s1vjyKrxumvi+T6b+gjqtYvzuCFsHVJxrPFwc=
Date: Thu, 1 Apr 2021 16:01:55 +0200
From: Roger Pau =?utf-8?B?TW9ubsOp?= <roger.pau@citrix.com>
To: Jan Beulich <jbeulich@suse.com>
CC: "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>, Andrew
 Cooper <andrew.cooper3@citrix.com>, Wei Liu <wl@xen.org>
Subject: Re: [PATCH 5/5] x86: don't build unused entry code when !PV32
Message-ID: <YGXSU9lGZpidz9wb@Air-de-Roger>
References: <46d83c92-0b06-fc09-4832-7a7d7935d5c2@suse.com>
 <d417d3f9-3278-ed08-1ff6-45a13b5e3757@suse.com>
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <d417d3f9-3278-ed08-1ff6-45a13b5e3757@suse.com>
X-ClientProxiedBy: MR2P264CA0017.FRAP264.PROD.OUTLOOK.COM
 (2603:10a6:500:1::29) To DS7PR03MB5608.namprd03.prod.outlook.com
 (2603:10b6:5:2c9::18)
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 492eb4b6-0fda-4339-c6f7-08d8f516b858
X-MS-TrafficTypeDiagnostic: DS7PR03MB5607:
X-MS-Exchange-Transport-Forked: True
X-Microsoft-Antispam-PRVS: <DS7PR03MB5607545BE4F124DA3EBCD2408F7B9@DS7PR03MB5607.namprd03.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:8273;
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: ChL8GmfosG4MLd+gK+HNQMmjDO6qZAs36rUQMnuZs30o3cruMZ9p2b7f7wyhWGWvDi19IwSUF3jsGp58gVvFd1yopw8ZD65YJRRYgAxFTAWf+yN4o3LiqT6HEuvzYFtIbaonk48tOgNiI/2xthQBXEu8t/UE3Q1AgXkvthtByqtvSxF3avnIn4/6Ip0rg8tmqf5iTA8DTV8vDCaEnAPa3wytedPaxtVI0/iXHGLaerSMPq2Q7ffk2ZAe3A4SUUDvEZxr+OblxsnV0SqUIVdfJCO8luzPC4QaDycExSbwPdE1vFwsaM2Pnsbi3sm4KHfyKdqnRxIuOZIRjSmjPLw5uj+tkXRqPZRwHnvqysoyfSmsfsLOWx4m/OWOTGSXzQBefGnrQnORL7ipDqSXnHCBXQpznsxjqrSU8031I6qpZyDaPckp/+jPd5lT8JepC6wzb0xyUsXMEPF8mBS27/mcpV2wLp9/iNbGUq4d4cnD5TGF4kW8PMAsuinxI02CnKg+8+rAIqvKT9s1l+jS4ZWE36rDTtWHuk3mS4nF3pdWIuP0nyQ8UMzD1CAcVwOt4ovRBCwDKflMzgGkEzlMCrFNyqO76LKjpZScHUgBXJDzbD8H3NQN2QOITFuiX4GZcPMnD2ZZZKCg4W48xdVz2id5K19iDlrGBAZU82BpNdt6R+g=
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DS7PR03MB5608.namprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(7916004)(4636009)(346002)(39860400002)(136003)(396003)(366004)(376002)(8936002)(5660300002)(956004)(54906003)(66946007)(316002)(6496006)(478600001)(26005)(38100700001)(4326008)(2906002)(186003)(33716001)(83380400001)(85182001)(6486002)(16526019)(8676002)(86362001)(6666004)(9686003)(6916009)(66556008)(66476007);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData: =?utf-8?B?bFQyYW9QbWxEN1FCbnd3RCtLMGdUYzF1UUtxbjJ5WlNFRE5ZYlV0T1NqL1NU?=
 =?utf-8?B?YlVmSm8wUWdLc0FPYlpRc3p0MkJsVU9WeHhYWGM1TU9uT0VHUXVqbnE3cjZQ?=
 =?utf-8?B?eDEzdFQ5YU1Hb1daM2pGNzZ0WHBUZzhuYWtrWnBIWFVsZWROeHJwbWhKR0JR?=
 =?utf-8?B?UDFXUHBQbWRXd01lWGtCMThqUlh5RnE5eFJhV1RUZjFjQmdvRm82RDhMY1Zq?=
 =?utf-8?B?RG1tUExtZTJHOVhkbitOa2hTN3lCY1VNMUJITnNVVGJCYWZHVUM0LzVpQm1x?=
 =?utf-8?B?Qmk2TW9iUDErcHVnS3FwNXRFSCtoakNTV2VLL3dFMmtnQnNlR21pWkZydnVF?=
 =?utf-8?B?TVhHNnpsYzU1MS9GNk1jTkFGbXMycy9hU1pjaVNuSHFrTU13anhVNGRvMXpX?=
 =?utf-8?B?a3FMTXhCaVRObzlObTNwK0M5MzZabEZoWjlOd2hKaE1JcmJCcGgxb0VqYnBh?=
 =?utf-8?B?U1hjblA1dWdpdGV5TkJ0a050ZGVEc1lpNU1HK1ZYd1Z0VXE4UmdwWEZOcGFD?=
 =?utf-8?B?UlVNUGdSdzNZTVpwWExib21FMktDeGJiMUVoZ2VZZUxYSnFYcHlsOXczZTJC?=
 =?utf-8?B?K2JyWTBjMWVnQXlqbUNyZWp0aTNnaU5XUmFJU3dTeHhNTlAvYk9kbnNoQjNX?=
 =?utf-8?B?bC9uUTlRaWtSVFpIWitvdUlxSldDZU5UcThWQkhHUmVyazc3STZwN2h3N1pV?=
 =?utf-8?B?UGptRC9EbGROSURLVHZiWHB2ZUdML3JmSXZIckYrNzBnTTZKWTc2Z3pVUlZ5?=
 =?utf-8?B?eTRtTEVWS1VLMEdUMmdpeGxrcFJ0bFMwODlrWW15Wnp3cVB5bDllTDEyajNB?=
 =?utf-8?B?cjhVc3pnell5UnhkdDV0RVYxK3BNcUVvSHhhaWxUYVRVY0NwSFRyNEdoWHhZ?=
 =?utf-8?B?YlE4SVU4R2wzWThTenJyNkp0SE1oRzl0K2VDOS9yU0gvbjNmZ0JIZkVEU0ho?=
 =?utf-8?B?Mi9WN01Hc1FBcGI0a0RiWEtzL1VpOTJUMytKY3p2WkFhYTdKY2lITHQwRW5N?=
 =?utf-8?B?MS9mY1I0a2htQTZtSFJTdkM2Q3BodVJEQllmbU5xdHJrK2hvSGNic1lybU5R?=
 =?utf-8?B?VU5PclpRWmV0d0lyQk5PZVVqbHZGKytleDRMN256bjR0TmNDdzBTK0lUajBM?=
 =?utf-8?B?Nk5zbkdJMzc5MWd2QmFjazU3SlZoejJab2w4M3BCRFZQSzJObk9CWGlFSWxE?=
 =?utf-8?B?cVdlaWkvaE8vbDViMW9XR0N4dVh5SVhya3UwSWZrRjZVNDh0Q0N3VUw5cDMv?=
 =?utf-8?B?Zi9zY1paS290TktnTmw3TDdtQzZTM1FVVDREZFhma3NuKzFyZmtscmZZcExq?=
 =?utf-8?B?K3pHR25QOFVkV0UzaE12NU9CZ3EvUmM0U2Y4MmY1WWp5UEszSnR4UU1mNmlF?=
 =?utf-8?B?REdqSUdkTmxSOVZDYnVPblY0K2wycnpCc1k3NkNXL3dwejNtejhWMjFrSEtP?=
 =?utf-8?B?ZWRoYWc0VjJyMmJUZFJsL3Y2UTNLYjdUUXYrL2lIblVXeUhHL0MzTmxIUWR1?=
 =?utf-8?B?cHVCekZTRmJqcmYxVEVGN0RlTER4bmZhZnVJUlh3Q2N5QlZneEtjMHN3UlEw?=
 =?utf-8?B?L1h6eHAxbmdiTzNiU0tVekExOWtQaWFadnNmVVVNMDlzR05YbEFpSjI0U1BO?=
 =?utf-8?B?cmtPNXRVSEc1WDUzWFZwZkpVdHFJS1U3eStwYWMvMk16L3dzR0t2YmN2TzIw?=
 =?utf-8?B?a1F0QjFvUDd4OTBaSVNzbjlEc3JlRnlnTTVIakV0Y3F0VFhNeng4bzhKaHlz?=
 =?utf-8?Q?a9clT509jVk1Z26zABrzhT5HfP+3DpfrDSzpX+h?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 492eb4b6-0fda-4339-c6f7-08d8f516b858
X-MS-Exchange-CrossTenant-AuthSource: DS7PR03MB5608.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 01 Apr 2021 14:02:00.7689
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 335836de-42ef-43a2-b145-348c2ee9ca5b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: e2WWikv0hpmL6FUV+IRY24s2TjkHl3aurhCMJBbyCHn8zmg08aPUVInUGj9TqMhXHafkPJXt6NZYzVDdGHUv4w==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DS7PR03MB5607
X-OriginatorOrg: citrix.com

On Wed, Nov 25, 2020 at 09:51:33AM +0100, Jan Beulich wrote:
> Except for the initial part of cstar_enter compat/entry.S is all dead
> code in this case. Further, along the lines of the PV conditionals we
> already have in entry.S, make code PV32-conditional there too (to a
> fair part because this code actually references compat/entry.S).
> 
> Signed-off-by: Jan Beulich <jbeulich@suse.com>
> ---
> TBD: I'm on the fence of whether (in a separate patch) to also make
>      conditional struct pv_domain's is_32bit field.
> 
> --- a/xen/arch/x86/x86_64/asm-offsets.c
> +++ b/xen/arch/x86/x86_64/asm-offsets.c
> @@ -9,7 +9,7 @@
>  #include <xen/perfc.h>
>  #endif
>  #include <xen/sched.h>
> -#ifdef CONFIG_PV
> +#ifdef CONFIG_PV32
>  #include <compat/xen.h>
>  #endif
>  #include <asm/hardirq.h>
> @@ -102,19 +102,21 @@ void __dummy__(void)
>      BLANK();
>  #endif
>  
> -#ifdef CONFIG_PV
> +#ifdef CONFIG_PV32
>      OFFSET(DOMAIN_is_32bit_pv, struct domain, arch.pv.is_32bit);
>      BLANK();
>  
> -    OFFSET(VCPUINFO_upcall_pending, struct vcpu_info, evtchn_upcall_pending);
> -    OFFSET(VCPUINFO_upcall_mask, struct vcpu_info, evtchn_upcall_mask);
> -    BLANK();
> -
>      OFFSET(COMPAT_VCPUINFO_upcall_pending, struct compat_vcpu_info, evtchn_upcall_pending);
>      OFFSET(COMPAT_VCPUINFO_upcall_mask, struct compat_vcpu_info, evtchn_upcall_mask);
>      BLANK();
>  #endif
>  
> +#ifdef CONFIG_PV
> +    OFFSET(VCPUINFO_upcall_pending, struct vcpu_info, evtchn_upcall_pending);
> +    OFFSET(VCPUINFO_upcall_mask, struct vcpu_info, evtchn_upcall_mask);
> +    BLANK();
> +#endif
> +
>      OFFSET(CPUINFO_guest_cpu_user_regs, struct cpu_info, guest_cpu_user_regs);
>      OFFSET(CPUINFO_verw_sel, struct cpu_info, verw_sel);
>      OFFSET(CPUINFO_current_vcpu, struct cpu_info, current_vcpu);
> --- a/xen/arch/x86/x86_64/compat/entry.S
> +++ b/xen/arch/x86/x86_64/compat/entry.S
> @@ -29,8 +29,6 @@ ENTRY(entry_int82)
>          mov   %rsp, %rdi
>          call  do_entry_int82
>  
> -#endif /* CONFIG_PV32 */
> -
>  /* %rbx: struct vcpu */
>  ENTRY(compat_test_all_events)
>          ASSERT_NOT_IN_ATOMIC
> @@ -197,6 +195,8 @@ ENTRY(cr4_pv32_restore)
>          xor   %eax, %eax
>          ret
>  
> +#endif /* CONFIG_PV32 */
> +
>          .section .text.entry, "ax", @progbits
>  
>  /* See lstar_enter for entry register state. */
> @@ -230,6 +230,13 @@ ENTRY(cstar_enter)
>          sti
>  
>          movq  STACK_CPUINFO_FIELD(current_vcpu)(%rbx), %rbx
> +
> +#ifndef CONFIG_PV32
> +
> +        jmp   switch_to_kernel
> +
> +#else
> +
>          movq  VCPU_domain(%rbx),%rcx
>          cmpb  $0,DOMAIN_is_32bit_pv(%rcx)
>          je    switch_to_kernel
> @@ -393,3 +400,5 @@ compat_crash_page_fault:
>          jmp   .Lft14
>  .previous
>          _ASM_EXTABLE(.Lft14, .Lfx14)
> +
> +#endif /* CONFIG_PV32 */

Seeing this chunk, would it make sense to move the cstar_enter part
relevant to !is_32bit_pv into the common entry.S and leave the rest
here as compat_cstar_enter or some such?

AFAICT we only need a tiny part of the compat stuff when !CONFIG_PV32,
so I think we could make the hole compat/entry.S depend on
CONFIG_PV32.

Thanks, Roger.


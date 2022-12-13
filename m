Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 34D9564B9D3
	for <lists+xen-devel@lfdr.de>; Tue, 13 Dec 2022 17:33:06 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.460896.718944 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1p58Cr-0000wV-SL; Tue, 13 Dec 2022 16:32:37 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 460896.718944; Tue, 13 Dec 2022 16:32:37 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1p58Cr-0000uT-Mx; Tue, 13 Dec 2022 16:32:37 +0000
Received: by outflank-mailman (input) for mailman id 460896;
 Tue, 13 Dec 2022 16:32:36 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=mGeL=4L=citrix.com=prvs=339e21e18=roger.pau@srs-se1.protection.inumbo.net>)
 id 1p58Cp-0008Sb-VQ
 for xen-devel@lists.xenproject.org; Tue, 13 Dec 2022 16:32:36 +0000
Received: from esa1.hc3370-68.iphmx.com (esa1.hc3370-68.iphmx.com
 [216.71.145.142]) by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id bddf442b-7b03-11ed-8fd2-01056ac49cbb;
 Tue, 13 Dec 2022 17:32:33 +0100 (CET)
Received: from mail-dm6nam11lp2169.outbound.protection.outlook.com (HELO
 NAM11-DM6-obe.outbound.protection.outlook.com) ([104.47.57.169])
 by ob1.hc3370-68.iphmx.com with ESMTP/TLS/ECDHE-RSA-AES128-GCM-SHA256;
 13 Dec 2022 11:32:30 -0500
Received: from SJ0PR03MB6360.namprd03.prod.outlook.com (2603:10b6:a03:395::11)
 by CO3PR03MB6791.namprd03.prod.outlook.com (2603:10b6:303:175::17)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5880.19; Tue, 13 Dec
 2022 16:32:26 +0000
Received: from SJ0PR03MB6360.namprd03.prod.outlook.com
 ([fe80::740b:4e0a:7de4:5ab1]) by SJ0PR03MB6360.namprd03.prod.outlook.com
 ([fe80::740b:4e0a:7de4:5ab1%9]) with mapi id 15.20.5880.019; Tue, 13 Dec 2022
 16:32:26 +0000
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
X-Inumbo-ID: bddf442b-7b03-11ed-8fd2-01056ac49cbb
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=citrix.com; s=securemail; t=1670949153;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:content-transfer-encoding:mime-version;
  bh=sMuxSnFpNQrAkbbLtQpLS0YoQ8ak+oc74VRZ4eqVs+c=;
  b=g4/VOi0DJm2RfEvNLG9UkpoIfM/rA1pJsrdVACFNcw91dfq3STde5kFS
   HB53k4vZq3iXpk16lLGlEt6TdOppXG/0cz6zVmML5PvpYheJSEIFJNTFi
   3WPUXtsEnmBDueSZY2fw82Ci0GwDERY0OPOqxA3j2CYiNhTvBY21/z8rO
   I=;
X-IronPort-RemoteIP: 104.47.57.169
X-IronPort-MID: 88555885
X-IronPort-Reputation: None
X-IronPort-Listener: OutboundMail
X-IronPort-SenderGroup: RELAY_O365
X-IronPort-MailFlowPolicy: $RELAYED
IronPort-Data: A9a23:e3M/Iaubevy4kw3wfLubK0HIzefnVKtfMUV32f8akzHdYApBsoF/q
 tZmKW/TOPqIN2vxco9za4638k8OvMLWyN5mGgJk+SBnES4W+JbJXdiXEBz9bniYRiHhoOCLz
 O1FM4Wdc5pkJpP4jk3wWlQ0hSAkjclkfpKlVKiffHg0HVU/IMsYoUoLs/YjhYJ1isSODQqIu
 Nfjy+XSI1bg0DNvWo4uw/vrRChH4bKj5lv0gnRkPaoR5QWHzCFPZH4iDfrZw0XQE9E88tGSH
 44v/JnhlkvF8hEkDM+Sk7qTWiXmlZaLYGBiIlIPM0STqkAqSh4ai87XB9JFAatjsB2bnsgZ9
 Tl4ncfYpTHFnEH7sL91vxFwS0mSNEDdkVPNCSDXXce7lyUqf5ZwqhnH4Y5f0YAwo45K7W9yG
 fMwN2EfSgCJm/2Pm7+cVeA9v8sEFMbqBdZK0p1g5Wmx4fcOZ7nmGvyPyfoGmTA6i4ZJAOrUY
 NcfZXx3dhPcbhZTO1ARTpUjgOOvgXq5eDpdwL6XjfNvvy6Pk0osj/60bou9lt+iHK25mm6Co
 W3L5SLhCwwyP92D0zuVtHmrg4cjmAurCN9PSe3oq5aGhnXUxFIIFAM2XGKH/6GHtFa7BfsDG
 WY9r39GQa8asRbDosPGdw21pjuIswARX/JUEvYm80edx6zM+QGbC2MYCDlbZ7QOtsU7WDgr3
 V+hhM7yCHpkt7j9YXCA8raZqxuiNC5TKnUNDQcfVhcM6dTnpIA1jzrMQ8xlHarzicf6cRnvx
 xiaoS54gK8c5eYJyqP9+1nEijCto5HhTwgp6wGRVWWghit6aZCkYcq06FHdxfdGMIudCFKGu
 RA5d9O26ekPCdSBkXKLSeBURbWxva/bYXvbnEJlGIQn+3K14Xm/cItM4TZ4YkB0LsIDfjyva
 0jW0e9M2KJu0LKRRfcfS+qM5w4ClMAMyfyNuijoU+dz
IronPort-HdrOrdr: A9a23:GDlBVKEzl45v1kSNpLqENMeALOsnbusQ8zAXPiFKOGdom6mj/P
 xG88506faZslsssTIb6LS90dC7IE80rKQU3WBzB8bBYOCFghrREGgK1+KLqQEIfReOk9K1vp
 0OT0ERMrHN5BdB/KHHCaSDYrAd6cjC2pqBwc3Zy25pTQlsYa0l1QFkEQyWe3cGJzWuQaBJba
 ah2g==
X-IronPort-AV: E=Sophos;i="5.96,241,1665460800"; 
   d="scan'208";a="88555885"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=gAaWQ9K/uLG4tD/iYgsrQ6QAXsPeXvJO7XKGD/9zYaeu5hPRFfja7NacxtYXfZUyJerEGSRnCsHHMw+mqaBz0KNcN5D+KjIKW6ep31e49uTUw+PwOEj6dHTiRyYGyC7lMr8YhE5B6W+7x1eIFlUeW2use6IhFyDLcvPAVaphNTyZwhihxdzd5MquBL6Tn4lOuytKxAAyzoCgZfOdVIc8WF0XCtJjOvNUuV8JZWU/HQyx0rxi6Oj2MpWgtGUJTFjswSZl/hPESebtiU/el4Pz7YfA6cOFIFJW14U9XykL0z2Gduj1bq0fbTHbc86Li3Vh5Z8gOeo3ic1lZHzb+06XLg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=Rd68Qyv0Xcs0YjD78x9OxU/cmhG5hpGT4Fa+ZPnIUaU=;
 b=FrJbQs3UHdNOdSrWScuDO1/hkvJSyt6xANtwlMfevjlvMQvX/MWVGAoAsVfysiEJK2AqLDvIpAFO3kNTLTajlOOav61MtqjbrbXRglGLkc308OiKmGgLcvFIOladNBkpMaQcLNiORe3FhykwpP//W3HSgPZQm6bBJPcvWzVIr7kOICJV/bzBzrnfPppnXB32x0OS8yJQGkzlY6beyJ1ivkNqA/BmogwTCCHgGY4F1Bi15UEdLIYK9smPHnbAOBg1JKp2oQgROEKWDek2xB23/GM3rhjdCYxfH2Q64MIkyzYVkR+Ksml/pSKWH+G7XsKPJUiRJ5qaaRnPEVELP/Oguw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=citrix.com; dmarc=pass action=none header.from=citrix.com;
 dkim=pass header.d=citrix.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=citrix.onmicrosoft.com; s=selector2-citrix-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=Rd68Qyv0Xcs0YjD78x9OxU/cmhG5hpGT4Fa+ZPnIUaU=;
 b=BHY4FmENRs/YCV6kdSpCjmp7wWLVTFp3MOowaiBWwmLiJIMxFUkjI9U4mGzt+olBGU6MWHhZiIY9Ml6sKjYK3QTzvPvPHSGFNiScJt4xdGNbMn/PkPKKdRcBDWie24r4tbcgwnNezh2THZXE34762JZFYUrXtS6eI3SeYvdyUtE=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=citrix.com;
From: Roger Pau Monne <roger.pau@citrix.com>
To: xen-devel@lists.xenproject.org
Cc: Roger Pau Monne <roger.pau@citrix.com>,
	Andrew Cooper <andrew.cooper3@citrix.com>,
	George Dunlap <george.dunlap@citrix.com>,
	Jan Beulich <jbeulich@suse.com>,
	Julien Grall <julien@xen.org>,
	Stefano Stabellini <sstabellini@kernel.org>,
	Wei Liu <wl@xen.org>,
	Jun Nakajima <jun.nakajima@intel.com>,
	Kevin Tian <kevin.tian@intel.com>
Subject: [PATCH v4 3/3] x86/vmx: implement Notify VM Exit
Date: Tue, 13 Dec 2022 17:31:04 +0100
Message-Id: <20221213163104.19066-4-roger.pau@citrix.com>
X-Mailer: git-send-email 2.39.0
In-Reply-To: <20221213163104.19066-1-roger.pau@citrix.com>
References: <20221213163104.19066-1-roger.pau@citrix.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: LO2P265CA0146.GBRP265.PROD.OUTLOOK.COM
 (2603:10a6:600:9::14) To SJ0PR03MB6360.namprd03.prod.outlook.com
 (2603:10b6:a03:395::11)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: SJ0PR03MB6360:EE_|CO3PR03MB6791:EE_
X-MS-Office365-Filtering-Correlation-Id: 0c00f314-15d2-4509-cab1-08dadd279ea8
X-LD-Processed: 335836de-42ef-43a2-b145-348c2ee9ca5b,ExtAddr,ExtFwd
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	9uX97OJgu2pA8uMKGN7UlFn6B9aSnaZ4OZWYUb3iRE7Z7wYWTn+4jQVUL/BPjAsyENURFBaQ2jZFBMuIggwkvi3WGKngvk1fV44Jm916vNpCjCxCPoGFhAJGZ2fVqLroOLw0wqfSPzdmNQp1n/z5OChdSiZsSCTg7Qxb4Zk84d8RnCeGj+wfAQfKvqklamtxM9fT/wcWzkEz/tng37tTFcLUSxjubMHYzqWGGbYVlsG5MXvkIVXf53AIr6ifngw+gG3ZO6VqsflcSgKd2IdnU8ET3eVqOcCHTgmqON3DlZK55Ftv8y07NKo/4C3SVQ8qx7yiKWqA/tlhHYK63/fDEzrPJah4Y9edr8Q5s+rB/4Tf8bbCppnzg0qYZJ9TzvvEGUGZ4cjfsIrEFiF0plFnD/gIrqPI3MMjr+s6C5RvWl3xRYGqIG60OgfdhCEbtUpS8NC2FTW1cAzL0Bs3jesrNUvUiH5regbtMw4wWB7UXDEKNjrOHNVGy8aSjb2khIgWbPL9H8HECh/QcJ8EXUVD0v4QKCJzpPuobPElHZh5pFBgHX0v0Hmk9kk6F2uI7Fjiqv5DL9cr3jhxZPn/26wGLopHgJmweiOY/bhYpCBr1DGJjzc5wRqEH79woPIoI5Ox0mWypQ8L9mZkwnG2UZ75Qw==
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:SJ0PR03MB6360.namprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230022)(4636009)(376002)(346002)(39860400002)(396003)(366004)(136003)(451199015)(38100700002)(7416002)(82960400001)(5660300002)(86362001)(478600001)(2906002)(6486002)(41300700001)(6666004)(83380400001)(66946007)(6916009)(6506007)(66476007)(316002)(8936002)(4326008)(54906003)(186003)(6512007)(26005)(1076003)(8676002)(66556008)(2616005)(36756003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?b0wxRUc2bHJYLzcwNnJqcjdWMUdiRXhWRXhsbW9vdVhyQVJIL01kYjBKQzZI?=
 =?utf-8?B?QUd2a3FpQW5obnhVb0R6TFNjd0prRHRmODRkRFluQzhleXFrR1N5azE3QTFa?=
 =?utf-8?B?UjhBbXE0NE1mZ0d3aXFicXBKYXhIcHhyUG9OV1RhM1ZPRDVqNXJyUGVidEdr?=
 =?utf-8?B?d1dYVk1xRndaWTI2aS9aVTJXVlJ4Yml5eGI5VFJJc3dIY0NBY1E3ZGs0RHgw?=
 =?utf-8?B?bHo3N1VROGFkNUlEMGdHa0lZRG9PMExSbWNIMlFXTzdlaEhYS2p1eGdBZTdX?=
 =?utf-8?B?ajNMeGY1TUlIV2pIQXZSRnlsaHZ2MmdwejlQMU5ZUmp4U2VHRDNneERNRGtQ?=
 =?utf-8?B?SWpHemtFclZtR0FxVE1vNjlXWlNXNlYrSGtvRG8zUGJmSjlxZ0pabVRaTVhE?=
 =?utf-8?B?S0JPMHNwNEplVE8vWVBESDNKWThDc2REUVlPTm0rbzZJeGhtSnZGREUvTHdi?=
 =?utf-8?B?VDhpZnUrMzNZZUM5TVhITkw5MlVJaVNuS2lGR1BEb1JuK1ZkbjR0U2NOZDNQ?=
 =?utf-8?B?RTRlYmUyZ3FCTjlMUUNGYjhTSkw1ajYrTlg3eVZ2YVlFTnV4WVMzZ1c4a1M3?=
 =?utf-8?B?ak90TXVVR2VyT0Z4N2NsZlpWd3hMWGZHRUtHQkhQY0dLbGNtYnlScGpNK29w?=
 =?utf-8?B?VktabUVONjhhZ3RDbHhGWTdJMHMxOVJBK25Bc0kyVU5Ud2htYWdKSUk4TEVN?=
 =?utf-8?B?UDlGbGh6WW5XOGVpTmoxNDFSS0ZFeGhmN2lRNTFNMnZrU2xDb2QzMUJiSDF2?=
 =?utf-8?B?L0gydmxWV1JmeFM3amt2UW9keHpLQWU2ZFZCWWhNYkpjQm93b0x1dncrM3pp?=
 =?utf-8?B?OXhZOCtpZnJTOC9kdWFFS2lYQlNheWtrQ3FIUWtOMm8yeURyK0JhbENmVkJq?=
 =?utf-8?B?alhKTSs0NkkrSThSOXRXUVhXMzBiV0ZpS3RyZEF4YWxtN3puTmtuOGlSeDI1?=
 =?utf-8?B?YkhUcmRJcGcxbVB5aHkvdnR3N29xR0dxa3BxTzJvMGNHbWx4ZE5pQ1NLaTcx?=
 =?utf-8?B?cXpDRWxjM0NNM1h6V1hNY0Y2WXNmUVRMVmNJajFjWWYyb04xWFV1TFF4V1BN?=
 =?utf-8?B?UU5Wem55dHpHT0plVHlPQ01jTGo2TW5GL2hkeFpxR1NuYTZrQ21ORU9JcXdO?=
 =?utf-8?B?Y001elltc2RWaGhzZXpGR29LT1UveHlYQmlYeHl6YmU0UENueWI0dzdyUG85?=
 =?utf-8?B?OE9zKzR1ZUhaOWZHeTN0cWJSUm9XRHI2YWNJVTlleXdXU2dlQXhmcUVwaDds?=
 =?utf-8?B?Q080WmpWQTl2dG1hcmV6WlUvbEdnWVluOWpxRjVVeTI2c2EzcU5JRE13WDFZ?=
 =?utf-8?B?dGhobGVpemJEV3Bta1M1cVZZSStId0hRbHAydGJSYlZoaGFNcmw1ZWhyWVcr?=
 =?utf-8?B?R2xSaUdJa1dWVG1Eam9SMi9FakVlK0RiaUdNSTdmREFsbFRJQUNybjBjV0Vo?=
 =?utf-8?B?bGxzaEFjT0pTTHI4ZFdqRVNPdDQzM3VMaktzeGpXSHVFZFRIa3lkUmJwZFF5?=
 =?utf-8?B?eENyRjRDMklJNHplK0lyWjA5RXUxb24wdEhVMkQyUE5yYUNrTkJPKzhkSEZs?=
 =?utf-8?B?RTVjVDV3T1l2Zkg4eWtiYnFqZDlyZ3BjelBabktVVG5aOG4rUEhEYTQzaEdq?=
 =?utf-8?B?WXVCaE9HczNIWlZjYUxlVW5kU2RuK01PUHlteG1FdFR6MDUybHE4aEV5STRY?=
 =?utf-8?B?N3F1V3VmQ291d0cyZFJrN1o0a1NIbXpCdmNnQkR6VUlOL2xQYXBUTmtiSWlN?=
 =?utf-8?B?T3I4VzQzODZjZTNhcE9kWjJmQjhDSVNTNVlzZXRLa0VoSnBvNmE1a3oxaUpj?=
 =?utf-8?B?Q0psN3VmTEpOc2x4VThaWU5obHRQR2lXdnJBZ29qTmxxN2VPWFp3dWNlRTJm?=
 =?utf-8?B?MXREd0JwZFVSZ2p3TkJQb3BJT0JKdDZ4NVhaRzhKTjU4TlpJUDhpL1FrL3JU?=
 =?utf-8?B?MTUxOU9TbWFnVTFKUGZzSnVzeDN4TkMvazY2akViWGxpZmw2NnRvZTdIR2dO?=
 =?utf-8?B?U3A3S1JlSFF5dU8wMTFFSlRzSzlGM0FidFNnMllLUUxlbDFIL2V6ejBEUEd6?=
 =?utf-8?B?eDM2YlpFR09LSFFDZkdoLzBFSWtqZW5vdlZhVEtFbjkyL1FIOGFTZmZHanR0?=
 =?utf-8?B?UmgzZ0JJYVFXcVBSZXYzRXNVMkxuT2h1WUxIclg0QjEyMktyK21DaU1ITXNB?=
 =?utf-8?B?QlE9PQ==?=
X-OriginatorOrg: citrix.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 0c00f314-15d2-4509-cab1-08dadd279ea8
X-MS-Exchange-CrossTenant-AuthSource: SJ0PR03MB6360.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 13 Dec 2022 16:32:26.4327
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 335836de-42ef-43a2-b145-348c2ee9ca5b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: akwhcQSgkspBXIBb49+xI/k3y5c6/HsDwGcegpE/B8qbyHuoyc5SHKsOqEgqnMIPmKFadMnPPD9L2E0AiO5qGg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CO3PR03MB6791

Under certain conditions guests can get the CPU stuck in an unbounded
loop without the possibility of an interrupt window to occur on
instruction boundary.  This was the case with the scenarios described
in XSA-156.

Make use of the Notify VM Exit mechanism, that will trigger a VM Exit
if no interrupt window occurs for a specified amount of time.  Note
that using the Notify VM Exit avoids having to trap #AC and #DB
exceptions, as Xen is guaranteed to get a VM Exit even if the guest
puts the CPU in a loop without an interrupt window, as such disable
the intercepts if the feature is available and enabled.

Setting the notify VM exit window to 0 is safe because there's a
threshold added by the hardware in order to have a sane window value.

Note the handling of EXIT_REASON_NOTIFY in the nested virtualization
case is passed to L0, and hence a nested guest being able to trigger a
notify VM exit with an invalid context would be able to crash the L1
hypervisor (by L0 destroying the domain).  Since we don't expose VM
Notify support to L1 it should already enable the required
protections in order to prevent VM Notify from triggering in the first
place.

Suggested-by: Andrew Cooper <andrew.cooper3@citrix.com>
Signed-off-by: Roger Pau Monné <roger.pau@citrix.com>
Reviewed-by: Kevin Tian <kevin.tian@intel.com>
---
Changes since v3:
 - Handle the exit reason in nvmx_n2_vmexit_handler().
 - Use unlikely.
 - Expand commit message.

Changes since v2:
 - Move up the logic to set the exception bitmap in construct_vmcs().
 - Change perfcounter description.

Changes since v1:
 - Properly update debug state when using notify VM exit.
 - Reword commit message.
---
 docs/misc/xen-command-line.pandoc       | 11 +++++++++
 xen/arch/x86/hvm/vmx/vmcs.c             | 17 +++++++++++++
 xen/arch/x86/hvm/vmx/vmx.c              | 32 +++++++++++++++++++++++--
 xen/arch/x86/hvm/vmx/vvmx.c             |  1 +
 xen/arch/x86/include/asm/hvm/vmx/vmcs.h |  4 ++++
 xen/arch/x86/include/asm/hvm/vmx/vmx.h  |  6 +++++
 xen/arch/x86/include/asm/perfc_defn.h   |  3 ++-
 7 files changed, 71 insertions(+), 3 deletions(-)

diff --git a/docs/misc/xen-command-line.pandoc b/docs/misc/xen-command-line.pandoc
index b7ee97be76..923910f553 100644
--- a/docs/misc/xen-command-line.pandoc
+++ b/docs/misc/xen-command-line.pandoc
@@ -2636,6 +2636,17 @@ guest will notify Xen that it has failed to acquire a spinlock.
 <major>, <minor> and <build> must be integers. The values will be
 encoded in guest CPUID 0x40000002 if viridian enlightenments are enabled.
 
+### vm-notify-window (Intel)
+> `= <integer>`
+
+> Default: `0`
+
+Specify the value of the VM Notify window used to detect locked VMs. Set to -1
+to disable the feature.  Value is in units of crystal clock cycles.
+
+Note the hardware might add a threshold to the provided value in order to make
+it safe, and hence using 0 is fine.
+
 ### vpid (Intel)
 > `= <boolean>`
 
diff --git a/xen/arch/x86/hvm/vmx/vmcs.c b/xen/arch/x86/hvm/vmx/vmcs.c
index a0d5e8d6ab..3d7c471a3f 100644
--- a/xen/arch/x86/hvm/vmx/vmcs.c
+++ b/xen/arch/x86/hvm/vmx/vmcs.c
@@ -67,6 +67,9 @@ integer_param("ple_gap", ple_gap);
 static unsigned int __read_mostly ple_window = 4096;
 integer_param("ple_window", ple_window);
 
+static unsigned int __ro_after_init vm_notify_window;
+integer_param("vm-notify-window", vm_notify_window);
+
 static bool __read_mostly opt_ept_pml = true;
 static s8 __read_mostly opt_ept_ad = -1;
 int8_t __read_mostly opt_ept_exec_sp = -1;
@@ -210,6 +213,7 @@ static void __init vmx_display_features(void)
     P(cpu_has_vmx_pml, "Page Modification Logging");
     P(cpu_has_vmx_tsc_scaling, "TSC Scaling");
     P(cpu_has_vmx_bus_lock_detection, "Bus Lock Detection");
+    P(cpu_has_vmx_notify_vm_exiting, "Notify VM Exit");
 #undef P
 
     if ( !printed )
@@ -329,6 +333,8 @@ static int vmx_init_vmcs_config(bool bsp)
             opt |= SECONDARY_EXEC_UNRESTRICTED_GUEST;
         if ( opt_ept_pml )
             opt |= SECONDARY_EXEC_ENABLE_PML;
+        if ( vm_notify_window != ~0u )
+            opt |= SECONDARY_EXEC_NOTIFY_VM_EXITING;
 
         /*
          * "APIC Register Virtualization" and "Virtual Interrupt Delivery"
@@ -1290,6 +1296,17 @@ static int construct_vmcs(struct vcpu *v)
     v->arch.hvm.vmx.exception_bitmap = HVM_TRAP_MASK
               | (paging_mode_hap(d) ? 0 : (1U << TRAP_page_fault))
               | (v->arch.fully_eager_fpu ? 0 : (1U << TRAP_no_device));
+    if ( cpu_has_vmx_notify_vm_exiting )
+    {
+        __vmwrite(NOTIFY_WINDOW, vm_notify_window);
+        /*
+         * Disable #AC and #DB interception: by using VM Notify Xen is
+         * guaranteed to get a VM exit even if the guest manages to lock the
+         * CPU.
+         */
+        v->arch.hvm.vmx.exception_bitmap &= ~((1U << TRAP_debug) |
+                                              (1U << TRAP_alignment_check));
+    }
     vmx_update_exception_bitmap(v);
 
     v->arch.hvm.guest_cr[0] = X86_CR0_PE | X86_CR0_ET;
diff --git a/xen/arch/x86/hvm/vmx/vmx.c b/xen/arch/x86/hvm/vmx/vmx.c
index dabf4a3552..b11578777a 100644
--- a/xen/arch/x86/hvm/vmx/vmx.c
+++ b/xen/arch/x86/hvm/vmx/vmx.c
@@ -1428,10 +1428,19 @@ static void cf_check vmx_update_host_cr3(struct vcpu *v)
 
 void vmx_update_debug_state(struct vcpu *v)
 {
+    unsigned int mask = 1u << TRAP_int3;
+
+    if ( !cpu_has_monitor_trap_flag && cpu_has_vmx_notify_vm_exiting )
+        /*
+         * Only allow toggling TRAP_debug if notify VM exit is enabled, as
+         * unconditionally setting TRAP_debug is part of the XSA-156 fix.
+         */
+        mask |= 1u << TRAP_debug;
+
     if ( v->arch.hvm.debug_state_latch )
-        v->arch.hvm.vmx.exception_bitmap |= 1U << TRAP_int3;
+        v->arch.hvm.vmx.exception_bitmap |= mask;
     else
-        v->arch.hvm.vmx.exception_bitmap &= ~(1U << TRAP_int3);
+        v->arch.hvm.vmx.exception_bitmap &= ~mask;
 
     vmx_vmcs_enter(v);
     vmx_update_exception_bitmap(v);
@@ -4180,6 +4189,9 @@ void vmx_vmexit_handler(struct cpu_user_regs *regs)
         switch ( vector )
         {
         case TRAP_debug:
+            if ( cpu_has_monitor_trap_flag && cpu_has_vmx_notify_vm_exiting )
+                goto exit_and_crash;
+
             /*
              * Updates DR6 where debugger can peek (See 3B 23.2.1,
              * Table 23-1, "Exit Qualification for Debug Exceptions").
@@ -4619,6 +4631,22 @@ void vmx_vmexit_handler(struct cpu_user_regs *regs)
          */
         break;
 
+    case EXIT_REASON_NOTIFY:
+        __vmread(EXIT_QUALIFICATION, &exit_qualification);
+
+        if ( unlikely(exit_qualification & NOTIFY_VM_CONTEXT_INVALID) )
+        {
+            perfc_incr(vmnotify_crash);
+            gprintk(XENLOG_ERR, "invalid VM context after notify vmexit\n");
+            domain_crash(v->domain);
+            break;
+        }
+
+        if ( unlikely(exit_qualification & INTR_INFO_NMI_UNBLOCKED_BY_IRET) )
+            undo_nmis_unblocked_by_iret();
+
+        break;
+
     case EXIT_REASON_VMX_PREEMPTION_TIMER_EXPIRED:
     case EXIT_REASON_INVPCID:
     /* fall through */
diff --git a/xen/arch/x86/hvm/vmx/vvmx.c b/xen/arch/x86/hvm/vmx/vvmx.c
index 2095c1e612..f8fe8d0c14 100644
--- a/xen/arch/x86/hvm/vmx/vvmx.c
+++ b/xen/arch/x86/hvm/vmx/vvmx.c
@@ -2487,6 +2487,7 @@ int nvmx_n2_vmexit_handler(struct cpu_user_regs *regs,
     case EXIT_REASON_EPT_MISCONFIG:
     case EXIT_REASON_EXTERNAL_INTERRUPT:
     case EXIT_REASON_BUS_LOCK:
+    case EXIT_REASON_NOTIFY:
         /* pass to L0 handler */
         break;
     case VMX_EXIT_REASONS_FAILED_VMENTRY:
diff --git a/xen/arch/x86/include/asm/hvm/vmx/vmcs.h b/xen/arch/x86/include/asm/hvm/vmx/vmcs.h
index f3df5113d4..78404e42b3 100644
--- a/xen/arch/x86/include/asm/hvm/vmx/vmcs.h
+++ b/xen/arch/x86/include/asm/hvm/vmx/vmcs.h
@@ -268,6 +268,7 @@ extern u32 vmx_vmentry_control;
 #define SECONDARY_EXEC_XSAVES                   0x00100000
 #define SECONDARY_EXEC_TSC_SCALING              0x02000000
 #define SECONDARY_EXEC_BUS_LOCK_DETECTION       0x40000000
+#define SECONDARY_EXEC_NOTIFY_VM_EXITING        0x80000000
 extern u32 vmx_secondary_exec_control;
 
 #define VMX_EPT_EXEC_ONLY_SUPPORTED                         0x00000001
@@ -349,6 +350,8 @@ extern u64 vmx_ept_vpid_cap;
     (vmx_secondary_exec_control & SECONDARY_EXEC_TSC_SCALING)
 #define cpu_has_vmx_bus_lock_detection \
     (vmx_secondary_exec_control & SECONDARY_EXEC_BUS_LOCK_DETECTION)
+#define cpu_has_vmx_notify_vm_exiting \
+    (vmx_secondary_exec_control & SECONDARY_EXEC_NOTIFY_VM_EXITING)
 
 #define VMCS_RID_TYPE_MASK              0x80000000
 
@@ -456,6 +459,7 @@ enum vmcs_field {
     SECONDARY_VM_EXEC_CONTROL       = 0x0000401e,
     PLE_GAP                         = 0x00004020,
     PLE_WINDOW                      = 0x00004022,
+    NOTIFY_WINDOW                   = 0x00004024,
     VM_INSTRUCTION_ERROR            = 0x00004400,
     VM_EXIT_REASON                  = 0x00004402,
     VM_EXIT_INTR_INFO               = 0x00004404,
diff --git a/xen/arch/x86/include/asm/hvm/vmx/vmx.h b/xen/arch/x86/include/asm/hvm/vmx/vmx.h
index eae39365aa..8e1e42ac47 100644
--- a/xen/arch/x86/include/asm/hvm/vmx/vmx.h
+++ b/xen/arch/x86/include/asm/hvm/vmx/vmx.h
@@ -221,6 +221,7 @@ static inline void pi_clear_sn(struct pi_desc *pi_desc)
 #define EXIT_REASON_XSAVES              63
 #define EXIT_REASON_XRSTORS             64
 #define EXIT_REASON_BUS_LOCK            74
+#define EXIT_REASON_NOTIFY              75
 /* Remember to also update VMX_PERF_EXIT_REASON_SIZE! */
 
 /*
@@ -236,6 +237,11 @@ static inline void pi_clear_sn(struct pi_desc *pi_desc)
 #define INTR_INFO_VALID_MASK            0x80000000      /* 31 */
 #define INTR_INFO_RESVD_BITS_MASK       0x7ffff000
 
+/*
+ * Exit Qualifications for NOTIFY VM EXIT
+ */
+#define NOTIFY_VM_CONTEXT_INVALID       1u
+
 /*
  * Exit Qualifications for MOV for Control Register Access
  */
diff --git a/xen/arch/x86/include/asm/perfc_defn.h b/xen/arch/x86/include/asm/perfc_defn.h
index 6fce21e85a..487e20dc97 100644
--- a/xen/arch/x86/include/asm/perfc_defn.h
+++ b/xen/arch/x86/include/asm/perfc_defn.h
@@ -6,7 +6,7 @@ PERFCOUNTER_ARRAY(exceptions,           "exceptions", 32)
 
 #ifdef CONFIG_HVM
 
-#define VMX_PERF_EXIT_REASON_SIZE 75
+#define VMX_PERF_EXIT_REASON_SIZE 76
 #define VMEXIT_NPF_PERFC 143
 #define SVM_PERF_EXIT_REASON_SIZE (VMEXIT_NPF_PERFC + 1)
 PERFCOUNTER_ARRAY(vmexits,              "vmexits",
@@ -129,5 +129,6 @@ PERFCOUNTER(iommu_pt_shatters,    "IOMMU page table shatters")
 PERFCOUNTER(iommu_pt_coalesces,   "IOMMU page table coalesces")
 
 PERFCOUNTER(buslock, "Bus Locks Detected")
+PERFCOUNTER(vmnotify_crash, "domain crashes by Notify VM Exit")
 
 /*#endif*/ /* __XEN_PERFC_DEFN_H__ */
-- 
2.39.0



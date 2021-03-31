Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id B9DEB34FE1E
	for <lists+xen-devel@lfdr.de>; Wed, 31 Mar 2021 12:36:01 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.103830.198023 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1lRYCT-0004am-Sb; Wed, 31 Mar 2021 10:35:49 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 103830.198023; Wed, 31 Mar 2021 10:35:49 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1lRYCT-0004a4-Nq; Wed, 31 Mar 2021 10:35:49 +0000
Received: by outflank-mailman (input) for mailman id 103830;
 Wed, 31 Mar 2021 10:35:48 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=9hby=I5=citrix.com=roger.pau@srs-us1.protection.inumbo.net>)
 id 1lRYCS-0004Zp-Fk
 for xen-devel@lists.xenproject.org; Wed, 31 Mar 2021 10:35:48 +0000
Received: from esa1.hc3370-68.iphmx.com (unknown [216.71.145.142])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id 2418dee0-b4d0-4766-a8d0-54044651bb31;
 Wed, 31 Mar 2021 10:35:46 +0000 (UTC)
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
X-Inumbo-ID: 2418dee0-b4d0-4766-a8d0-54044651bb31
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=citrix.com; s=securemail; t=1617186946;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:content-transfer-encoding:mime-version;
  bh=pf+3mEgT/PwOonbrF+sYgx8kqAd51PG7gUiL4p8/xD4=;
  b=ZLOLXRnifKA7JPdELVN2dF38absTHnxAzzELNl8eMzbG7k84LZPxM37r
   t4tWzJpaG2tNR1qOt8JSyf3ZOO8u04RdFZ6uWE2tJFUoSHmMDUWK+AWpb
   cUmbGlkevg1nJ+UGtW0tot9Pbt3xH0zwVlHNTIWKaU9B6Y856XyC+mcuj
   U=;
Authentication-Results: esa1.hc3370-68.iphmx.com; dkim=pass (signature verified) header.i=@citrix.onmicrosoft.com
IronPort-SDR: FoHfbWWLulHxf0Oq02Rw5muDVV+bOEFRDshmpU6vAEFD9RPgUsW3okBrFLBCxJd2a+RAxD/SjN
 BciA09C4zjPkgLML03ZlmDTs/3puAx2bgexSiwzYh7gLVZ8J5S/9fQQEWNqE2l9GzK0xBX6tnq
 Qd5H/JFA6YwRm401DQcp43YB+4wBGP8UkF0/S3hTj2x2CO3l3PzLzq1R5cPEmcNt2IBO2KiBps
 A8KIw5yW6hat/nfl2NFa2JwWIngtTXxQHgAVh81ZgMmkY19OiQvQVzugSAfYlby91mOwjsMVuM
 Dkc=
X-SBRS: 5.2
X-MesageID: 40917024
X-Ironport-Server: esa1.hc3370-68.iphmx.com
X-Remote-IP: 162.221.156.83
X-Policy: $RELAYED
IronPort-HdrOrdr: A9a23:NUQrAKkXsmP9nFPxnJ80pOPqYIrpDfOpj2dD5ilNYBxZY6Wkvu
 iUtrAyyQL0hDENWHsphNCHP+26TWnB8INuiLN/AZ6LZyOjnGezNolt4c/ZwzPmEzDj7eI178
 tdWoBEIpnLAVB+5PyW3CCRD8sgzN6b8KqhmOfZyDNXQRt3brx7hj0ZNi+wOCRNNW17LLA+E4
 eR4dcCmiGpfm4ZYt/+Kn4OWeXCoNOjruObXTctARk75A6SyQ658bKSKWnk4j4ycRNqhY0j/2
 /MjhDj6syY3c2T5xfA2wbonvJrsfT7zN8rPr3vtuE0LXHWhh+sdMBdXdS5zUsIicWOzHpvr9
 XWuRcnOK1ImgPsV0W4uwHk1QWl8BtG0Q6a9XaijXHuodP0SVsBYqIr7+IpEWqq12MasN5xy6
 5N1W6C3qAndy/opyjh+8POEyhji0vcmwtSrccok3ddXYECAYUhyrA3wUU9KuZkIAvKrKojEO
 VoEfjG4udXfV6wfxnizxdS6e3pcXIpEhicRE8e/uSTzjhNhXh8i3AV3coFgx47hd4AYqgBw9
 6BHrVjlblIQMNTRaVhBN0ZSc/yLmDWWxrDPE+bPFyPLtBJB1v977rMpJkl7uCjf5IFiLEono
 7abV9evWkuP2rzFMynxvRwg1DwaVT4eQ6o5tBV5pB/tLG5bqHsKze/RFcnlNbli+kDA/fcR+
 24NPttcr7eBFqrPbwM8xz1WpFUJ3VbetYSoMwHV1WHpd+OBZbtssDdbfbPNJvgGTspQQrEcz
 k+dQm2AP8FwlGgW3f+jhSUcWjqYFbD8ZV5F7Wf3+V78vlJCqR89iwuzXip7MCCLjNP9oYsel
 FlHb/hmqSn4U2//WPC6XRVKgNQZ3wlpInIYjdvn0snIkn0ebEMt5G0YmZJxkaKIRd5UofwHB
 NAoU90vYa6NYaZyyxnK9/PCBPVs1Ij4FaxC7sMkKyK4snoPrkiCIw9ZaB3HQLXUzpvmQhrr2
 9HQBQeRlDWEw7vjanNtu1WOMjvM/1HxCu7K89drnzS8W+Go9s0e3cdVzmyFfKMjR0WXDpSjF
 1p+6o5iL6N8AzfblcXsaAdChlheW6XCLVJAECgaJ9Pkr7mQg12UFyHnCeXkR01Z2rs+XgDn2
 CJF1zmRdj7Rn5m/lxI2Kfj9115Ml+QeE99cVhWm4xwH2augAc57ca7Io6Il0eBYFoLxe8QdA
 zfaTwJOwV02pSczxiOgguPEn0g27QjNuHQF64YbrnWw3+hQbf4050uLrtxxtJIJdruuugEXa
 ajYAeTNir/EP5s9AqPpHopURME3kUMoLfN4lnC42e51nJkXqaXD1RiWr0BI9aTq0LjXO2F1Z
 1ljdQz+cu8W1+BHuKu+OXyVXpkLBiWnEudC8cPgrpQtbgptLRyE4LAOAG4nE1v7VEbFoPMiE
 gaQK5H+7jPNY9kQtwKd0tijy8UveXKCHFujxf/DeA/d2w8lnP3P9uG5LzTtLoka3fx0zfYCB
 26+y1Z8+ytZVr66ZcqT4YxK39Rck4y9TBL+/6DbZTZDGyRBqt+1Wv/Fn+2a7lGTqeZXZ0Wsx
 Zh+tmN28uabTDx1gyVnTx1JMt1giuaaPL3JAKHAuhT9dOmfXyKn6ux+ca2yA7NdgHTUTVQua
 R1MWoKbspCjTE+jIo4lgiKI5aH3X4Noh95+jFollnkx468xnzUdHs2aDHkvg==
X-IronPort-AV: E=Sophos;i="5.81,293,1610427600"; 
   d="scan'208";a="40917024"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=e0WYdTfPrUqQQgvjF2Y0GCWlRNAggH+rn1cDBTk1aiyq2ZNNLQr5qN4hXHFGu1rQAPGEKy8ek5kVMKRI6yjrX7GkRPloJ0cOxMBScQVl0cVjqUrC+xbOz9tRZcxwp49EaHnLzrXp51szi9pgHvq+FksG0FIbXMo69qlUF0LZEr185awBxmFy/yUX+iUIE2YmMsUOlR7I3Krlym+9eg92HeELkXpQ/W+ZyfJbUZEiikjDqe6rybHK8GyUPQj8NJhzGGkf/5mtmyph6KUIjhlMDYK8CAoaEc0zTZr/kOFbNRpGZ3vwF6y/y7EqYW7Ghr5f4pA9GH+cO/0RsqjQ+3Vg+Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=1YChfSP81aZL13zYGZ4iZHk38+vOOoVLtwqftK78jk0=;
 b=cEsz4QVvY7FbTFGKmBRO3P+UpYszub5lM0FRXIJu4AFWRtLNeKrQCxOfhcX0r7E4bTpsVXCpST2KWYdu9fgHcIC1NfAMVuvh7SnV9sFrhiTsJHlU5ioStsc6tmxsrjR0XMP2xB96fwHdJYR1MjJLi8Jbt4mtAvfWCUE9+SxG4uZKUIVanvTYWbFuUK/WzJN+VnS1st+yUx3XDnkCraQYak36pn2mq7bRvWDuf2uFqg2/4f5YpaJx07Wad9gZyL3Br1Q7AHjsa/y2kucFW3Li9n3CzJMabA8u1sG2mUtn5utgW7auh4T1FqgkqZqpWwfSuNfvGz8h9CactiYTvasGkg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=citrix.com; dmarc=pass action=none header.from=citrix.com;
 dkim=pass header.d=citrix.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=citrix.onmicrosoft.com; s=selector2-citrix-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=1YChfSP81aZL13zYGZ4iZHk38+vOOoVLtwqftK78jk0=;
 b=Zz2EHG63xBds9faORxvM9t/E3L6RGWPR+JbAOegEcOos+DkpeTD7W/1Dvxwb0wXZkAAtIPhRsBwSX+T72n39ECzE1azpWCgoqddWjLaCPGWW7t1Na1tQ2cGFIeZps+7LsT0RupMnJC4r4gztPQ5cNORmYGQ3/dT4qXoI7WrYLdk=
From: Roger Pau Monne <roger.pau@citrix.com>
To: <xen-devel@lists.xenproject.org>
CC: Roger Pau Monne <roger.pau@citrix.com>, Jan Beulich <jbeulich@suse.com>,
	Andrew Cooper <andrew.cooper3@citrix.com>, Wei Liu <wl@xen.org>, Paul Durrant
	<paul@xen.org>, Paul Durrant <pdurrant@amazon.com>
Subject: [PATCH v3 01/11] x86/hvm: drop vcpu parameter from vlapic EOI callbacks
Date: Wed, 31 Mar 2021 12:32:53 +0200
Message-ID: <20210331103303.79705-2-roger.pau@citrix.com>
X-Mailer: git-send-email 2.30.1
In-Reply-To: <20210331103303.79705-1-roger.pau@citrix.com>
References: <20210331103303.79705-1-roger.pau@citrix.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: MR2P264CA0062.FRAP264.PROD.OUTLOOK.COM
 (2603:10a6:500:31::26) To DS7PR03MB5608.namprd03.prod.outlook.com
 (2603:10b6:5:2c9::18)
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: f474ce6b-e0e3-49c4-11af-08d8f430bb93
X-MS-TrafficTypeDiagnostic: DM5PR03MB2777:
X-MS-Exchange-Transport-Forked: True
X-Microsoft-Antispam-PRVS: <DM5PR03MB2777EB68AB85FD4F3964253C8F7C9@DM5PR03MB2777.namprd03.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:5236;
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: mrIrlP88Q5KVKbY5AqredBbO1GPLqqAipp+QLGZnqOEx0rRoW83PZsUT50OdyLISod9eyRxY0jnLkSMotzFt8j+Hb9kFMqLHupRyJVOk5FlRLfN1VJAIyZzq53Lr5OKGm5Iko3vVBUKfg/VnZcrLkQlr7sex6qEl+Zw2si0bO9mu48B2B06/cLTkszvBQBQD1x7mHFjyGZK9RqC9BnTV72Rw/CHHlLNY7AQGfhRQMOH0dRfsYUwqkxLctDNzwhRfW8tXcVafVtvL2hlGK9YNoGyNumrtjPWnq8mQgB4134qazIQXst82NmkyDmG600QCeAQ7jKHolnBymlHMVzoeYCQ7K/ilSjo8feOKXhWFtpL+OX96DmsvtGqkEcw+gNPRdVjuWLG54OMz+MSBr9JbSAv5zygoqJ8qhBU2vh9jKMIn6e5oz5NzGbJZUGV4jla21wohq6n5vSiFfrMtCWYcveXdh2bkSvAi538ef6fNRQ+cadh4rad4u0IEdswYIYGE/34zQj+1N3Qa8LHxuB/4GRS7iC1rdSNBKFbcW8yX7Q9le/ppF/Ezm8vYIVh3Cg0tCfMoKt5p+ucmwezc3RUQR+3DwLKnU094FXU8mwSXUekYirJjpDbfgFENYyPnfVRMqVmYOyGvnAOSqxH7DLOyeaOTqp+jnaJYgTyuJFvcrEY=
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DS7PR03MB5608.namprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(4636009)(396003)(136003)(346002)(366004)(39860400002)(376002)(5660300002)(186003)(66476007)(16526019)(26005)(6486002)(8676002)(36756003)(86362001)(83380400001)(38100700001)(8936002)(956004)(54906003)(1076003)(6916009)(2906002)(4326008)(316002)(2616005)(66946007)(6666004)(66556008)(478600001)(6496006);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData: =?utf-8?B?NVp0eERwQUt6VHFUdnA4QXFaNUI1Z0hHTXNMQkxrdXErakZoU3FFM3AzNWtD?=
 =?utf-8?B?cFlHYWVmRWRYRTZKOTA5bDNnVGpZMW90V2hyMUpzRzVGcUFLdktZaFhoR1Ay?=
 =?utf-8?B?QkFUc05HeERnY3NranlYT0hPbmFqVnpVcFZhbk5hNG1TY1lkWjdjQ0wya1Ev?=
 =?utf-8?B?K05QVUl4SFRCQmh4eVAxQlFPNlJNU2FRMXhyaVBuK0Q5bXNNbGNKbnFXY3l0?=
 =?utf-8?B?OU5XQmpJcUhUVlppd3lEMWsxN3Z4ZC9Lc0dENVVYRGl0OVFEQTRoOVlnN2d5?=
 =?utf-8?B?d3FvdXBrOG9EN244N1d3TEplTDM5cnNTbldwUW0rZGc1WmlFVEtLNlpTZnRP?=
 =?utf-8?B?MWd4ZXhKa1NMNWZOYjJsR3d3TnFSdlNzVWlKMkJrNG4vVlVka3d0ZE9Obk9P?=
 =?utf-8?B?Zk4xMXlkaE93bWhnOUJ6YWpCYnV6c0luT1RPUTV1d0NzUDR6ZGFTRzlrR29C?=
 =?utf-8?B?QTY2R0FKZWovR2NkZVhPV0tHTlAyUWJkZ2ZpZ1h6S2U2UmRMMEtHNitKR2h6?=
 =?utf-8?B?YU5xbUhSVjNBT3R2YlN4VU1LTWMrWmQ3NS80V29PZEY0cXJaWHBBT2pjRytS?=
 =?utf-8?B?WTVlWURLREpYLzczNnZjamJGTmdmUW5YYXQwUnd2aUwvcnFBV1JnaU85WWt6?=
 =?utf-8?B?d3IrTTR4QmlmekFMTVptRzNCcGNMcVBOUkpBaDdlcmR5WlhNMU5SZi9yczI1?=
 =?utf-8?B?UDBqZ2UxeDdYR3VNY3ovbGVodHRXL3dYUGtZVnZ1RVZoUkUxQnJSYldnWVJR?=
 =?utf-8?B?N3ZRQ012SFRIVm92dkFPSlZ3N0hOd0xqYi8yNnNjMmJNTWV5dCtocHQ4QzYx?=
 =?utf-8?B?Z1djWVNWQmF0UldubncyQkZQR0ZrSG9qTzdGV243R2ZpN096MFozeU5RNnA4?=
 =?utf-8?B?WlZmUnVaRGhoTnB6Qmt3djBaUFlRTWh2d3p3OVo4NnJ2aHNDNFk0MnFMV3lp?=
 =?utf-8?B?ZGM5M1pLRm54QlV3b3lCZXFmWTdnbHhyWWJyZkN4T2hHdmQ1YjQySVZyeHdH?=
 =?utf-8?B?cmxVUWRDTGFQMjI0bmtBei9XL1Z3ejd4WVkvOXFxZ3FEMlduU2RxNWhwQWcz?=
 =?utf-8?B?RmN4YVFLZnRJK2NpNDZueEVFTUp1aGFPTGdkMVBQN1did3d5dmY3dEd3VFlJ?=
 =?utf-8?B?MnAwUXk0dTFVSkRacElGU1lWTklsNlpIVERZL1g0SWUxb25LSjFEQi9pK1or?=
 =?utf-8?B?Z09UaWRYQnNzTmJiMjZ4NGthZlkzaEs3UW1xQ0MyRTBhM0VWbmFNMlVnckw0?=
 =?utf-8?B?OXh5QlZ3djBiakZRWHdwaUUvRnFoSWx4UlFycGo5Y0QydVlOTExQQXcva3pw?=
 =?utf-8?B?N2dsU3Z0ZXhpUW1MYmxiNzVmMk55QnlyNEpZZVl3Q21lNEtPRTUxT1daU3Bw?=
 =?utf-8?B?eGVaQmlMV2xVYTc4aVBEd0RkVk1PUUJUOU5hSnhIdGhibU13ejFLejZIbEpP?=
 =?utf-8?B?MnVvWmRjQWRKRGZGN29JMk0rR01GbWZLUzZ3MHk4S2xTT3ptZkV1cUF4TVF6?=
 =?utf-8?B?bzdMamhYTUFpdlpGSTFKaEE2QjN2dmRyUG42MkZlVVdrcHRZZmpsVTlobHJ3?=
 =?utf-8?B?bEd2UUFNTmZVVEhNbmc0bmsxdDBqbkJnNWRjU09xNmdSWTZWbTlEZ0UzVlht?=
 =?utf-8?B?ZkF2TVJxUkxKQnV1bkNmTUF3MTlBditkaFJDaitmTlV3VjNSbUJIbTJWZEFP?=
 =?utf-8?B?OTNqcFoyaC95ZE1teGZtVzhFNXhPUWM5Y3h5d0EvTFVkOUpnK3B1MnF0Zndm?=
 =?utf-8?Q?jiSWpvIVgTQYR5GfADQCnVoYWs+oOLdW8pwIUxQ?=
X-MS-Exchange-CrossTenant-Network-Message-Id: f474ce6b-e0e3-49c4-11af-08d8f430bb93
X-MS-Exchange-CrossTenant-AuthSource: DS7PR03MB5608.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 31 Mar 2021 10:35:41.6346
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 335836de-42ef-43a2-b145-348c2ee9ca5b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 2zJ+zYDOc4asnog8KPOMPIQFXVf6jIQ7JGLKEWexA1JRIPpVGTDMxAAjHMMqzl/jbBRtAifxzNbNtVsXshkfQw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM5PR03MB2777
X-OriginatorOrg: citrix.com

EOIs are always executed in guest vCPU context, so there's no reason to
pass a vCPU parameter around as can be fetched from current.

While there make the vector parameter of both callbacks unsigned int.

No functional change intended.

Suggested-by: Paul Durrant <pdurrant@amazon.com>
Signed-off-by: Roger Pau Monné <roger.pau@citrix.com>
Reviewed-by: Paul Durrant <paul@xen.org>
---
Changes since v1:
 - New in this version.
---
 xen/arch/x86/hvm/vioapic.c        | 5 +++--
 xen/arch/x86/hvm/vlapic.c         | 7 ++-----
 xen/drivers/passthrough/x86/hvm.c | 4 +++-
 xen/include/asm-x86/hvm/io.h      | 2 +-
 xen/include/asm-x86/hvm/vioapic.h | 2 +-
 5 files changed, 10 insertions(+), 10 deletions(-)

diff --git a/xen/arch/x86/hvm/vioapic.c b/xen/arch/x86/hvm/vioapic.c
index 87370dd4172..91e5f892787 100644
--- a/xen/arch/x86/hvm/vioapic.c
+++ b/xen/arch/x86/hvm/vioapic.c
@@ -372,7 +372,7 @@ static int vioapic_write(
 
 #if VIOAPIC_VERSION_ID >= 0x20
     case VIOAPIC_REG_EOI:
-        vioapic_update_EOI(v->domain, val);
+        vioapic_update_EOI(val);
         break;
 #endif
 
@@ -514,8 +514,9 @@ void vioapic_irq_positive_edge(struct domain *d, unsigned int irq)
     }
 }
 
-void vioapic_update_EOI(struct domain *d, u8 vector)
+void vioapic_update_EOI(unsigned int vector)
 {
+    struct domain *d = current->domain;
     struct hvm_irq *hvm_irq = hvm_domain_irq(d);
     union vioapic_redir_entry *ent;
     unsigned int i;
diff --git a/xen/arch/x86/hvm/vlapic.c b/xen/arch/x86/hvm/vlapic.c
index 5e21fb4937d..98e4ba67d79 100644
--- a/xen/arch/x86/hvm/vlapic.c
+++ b/xen/arch/x86/hvm/vlapic.c
@@ -459,13 +459,10 @@ void vlapic_EOI_set(struct vlapic *vlapic)
 
 void vlapic_handle_EOI(struct vlapic *vlapic, u8 vector)
 {
-    struct vcpu *v = vlapic_vcpu(vlapic);
-    struct domain *d = v->domain;
-
     if ( vlapic_test_vector(vector, &vlapic->regs->data[APIC_TMR]) )
-        vioapic_update_EOI(d, vector);
+        vioapic_update_EOI(vector);
 
-    hvm_dpci_msi_eoi(d, vector);
+    hvm_dpci_msi_eoi(vector);
 }
 
 static bool_t is_multicast_dest(struct vlapic *vlapic, unsigned int short_hand,
diff --git a/xen/drivers/passthrough/x86/hvm.c b/xen/drivers/passthrough/x86/hvm.c
index 351daafdc9b..2f6c81b1e2c 100644
--- a/xen/drivers/passthrough/x86/hvm.c
+++ b/xen/drivers/passthrough/x86/hvm.c
@@ -796,8 +796,10 @@ static int _hvm_dpci_msi_eoi(struct domain *d,
     return 0;
 }
 
-void hvm_dpci_msi_eoi(struct domain *d, int vector)
+void hvm_dpci_msi_eoi(unsigned int vector)
 {
+    struct domain *d = current->domain;
+
     if ( !is_iommu_enabled(d) ||
          (!hvm_domain_irq(d)->dpci && !is_hardware_domain(d)) )
        return;
diff --git a/xen/include/asm-x86/hvm/io.h b/xen/include/asm-x86/hvm/io.h
index 54e0161b492..8b8392ec59e 100644
--- a/xen/include/asm-x86/hvm/io.h
+++ b/xen/include/asm-x86/hvm/io.h
@@ -142,7 +142,7 @@ struct hvm_hw_stdvga {
 void stdvga_init(struct domain *d);
 void stdvga_deinit(struct domain *d);
 
-extern void hvm_dpci_msi_eoi(struct domain *d, int vector);
+extern void hvm_dpci_msi_eoi(unsigned int vector);
 
 /* Decode a PCI port IO access into a bus/slot/func/reg. */
 unsigned int hvm_pci_decode_addr(unsigned int cf8, unsigned int addr,
diff --git a/xen/include/asm-x86/hvm/vioapic.h b/xen/include/asm-x86/hvm/vioapic.h
index 36b64d20d60..882548c13b7 100644
--- a/xen/include/asm-x86/hvm/vioapic.h
+++ b/xen/include/asm-x86/hvm/vioapic.h
@@ -63,7 +63,7 @@ int vioapic_init(struct domain *d);
 void vioapic_deinit(struct domain *d);
 void vioapic_reset(struct domain *d);
 void vioapic_irq_positive_edge(struct domain *d, unsigned int irq);
-void vioapic_update_EOI(struct domain *d, u8 vector);
+void vioapic_update_EOI(unsigned int vector);
 
 int vioapic_get_mask(const struct domain *d, unsigned int gsi);
 int vioapic_get_vector(const struct domain *d, unsigned int gsi);
-- 
2.30.1



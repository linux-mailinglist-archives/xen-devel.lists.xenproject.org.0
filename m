Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 7643E4742B7
	for <lists+xen-devel@lfdr.de>; Tue, 14 Dec 2021 13:37:58 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.246705.425460 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1mx73W-00044q-MA; Tue, 14 Dec 2021 12:37:18 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 246705.425460; Tue, 14 Dec 2021 12:37:18 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1mx73W-000427-Iz; Tue, 14 Dec 2021 12:37:18 +0000
Received: by outflank-mailman (input) for mailman id 246705;
 Tue, 14 Dec 2021 12:37:16 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=xzzU=Q7=citrix.com=roger.pau@srs-se1.protection.inumbo.net>)
 id 1mx73U-000421-Fq
 for xen-devel@lists.xenproject.org; Tue, 14 Dec 2021 12:37:16 +0000
Received: from esa2.hc3370-68.iphmx.com (esa2.hc3370-68.iphmx.com
 [216.71.145.153]) by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 8f5a6161-5cda-11ec-9e60-abaf8a552007;
 Tue, 14 Dec 2021 13:37:14 +0100 (CET)
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
X-Inumbo-ID: 8f5a6161-5cda-11ec-9e60-abaf8a552007
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=citrix.com; s=securemail; t=1639485433;
  h=date:from:to:cc:subject:message-id:references:
   in-reply-to:mime-version;
  bh=e7iNh7eKzfNaD6+64EUknrfrSEZzZMdaO3S7Tsc7IiQ=;
  b=XgLHSNmAPlGxlZqNN8d5UzNqfQtjF+a5IsHsiYS/HermBpu29//KlgxA
   2lkesJEFpQVwpWQ2v9W8H0zLro3irdGkm3BZ1j+LXbODCA1/cXGEBhoU8
   qGkpsjdv7Y0+Eeu4/FNf1oigrXwvwYNnxHqMYKMHzSnJqg6Fsc/FkqHWF
   I=;
Authentication-Results: esa2.hc3370-68.iphmx.com; dkim=pass (signature verified) header.i=@citrix.onmicrosoft.com
IronPort-SDR: AxMu/z/fZ7kusg/ALSFxAa6uTJerixq4i/eXHhI2kEQIo7ntsRm4ulwnN3nOVfDN+xsI7ZxtN/
 uERKE0euIIlPQKtWOvh1JgTfaric7WUxyqpzsA7NqFmEE3S7pDgyuEJhaBZuh7n51wy+ImWgSg
 lkVzez4CedheVbjfGXoSwl+OTj+9gCQgktAUKbvdr+agZDQxlvv+flDN0sO3eeqh/quin6k8Jc
 9XRn/VAf16w6rnhlUtq4909TzGPvssOyc+gF2tZUfKINuf/u6HqpjmsO7EcQI4SBfGjzZ+1Ex5
 zp0goOyvxFS2fcwPvdH2Dngl
X-SBRS: 5.1
X-MesageID: 59971315
X-Ironport-Server: esa2.hc3370-68.iphmx.com
X-Remote-IP: 162.221.156.83
X-Policy: $RELAYED
IronPort-Data: A9a23:Dz57Z6CKRxeARBVW/53kw5YqxClBgxIJ4kV8jS/XYbTApD0h1TNUm
 jYYXTuCOPaMMGbxc9BybNi0pkMG65eGmNRmQQY4rX1jcSlH+JHPbTi7wuYcHM8wwunrFh8PA
 xA2M4GYRCwMo/u1Si6FatANl1ElvU2zbue6WL6s1hxZH1c+EX570E47wYbVv6Yz6TSHK1LV0
 T/Ni5W31G+Ng1aY5UpNtspvADs21BjDkGtwUm4WPJinj3eH/5UhN7oNJLnZEpfNatI88thW5
 Qr05OrREmvxp3/BAz4++1rxWhVirrX6ZWBihpfKMkQLb9crSiEai84G2PQghUh/myekuf0g9
 pJ0tMaQazokHrHvxPUYXEwNe81+FfUuFL7vJHG+tYqYzlHccmuqyPJrZK00FdRGoKAtWzgIr
 KFGbmBWBvyAr7veLLaTUO5ji95lNMD2FIgepmth3XfSCvNOrZXrHvSbuoYDhWpYasZmIK3mI
 OUobj9VUC/Pfj9JPgkTOMgApbL97pX4W2IB8w/EzUYt2EDMyCRh3b6rN8DaEvSIWMFUk0Cwt
 m/AuWPjDXkyL8eDwDCI9natgO7nni7hXo8WUrqi+ZZCglee22gSAx0+TkagrL+yjUvWc8hWK
 1EQvDEvq6cy3EWxS5/2WBjQiG6JuFsQVsRdF8U+6RqR0ezE7gCBHG8GQzVdLts8u6ceTzEwy
 kWAmd+vADV1qaCUUlqU7LLSpjS3URX5NkdbO3VCF1FcpYC+/sdj1XojU+qPDoalnPDTNGDOh
 AmL9ggcurgzke1XxqC0qAWvby2XmrDFSQs85wPyV22j7x9kaIPNW7FE+WQ3/t4bct/HEwDpU
 Gws3pHHsbtQVc3leDmlGb1VRNmUC+C53CowaLKFN70o7HyT9nGqZui8CxkudR4yYq7oldIEC
 XI/WD+9BrcPbBNGjoctOupd7vjGK4C6SrwJsdiOMbJzjmBZLlPvwc2XTRf4M5rRuEYti7ojH
 pyQbNyhC30XYYw+kmHnG71EieJ1mXFurY82eXwd5074uVZ5TCTKIYrpzXPUNrxphE96iFu9H
 ylj2zuilEwEDbyWjtj/+o8PN1EaRUXX9ritw/G7gtWre1I8cEl4Uqe56ep4J+RNwvUN/s+Vr
 yrVchIJlzLCaYjvdFzihoZLM+i0A/6SbBsTYEQRALpf8yR5PNv0sv5AL8BfkHtO3LUL8MOYh
 sItIq2oKv9OVi7G63Iaa5z8p5ZlbxOlmUSFOC/NXdT1V8IIq9Xh9oC2cw3x2jMJCybr58Iyr
 6f5jlHQQIYZRhQkB8HTMar9w1S0tHkbueRzQ0qXfYUDJBSyqNBne37rk/s6A8AQMhGflDGU4
 BmbXEUDru7Xro5rrNSQ3fKYr52kGvdVF1ZBGzWJ9q6/MCTXpzLxwYJJXOuSUyraUWf4pPera
 elPlqmuO/wbhlda9YF7Fu8zn6454tLuoZ5czxhlQyqXPwj6VOs4LyDfj8dVt6BLyrtIgieMW
 xqCqotAJLGEGML5C1pNdgArWfuOiKMPkT7I4PVrfEijvH1r/KCKWFl5NgWXjHAPN6N8NY4oz
 LtzuMMS7ADj2BMmPszf03JR/mWIaHcBT78mptcRB4qy0lgnzVRLYJr9DC7q4c7QN4UQYxdye
 jLE1rDfg7l8x1bZdythHHfA6uNRmJAStU0Y11QFPVmIxoLIi/JfMMe9KtjrotC5Fil67t8=
IronPort-HdrOrdr: A9a23:x7aT/KuVV3Rja79QikAsf3t27skCkoMji2hC6mlwRA09TyXGra
 6TdaUguiMc1gx8ZJhBo7C90KnpewK7yXdQ2/htAV7CZnidhILMFuBfBOTZsljd8kHFh4pgPO
 JbAtRD4b7LfClHZKTBkXGF+r8bqbHtms3Y5pa9854ud3AQV0gJ1XYGNu/xKDwOeOApP+tfKH
 LKjfA32AZINE5nJfiTNz0gZazuttfLnJXpbVovAAMm0hCHiXeN5KThGxaV8x8CW3cXqI1SvF
 Ttokjc3OGOovu7whjT2yv66IlXosLozp9mCNaXgsYYBz3wgkKDZZhnWZeFoDcpydvfomoCoZ
 3pmVMNLs5z43TeciWcpgbs4RDp1HIU53rr2Taj8A3eiP28YAh/J9tKhIpffBecwVEnpstA3K
 VC2H/cn4ZLDDvb9R6NqeTgZlVPrA6ZsHAimekcgzh0So0FcoJcqoQZ4Qd8DIoAJiTn84oqed
 MeQ/003MwmMW9yUkqp/VWGmLeXLzYO91a9MwQ/U/WuonlrdCsT9Tpc+CQd9k1wg67VBaM0o9
 gsCZ4Y542mePVmGZ6VNN1xMfdfNVa9My4kEFjiaGgPR5t3c04klfbMkcAIDaeRCds18Kc=
X-IronPort-AV: E=Sophos;i="5.88,205,1635220800"; 
   d="scan'208";a="59971315"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=Pu6ybrB+FMDIqqYokNtO68BVeCA2+OcSFnNww7I2wCWnaycM+frSqyUqthUFG79yFf1dQYfI7ohytj356mSqW/sk3zoOh4/gSO6Jaa9o3c+TB4sfHhOgw7ZGjfbX0DZt44peaOmytsdPlnExypN+w5wue6C+zcWQs7UpBidSj+4dLCQQ3Bmd8k/BC/f3INRl0tt7Zt8011/pr5k6MZt4lbJRo46DvT3mifjfmU/FYU0bnNM8ezq8t5Ll7C0oDg5gd3s/flm/MdmmzZnifBGz63iYcJJRqwSc9eahoCx0M5K2Fpj7sRQCHZWXgQJ9RplBaoAdPrCQaVdTanh8MCE7/w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=zrNzOh9nt6fBFtn7oM9cS0cwQi8xHYmKQRXAU7mIWSE=;
 b=iZaCshPwdJI9Zg+Ii9BwAa1WuPKn9OrIGxHGC+kHTd3Qdx/vHwdRiOuQmRSJPGJqufxzsPOT3Fxo6adYB6fZWvg3s09I56WyH8iAyEbXWDMx12KcbbJoUPDhDGlcsq+rSwJXLnx0qt+w4POHkwvJ1F2hjhwVFjjXUpYChjFKr8YOo3PcDplmfkRz1CVm/ZtAOnPf/t4iDZ+QUDTYV+AFnt/uxrMNjxvnucIXUXjMFO5w2iuKh6yiPh7s4+qJuijM4SKasP7hlKuT2U2ZQlWh9MJUHQtDxqZq9A2byEyiA695k5Ip/SARjwGOkRQ5SMe16fxiwInwgHk/kCDB9EN35w==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=citrix.com; dmarc=pass action=none header.from=citrix.com;
 dkim=pass header.d=citrix.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=citrix.onmicrosoft.com; s=selector2-citrix-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=zrNzOh9nt6fBFtn7oM9cS0cwQi8xHYmKQRXAU7mIWSE=;
 b=U5k5zU73JzKbQJR97InMu3zOy513CI+8X3kmPSymy9IhHNocqIqOq2Cz7WB8TCdE5H5R2daap1m1ph4YfA3ywdIIKtGfkypyqQ1Cvbr34j23nuPdoay2UGD8Na6lWkSx2UzT8SNI4IR4DZIVp+Um+Nn0gTtIvR1zBbIbe8n1KuM=
Date: Tue, 14 Dec 2021 13:37:01 +0100
From: Roger Pau =?utf-8?B?TW9ubsOp?= <roger.pau@citrix.com>
To: Rahul Singh <rahul.singh@arm.com>
CC: <xen-devel@lists.xenproject.org>, <bertrand.marquis@arm.com>, Jan Beulich
	<jbeulich@suse.com>, Andrew Cooper <andrew.cooper3@citrix.com>, Wei Liu
	<wl@xen.org>, George Dunlap <george.dunlap@citrix.com>, Julien Grall
	<julien@xen.org>, Stefano Stabellini <sstabellini@kernel.org>
Subject: Re: [PATCH] xen/vpci: msix: move x86 specific code to x86 file
Message-ID: <YbiP7YlpY22llB5Y@Air-de-Roger>
References: <b8c0e550dde0fd80b2f72e9136a94caab2c3d52c.1639478534.git.rahul.singh@arm.com>
 <bfb2b7f282249cee8b6ff15d424a2b7d823ac743.1639478564.git.rahul.singh@arm.com>
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <bfb2b7f282249cee8b6ff15d424a2b7d823ac743.1639478564.git.rahul.singh@arm.com>
X-ClientProxiedBy: MR1P264CA0089.FRAP264.PROD.OUTLOOK.COM
 (2603:10a6:501:3f::22) To DS7PR03MB5608.namprd03.prod.outlook.com
 (2603:10b6:5:2c9::18)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: d6187c76-5329-4a45-afaf-08d9befe70da
X-MS-TrafficTypeDiagnostic: DM4PR03MB6190:EE_
X-Microsoft-Antispam-PRVS: <DM4PR03MB6190376AECC9AE304038350A8F759@DM4PR03MB6190.namprd03.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:4941;
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: wSICaKOi+JXKqPGQhKsTsmShcYPQXIYogtOqUHmYGQb5tLA2DIbv+U37+H24sQ0mAbRhfG1Yr813UwtQ97fT2dGyhZ5mG2+9f2g9tshMD1wnsBH9uJjMsG62IEBlAJDcWfu+BxYa6FJD6V3Bll5SFH1XGQEzSecCpVVHWm6MQkNC3en+t3VffAaJqXmHrdT7SS0xZ9TIEIsvwV0+yaQ4Pr1j1zhgDLIcO49GvGJBncr3tJMnzvaFT+00lX/0z64orj/6UgPebSu02Nct8JzpZQ7EAgrc8k683L3/HXt52/ssFTwXrF6tkdk+HzyfJ/E77Kd2CkKtIIWr0Yb1lwBXHDTfwaPBnaiNfjTe/EEY6hHTaJCrIkwkKeriEAw9ywxEn9PAi+qMmwsFXrpuGLg5L58spFQrlO+qrq8m3HQRV82n4SUnS9gzt4CoXFBFssuxi+WPDTBtyK4YmVO0Qa081YJ+O80sJ0e5L9onSrf4XjOHR6p4x9opXN/CPwIBQ0/wf9rrbQJE77suZwqeso+Hrbb7+LHTm6uhhzGFs99kTUKHozUhZXivru0SPkr/eGZBhFZJD9guKYZj6VHXQfKP9TWND/zdUUUyf57yVrWHgZBuHp4yJOJVguaV5df8/dZcWTHeL2Y0CyJBWU0+/QHRwx5EABg4ufXfnvrNv97K/n8QisC5tQMm4pdqbiwHCJwFe1uYb9tgWMB/tPnkGe2pe7t+lxb9rozfofrtnJ8Z9T/4jCgxWt896zuU8KpWS/080Dfn0aYCmy8z4CzGSS8T+VTvQPhUNI2F+2FaKkKIieg=
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DS7PR03MB5608.namprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(4636009)(7916004)(366004)(82960400001)(86362001)(66946007)(66556008)(66476007)(9686003)(6512007)(186003)(6506007)(316002)(6486002)(5660300002)(8936002)(85182001)(8676002)(6666004)(508600001)(6916009)(83380400001)(38100700002)(33716001)(26005)(2906002)(4326008)(54906003)(309714004);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?R3Roak9ORkp2bXgrQkZtV2JobFJLSXlDRVV2RThyemZkYzRvOHo3WkdkWW9l?=
 =?utf-8?B?K2h0bUJTRTk2a0VJMHFmQnI3SWNkNE8yQnJtQ213QzVJa1RoSTI5QUdvdFlT?=
 =?utf-8?B?bnFad2w1THphVFU4Zm5EaDJlQXJzK0M1amNLOWxoeGlOaS9kL2M5TFI2R2M5?=
 =?utf-8?B?ZUdCdStBNUU4V1NHVC9pQ0gwdm56V1laem8wUVR3aUNJNDJtb0plVVNFKy93?=
 =?utf-8?B?MGRLV2JPck0rdUNLY1lmNFJaNm9NZVBpZGExaDduOGJaTGVLbWE2ZmptcXJ4?=
 =?utf-8?B?UExHSmJRdm5HT043bFRhZ3NTRXhjUmlMU3lJNFJuMUpCSnlNd1UyMHJwNStx?=
 =?utf-8?B?VUxwblUyNDRRaHZ5UldQS0F1SDJwcXk0cGJUTjVpZi9lK21yZnRHSTBWbk1s?=
 =?utf-8?B?UTRzN2xjT1Z6ZHAzMC92WGl5V3pVT1ZtTmJaUGpGYkEvbkltbS9hMHI1Q3dJ?=
 =?utf-8?B?eU1yaEx4ei93QVgwY0pjMUk1WHFKdVhkeXMyM1AyQW5Wd3NRazFnR3VFOFA1?=
 =?utf-8?B?dTliYlVrWkVBbXdmK2pSQ1ZsNkk1eE1WNjhYeHdkaW13R2t3TlRTTUcwcy9I?=
 =?utf-8?B?eit0RXQ1Q3hDRjBreWFENDVmSTdmZ0RGaEN5NEZ3OHpRT3lpQ2hVZ1d0R2py?=
 =?utf-8?B?aDFJZ0J1enlwdEtNTlJmUUVISFJoZFZBVGVGeVQyS0YxWE1jWnFCZ0h4SGYw?=
 =?utf-8?B?K1FNQUNDSVBleGxMVy9Jd1VyaGZ4OWhVanlWZC95Mkc4VUpLN09LNUpldEVX?=
 =?utf-8?B?WGtmaEM5VHR6YjBBbTBTS0lIVUJiUVJyem93LzhpTC9zbGgwOS9IRTJLS3Ur?=
 =?utf-8?B?d0dFbTBJRG4xSWVXR3pZNWkzcUlrK3BSNFVMODk5ZmVRYitzd3J5eFdBdWp0?=
 =?utf-8?B?TFdDQzBZK2p5RjdHNVV6SjBRWUd5aExLWmJ3VHZVMWYwMEN6cEtqQS83Umhs?=
 =?utf-8?B?Q2hYNzVRejFTa21RR2o4UHFnc0NGN0VNQ0xQa3BST3ZTVEJZL1lDZzd4VUhl?=
 =?utf-8?B?N2YxY0Zpb2NnSk1kWW1RSFFlNjh5emsveU96L2c3aUszQ1JYeFEzYUk0TGlh?=
 =?utf-8?B?QnYzOUI2YUU0RkcweWdSUFExQ25vb1hCdmw4TjBqa1I2bTU2L3J1WGNuaGk0?=
 =?utf-8?B?R1BnYVVSWHpaYnlsNVljMHdvZVEwZGJuSXRFVDdGTThZQkdPRTZuRU9FR0Jo?=
 =?utf-8?B?amxRaENBY2hMNmRSVTdPWXppMFZJQXhFcTBMeExZRkVVWEhTYXQrbEZnTXRh?=
 =?utf-8?B?MUZTa2JtTkVjUTlxbDlmMVV0QXFoZHprSmtZZ0pmNS94U2xWSzNSaVFoUEdj?=
 =?utf-8?B?UjBZV0oyQlZ2S2hIMC9xY0wrbkQyMmVDcWQ1K0s1MEJMQjk0SS9PczBSWW5h?=
 =?utf-8?B?c2pScFhkSmw1TFdnMVVvMnM0N0hrRVM5c3dxTG51T3V5Q3ZUeHFaRnpBajY0?=
 =?utf-8?B?YjBibm9ZZUxmZTZoL1paL0RtcTZqWXZBQllORnZHYXJ5ZkU4UWl1RmlrUnhJ?=
 =?utf-8?B?QmN4dHNRc05oRmwyL29walV3ME52Q29mODJhV0E2cWNQWTE3ZEdNZzl3Ylk2?=
 =?utf-8?B?VW03Y2RyV0JCbGdLV1ZhOU5uM3lPSWxrZ0wyc2VwQzFDaHYzN2QxWERVRDYx?=
 =?utf-8?B?OU50Y29VdFN5QmIzb2l0VFZIQ05KcG4veXFNeTJCY0FncTQrcjJad2JGR1pF?=
 =?utf-8?B?Z21KTEhIaW9kenVMZlRnd0xJS3g2RVlNYUE1ZXE1bFVIYUNGenBJeVg0R0d4?=
 =?utf-8?B?MGMyZVNnaFV0N25PbEg3dDQzQTU2byt4VHl4TTVpd0lmVi9TL2djNEkzd2R1?=
 =?utf-8?B?RUFkTEpTVHVEdDlvYmdjQ0wvYStMcnJaWVVJTjg2b0FJd3o2V3E5RFNmMlBn?=
 =?utf-8?B?TTdhSFg4cUhlVThJYWxtWlNRMy91ZEJlNURHcy9QQUJacWZOZm1iZldJek1Z?=
 =?utf-8?B?bTRieXB3UDlvWE15MFhobHlKeTdRSmNsVWUzRDRjdWNjNnVEOENJQlZ3RlYx?=
 =?utf-8?B?N2xzZDl6WExPRnNjYzhPWnVTNGM3OS9va3lLbjQyT3RvWldRdEVTVTB4dEJR?=
 =?utf-8?B?YWNzVnBMbTBOd0FIdmw4OE4xVFNWS2xSUkp6RzRHY1g0a09HOTMzd2F2NjY0?=
 =?utf-8?B?aHVYVGtCWWtacFZtMVZzK29uS00wdUhoeXlEMEhXdWk5ZnNvdlA0WHlralM4?=
 =?utf-8?Q?w18BX9FcvMpObF6X7n9bRoI=3D?=
X-MS-Exchange-CrossTenant-Network-Message-Id: d6187c76-5329-4a45-afaf-08d9befe70da
X-MS-Exchange-CrossTenant-AuthSource: DS7PR03MB5608.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 14 Dec 2021 12:37:07.5539
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 335836de-42ef-43a2-b145-348c2ee9ca5b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: C3LuH3dEzNivCuaUvqLRlLUL+mz58q5DGrP1CxIG3ZEW8zS0f5wJCyZzc2h6KOcCf68GjGLNoAGGuHFKSUocwA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM4PR03MB6190
X-OriginatorOrg: citrix.com

On Tue, Dec 14, 2021 at 10:45:17AM +0000, Rahul Singh wrote:
> vpci/msix.c file will be used for arm architecture when vpci msix
> support will be added to ARM, but there is x86 specific code in this
> file.
> 
> Move x86 specific code to the x86_msix.c file to make sure common code
> will be used for other architecture.
> 
> No functional change intended.
> 
> Signed-off-by: Rahul Singh <rahul.singh@arm.com>
> ---
>  xen/arch/x86/msi.c                       |   2 +-
>  xen/drivers/passthrough/amd/iommu_init.c |   1 +
>  xen/drivers/vpci/Makefile                |   1 +
>  xen/drivers/vpci/msi.c                   |   3 +-
>  xen/drivers/vpci/msix.c                  | 134 +++++---------------
>  xen/drivers/vpci/x86_msix.c              | 155 +++++++++++++++++++++++

This should go into xen/arch/x86/hvm/vmsi.c there's already vPCI MSI
specific code in there.

>  xen/include/asm-x86/msi.h                |  28 ----
>  xen/include/xen/msi.h                    |  28 ++++
>  xen/include/xen/vpci.h                   |  21 +++
>  9 files changed, 239 insertions(+), 134 deletions(-)
>  create mode 100644 xen/drivers/vpci/x86_msix.c
> 
> diff --git a/xen/arch/x86/msi.c b/xen/arch/x86/msi.c
> index 5febc0ea4b..2b120f897f 100644
> --- a/xen/arch/x86/msi.c
> +++ b/xen/arch/x86/msi.c
> @@ -23,7 +23,7 @@
>  #include <asm/io.h>
>  #include <asm/smp.h>
>  #include <asm/desc.h>
> -#include <asm/msi.h>
> +#include <xen/msi.h>

You likely need to move this up to the xen/ prefixed include block.

>  #include <asm/fixmap.h>
>  #include <asm/p2m.h>
>  #include <mach_apic.h>
> diff --git a/xen/drivers/passthrough/amd/iommu_init.c b/xen/drivers/passthrough/amd/iommu_init.c
> index 559a734bda..fc385959c7 100644
> --- a/xen/drivers/passthrough/amd/iommu_init.c
> +++ b/xen/drivers/passthrough/amd/iommu_init.c
> @@ -20,6 +20,7 @@
>  #include <xen/acpi.h>
>  #include <xen/delay.h>
>  #include <xen/keyhandler.h>
> +#include <xen/msi.h>
>  
>  #include "iommu.h"

Might be better to replace the asm/msi.h in include in iommu.h with
xen/msi.h instead (or just add the xen/msi.h include instead of
replace).

>  
> diff --git a/xen/drivers/vpci/Makefile b/xen/drivers/vpci/Makefile
> index 1a1413b93e..543c265199 100644
> --- a/xen/drivers/vpci/Makefile
> +++ b/xen/drivers/vpci/Makefile
> @@ -1,2 +1,3 @@
>  obj-y += vpci.o header.o
>  obj-$(CONFIG_HAS_PCI_MSI) += msi.o msix.o
> +obj-$(CONFIG_X86) += x86_msix.o
> diff --git a/xen/drivers/vpci/msi.c b/xen/drivers/vpci/msi.c
> index 5757a7aed2..8fc82a9b8d 100644
> --- a/xen/drivers/vpci/msi.c
> +++ b/xen/drivers/vpci/msi.c
> @@ -16,12 +16,11 @@
>   * License along with this program; If not, see <http://www.gnu.org/licenses/>.
>   */
>  
> +#include <xen/msi.h>
>  #include <xen/sched.h>
>  #include <xen/softirq.h>
>  #include <xen/vpci.h>
>  
> -#include <asm/msi.h>
> -
>  static uint32_t control_read(const struct pci_dev *pdev, unsigned int reg,
>                               void *data)
>  {
> diff --git a/xen/drivers/vpci/msix.c b/xen/drivers/vpci/msix.c
> index 846f1b8d70..7a9b02f1a5 100644
> --- a/xen/drivers/vpci/msix.c
> +++ b/xen/drivers/vpci/msix.c
> @@ -17,15 +17,24 @@
>   * License along with this program; If not, see <http://www.gnu.org/licenses/>.
>   */
>  
> +#include <xen/msi.h>
>  #include <xen/sched.h>
>  #include <xen/vpci.h>
>  
> -#include <asm/msi.h>
>  #include <asm/p2m.h>
>  
> -#define VMSIX_ADDR_IN_RANGE(addr, vpci, nr)                               \
> -    ((addr) >= vmsix_table_addr(vpci, nr) &&                              \
> -     (addr) < vmsix_table_addr(vpci, nr) + vmsix_table_size(vpci, nr))
> +/*
> + * The return value is different for the MMIO handler on ARM and x86
> + * architecture. To make the code common for both architectures create
> + * generic return code with architecture dependent values.
> + */
> +#ifdef CONFIG_X86
> +#define VPCI_EMUL_OKAY      X86EMUL_OKAY
> +#define VPCI_EMUL_RETRY     X86EMUL_RETRY
> +#else
> +#define VPCI_EMUL_OKAY      1
> +#define VPCI_EMUL_RETRY     VPCI_EMUL_OKAY
> +#endif

Since msix_{read/write} are no longer directly used by the MMIO
handlers you might as well just return an error code (or a boolean)
and let the caller translate that into the per-arch return code.

>  
>  static uint32_t control_read(const struct pci_dev *pdev, unsigned int reg,
>                               void *data)
> @@ -138,29 +147,6 @@ static void control_write(const struct pci_dev *pdev, unsigned int reg,
>          pci_conf_write16(pdev->sbdf, reg, val);
>  }
>  
> -static struct vpci_msix *msix_find(const struct domain *d, unsigned long addr)
> -{
> -    struct vpci_msix *msix;
> -
> -    list_for_each_entry ( msix, &d->arch.hvm.msix_tables, next )
> -    {
> -        const struct vpci_bar *bars = msix->pdev->vpci->header.bars;
> -        unsigned int i;
> -
> -        for ( i = 0; i < ARRAY_SIZE(msix->tables); i++ )
> -            if ( bars[msix->tables[i] & PCI_MSIX_BIRMASK].enabled &&
> -                 VMSIX_ADDR_IN_RANGE(addr, msix->pdev->vpci, i) )
> -                return msix;
> -    }
> -
> -    return NULL;
> -}
> -
> -static int msix_accept(struct vcpu *v, unsigned long addr)
> -{
> -    return !!msix_find(v->domain, addr);
> -}
> -
>  static bool access_allowed(const struct pci_dev *pdev, unsigned long addr,
>                             unsigned int len)
>  {
> @@ -182,21 +168,19 @@ static struct vpci_msix_entry *get_entry(struct vpci_msix *msix,
>      return &msix->entries[(addr - start) / PCI_MSIX_ENTRY_SIZE];
>  }
>  
> -static int msix_read(struct vcpu *v, unsigned long addr, unsigned int len,
> -                     unsigned long *data)
> +int msix_read(struct vpci_msix *msix, unsigned long addr, unsigned int len,

This now requires a vpci_ prefix, since it's a global function.
Plain msix_{read,write} is way to generic.

> +              unsigned long *data)
>  {
> -    const struct domain *d = v->domain;
> -    struct vpci_msix *msix = msix_find(d, addr);
>      const struct vpci_msix_entry *entry;
>      unsigned int offset;
>  
>      *data = ~0ul;
>  
>      if ( !msix )
> -        return X86EMUL_RETRY;
> +        return VPCI_EMUL_RETRY;
>  
>      if ( !access_allowed(msix->pdev, addr, len) )
> -        return X86EMUL_OKAY;
> +        return VPCI_EMUL_OKAY;
>  
>      if ( VMSIX_ADDR_IN_RANGE(addr, msix->pdev->vpci, VPCI_MSIX_PBA) )
>      {
> @@ -210,11 +194,11 @@ static int msix_read(struct vcpu *v, unsigned long addr, unsigned int len,
>          switch ( len )
>          {
>          case 4:
> -            *data = readl(addr);
> +            *data = vpci_arch_readl(addr);

Why do you need a vpci wrapper around the read/write handlers? AFAICT
arm64 also has {read,write}{l,q}. And you likely want to protect the
64bit read with CONFIG_64BIT if this code is to be made available to
arm32.

>              break;
>  
>          case 8:
> -            *data = readq(addr);
> +            *data = vpci_arch_readq(addr);
>              break;
>  
>          default:
> @@ -222,7 +206,7 @@ static int msix_read(struct vcpu *v, unsigned long addr, unsigned int len,
>              break;
>          }
>  
> -        return X86EMUL_OKAY;
> +        return VPCI_EMUL_OKAY;
>      }
>  
>      spin_lock(&msix->pdev->vpci->lock);
> @@ -256,22 +240,20 @@ static int msix_read(struct vcpu *v, unsigned long addr, unsigned int len,
>      }
>      spin_unlock(&msix->pdev->vpci->lock);
>  
> -    return X86EMUL_OKAY;
> +    return VPCI_EMUL_OKAY;
>  }
>  
> -static int msix_write(struct vcpu *v, unsigned long addr, unsigned int len,
> -                      unsigned long data)
> +int msix_write(const struct domain *d, struct vpci_msix *msix,
> +               unsigned long addr, unsigned int len, unsigned long data)
>  {
> -    const struct domain *d = v->domain;
> -    struct vpci_msix *msix = msix_find(d, addr);
>      struct vpci_msix_entry *entry;
>      unsigned int offset;
>  
>      if ( !msix )
> -        return X86EMUL_RETRY;
> +        return VPCI_EMUL_RETRY;
>  
>      if ( !access_allowed(msix->pdev, addr, len) )
> -        return X86EMUL_OKAY;
> +        return VPCI_EMUL_OKAY;
>  
>      if ( VMSIX_ADDR_IN_RANGE(addr, msix->pdev->vpci, VPCI_MSIX_PBA) )
>      {
> @@ -281,11 +263,11 @@ static int msix_write(struct vcpu *v, unsigned long addr, unsigned int len,
>              switch ( len )
>              {
>              case 4:
> -                writel(data, addr);
> +                vpci_arch_writel(data, addr);
>                  break;
>  
>              case 8:
> -                writeq(data, addr);
> +                vpci_arch_writeq(data, addr);
>                  break;
>  
>              default:
> @@ -294,7 +276,7 @@ static int msix_write(struct vcpu *v, unsigned long addr, unsigned int len,
>              }
>          }
>  
> -        return X86EMUL_OKAY;
> +        return VPCI_EMUL_OKAY;
>      }
>  
>      spin_lock(&msix->pdev->vpci->lock);
> @@ -372,60 +354,7 @@ static int msix_write(struct vcpu *v, unsigned long addr, unsigned int len,
>      }
>      spin_unlock(&msix->pdev->vpci->lock);
>  
> -    return X86EMUL_OKAY;
> -}
> -
> -static const struct hvm_mmio_ops vpci_msix_table_ops = {
> -    .check = msix_accept,
> -    .read = msix_read,
> -    .write = msix_write,
> -};
> -
> -int vpci_make_msix_hole(const struct pci_dev *pdev)
> -{
> -    struct domain *d = pdev->domain;
> -    unsigned int i;
> -
> -    if ( !pdev->vpci->msix )
> -        return 0;
> -
> -    /* Make sure there's a hole for the MSIX table/PBA in the p2m. */
> -    for ( i = 0; i < ARRAY_SIZE(pdev->vpci->msix->tables); i++ )
> -    {
> -        unsigned long start = PFN_DOWN(vmsix_table_addr(pdev->vpci, i));
> -        unsigned long end = PFN_DOWN(vmsix_table_addr(pdev->vpci, i) +
> -                                     vmsix_table_size(pdev->vpci, i) - 1);
> -
> -        for ( ; start <= end; start++ )
> -        {
> -            p2m_type_t t;
> -            mfn_t mfn = get_gfn_query(d, start, &t);
> -
> -            switch ( t )
> -            {
> -            case p2m_mmio_dm:
> -            case p2m_invalid:
> -                break;
> -            case p2m_mmio_direct:
> -                if ( mfn_x(mfn) == start )
> -                {
> -                    clear_identity_p2m_entry(d, start);
> -                    break;
> -                }
> -                /* fallthrough. */
> -            default:
> -                put_gfn(d, start);
> -                gprintk(XENLOG_WARNING,
> -                        "%pp: existing mapping (mfn: %" PRI_mfn
> -                        "type: %d) at %#lx clobbers MSIX MMIO area\n",
> -                        &pdev->sbdf, mfn_x(mfn), t, start);
> -                return -EEXIST;
> -            }
> -            put_gfn(d, start);
> -        }
> -    }
> -
> -    return 0;
> +    return VPCI_EMUL_OKAY;
>  }
>  
>  static int init_msix(struct pci_dev *pdev)
> @@ -472,11 +401,10 @@ static int init_msix(struct pci_dev *pdev)
>          vpci_msix_arch_init_entry(&msix->entries[i]);
>      }
>  
> -    if ( list_empty(&d->arch.hvm.msix_tables) )
> -        register_mmio_handler(d, &vpci_msix_table_ops);
> +    register_msix_mmio_handler(d);
> +    vpci_msix_add_to_msix_table(msix, d);
>  
>      pdev->vpci->msix = msix;
> -    list_add(&msix->next, &d->arch.hvm.msix_tables);

You could likely do the registering of the handler and the addition of
the table in the same handler: vpci_msix_arch_register or similar.

Thanks, Roger.


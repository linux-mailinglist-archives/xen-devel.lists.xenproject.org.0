Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id BA44144E58E
	for <lists+xen-devel@lfdr.de>; Fri, 12 Nov 2021 12:25:01 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.225153.388844 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1mlUfF-0006pM-T2; Fri, 12 Nov 2021 11:24:13 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 225153.388844; Fri, 12 Nov 2021 11:24:13 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1mlUfF-0006mE-PF; Fri, 12 Nov 2021 11:24:13 +0000
Received: by outflank-mailman (input) for mailman id 225153;
 Fri, 12 Nov 2021 11:24:12 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=qdsq=P7=citrix.com=roger.pau@srs-se1.protection.inumbo.net>)
 id 1mlUfD-0006m8-Pj
 for xen-devel@lists.xenproject.org; Fri, 12 Nov 2021 11:24:12 +0000
Received: from esa3.hc3370-68.iphmx.com (esa3.hc3370-68.iphmx.com
 [216.71.145.155]) by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 0ceb95cd-43ab-11ec-9787-a32c541c8605;
 Fri, 12 Nov 2021 12:24:09 +0100 (CET)
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
X-Inumbo-ID: 0ceb95cd-43ab-11ec-9787-a32c541c8605
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=citrix.com; s=securemail; t=1636716250;
  h=date:from:to:cc:subject:message-id:references:
   in-reply-to:mime-version;
  bh=Vcl89wRbh/zYNOE8yCgf6W7KaYUj0TQbn560PdhObcM=;
  b=G3AEHWHaHWAeR4rPRIcwS3Nogv6q5vZiHeVY//DRI6QBiGIOOqfI7w5L
   MeV50MuqYcF5Ycv6PQbmjWTSmuWwW16N5Z1rLNKDedSAoMYvTaSW9uIZv
   oNtONb1jneGPXpC/J+gqbqAuTtImhaAqWJE/2NEmn5NDE2ILvlWZfFE0A
   E=;
Authentication-Results: esa3.hc3370-68.iphmx.com; dkim=pass (signature verified) header.i=@citrix.onmicrosoft.com
IronPort-SDR: JEgU0JgjJvFTs9LSpB1tEv4OB/BNw6h9HxMDYbn4z++tRxpMUzj2H/65efqQtnE0ct0lYRPyGB
 qEGCKceu5fLSVnF6dypYZSYRdpUDi5X5VFvY38Zl67B0RiezH7gLUYRmNN2ipY0m9uSy4Iayrg
 7zFHt5ksozOPXtjAxAUpMhbdJ2svCkAfLP6Hvo3aLXrMejWqQ0sgs1Iw53yQBRjjcB3MQ+x4qI
 uiYY0ZJbc0OKZBtwQoPGhMD6jT1U/f2+mMUb3BXUhPsZhl6QLf3aPRHBASzqKP/8OvH8iV9DxP
 rq+c4bgu77KOlfrzw9h82MI2
X-SBRS: 5.1
X-MesageID: 57700918
X-Ironport-Server: esa3.hc3370-68.iphmx.com
X-Remote-IP: 162.221.156.83
X-Policy: $RELAYED
IronPort-Data: A9a23:ZKO1q6CoXYBEVBVW/8jkw5YqxClBgxIJ4kV8jS/XYbTApDom0GYGz
 DRNW2mPb/iMZTT3fIxwPI2+oUtVu5+AzoMxQQY4rX1jcSlH+JHPbTi7wuYcHM8wwunrFh8PA
 xA2M4GYRCwMo/u1Si6FatANl1ElvU2zbue6WLGs1hxZH1c+EX540Eg7wYbVv6Yz6TSHK1LV0
 T/Ni5W31G+Ng1aY5UpNtspvADs21BjDkGtwUm4WPJinj3eH/5UhN7oNJLnZEpfNatI88thW5
 Qr05OrREmvxp3/BAz4++1rxWhVirrX6ZWBihpfKMkQLb9crSiEai84G2PQghUh/oAWktusy4
 fR2s4WAaAEtPerLu7VEekwNe81+FfUuFL7vJHG+tYqYzlHccmuqyPJrZK00FdRGoKAtWzgIr
 KFGbmBWBvyAr7veLLaTUO5ji95lNMD2FIgepmth3XfSCvNOrZXrHvqVvYcJhWdYasZmRun1Z
 PYaUThWagnLehxBYGtUGZlhg7L97pX4W2IB8w/EzUYt2EDQwRJw1v7xMdPTUt2MWchR2E2fo
 wru72n/Rx0XKtGb4T6E6W63wP/CmzvhX4AfH6H+8eRl6HWRzGEODBwdVXOgvOK0zEW5Xrpix
 1c8o3R06/JorQryE4e7D0bQTGO4UgA0cOp9OtZ5wSC2zLPkwgCdBS8DbW8YQYlz3CMpfgAC2
 liMltLvIDVgtryJVH6QnoupQSOO1Ts9djFbO3JdJecRy5y6+dxo0EqTJjp2OPft1oWdJN3m/
 9ydQMHSbZ03hNVD6ai09Euvb9mE9smQFV5dCuk6swuYAuJFiGyNO9PABbvzt68owGOlor+p5
 iVsdy+2trBmMH11vHbRKNjh5Znwjxp/DBXSgER0A74q/Cm39niocOh4uW8lehk0bJxfIm60O
 ic/XD+9ArcJYRNGioctM+qM5zkCl/C8RbwJqNiIBjaxXnSBXFDep3w/DaJh92vsjFItgckC1
 WSzKq6R4YIhIf0/llKeHr5FuZdyn3xW7T6DFPjTkkX8uZLDNSH9dFvwGAbXBgzPxPjf+1u9H
 hc2H5bi9iizp8WiOHSKqtBKcghRRZX5bLivw/Fqmie4ClMOMEkqCuPLwKNnfIpgnq9PkfzP8
 G37UUhdoGcTT1WeQelTQnw8Or7pQ7hlqnc3YX4lMVqygiBxaoez9qYPMZAweOB/puBkyPd1S
 dgDetmBXasTGmiWpWxFYMmvtpFmeTSqmRmKY3ivbg8gcsMyXAfO4NLlIFfirXFcEiqtuMIii
 LS8zQeHE4EbTgFvAZ+OOvKixl+8p1YHn+d2UxeaK9VfYhy0ooNrNzbwnrk8JMRVcUfPwT6T1
 gC3BxYEpLaS/99poYeR3a3d9tWnCepzGEZeDlL317fuOHmI5HenzK9BTP2MIWLXWlTr9fjwf
 u5S1fz9bqEKxQ4Yr4pmHr935qsi/N+z9aRCxwFpEXiXPVSmDrRsfiuP0cVV7/Afw7ZYvU29W
 16V+8kcMrKMYZu3HFkULQsjT+KCyfBLxWWCsaVreB33tH1t4b6KcUROJB3d2iVSIYx8PJ4h3
 ep86tUd7Bayi0ZyP9uL5syOG79g8pDUv30bi6wn
IronPort-HdrOrdr: A9a23:qcAp0KD4u0yONp3lHeg3sceALOsnbusQ8zAXPh9KJiC9I/b1qy
 nxppkmPH/P6Qr4WBkb6Le90Y27MAnhHP9OkPIs1NKZMjUO11HYTr2KgbGSpgEIXheOi9K1tp
 0QDZSWaueAdGSS5PySiGLTc6dCsai6GeKT9J/jJh9WPH5XgspbnmFE42igYylLrF4sP+tEKH
 PQ3LsMm9LmEk5nG/iTNz0gZazuttfLnJXpbVovAAMm0hCHiXeN5KThGxaV8x8CW3cXqI1SvV
 Ttokjc3OGOovu7whjT2yv66IlXosLozp9mCNaXgsYYBz3wgkKDZZhnWZeFoDcpydvfpWoCoZ
 3pmVMNLs5z43TeciWcpgbs4RDp1HIU53rr2Taj8DLeiP28YAh/J9tKhIpffBecwVEnpstA3K
 VC2H/cn4ZLDDvb9R6NpuTgZlVPrA6ZsHAimekcgzh0So0FcoJcqoQZ4Qd8DIoAJiTn84oqed
 MeQv003MwmMm9yUkqp/FWGmLeXLzEO91a9Mwc/U/WuonhrdCsT9Tpd+CQd9k1wgq7VBaM0oN
 gsCZ4Y542mePVmGp6VNN1xMfdfNVa9My4kEFjiaWgPR5t3cE4klfbMkcEIDaeRCdo18Kc=
X-IronPort-AV: E=Sophos;i="5.87,229,1631592000"; 
   d="scan'208";a="57700918"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=d1G4HfgRGhwmdKKqfKsSchiNxqr0XBVgzie7psKilbc9pfB8y3mxDiQVJFnadm0OXdP9aHS/Gdqv+eeDpSTI3E6kuK1SDe91L2jRBU5FlxInCtW6Uf4shDxPR9OWsIR1zP4BzFYdqIqQiizK0T9sThnOz1g3GbZjLxtuksb6BVsWN5/1NxAtA0KV5jm6HMcBD1PmSrSQpWVFX8jP5N53VL7Y8MLFhUnk1GHZl2mCxrCkdeu0Y73sezTcwLTua/fhwxD9x0k60MsBkR8zP0Vqvm90G31q5+btN1aQOLusnnvurNyCzLbct3k3dmewiCQTtdrYmLLp/DfutxbzKpHyUA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=Vcl89wRbh/zYNOE8yCgf6W7KaYUj0TQbn560PdhObcM=;
 b=A2UyyWOwm4sqKRLJIEsoXs7ltkbryiQ8y+4npH3fG6gjUZ9ES2mi4TJMs4NqCcnq3BNlIfq90UyExizsIddzAg1MSUjho1bs2UZRvThR7Mbpj8J4KYBfoY5Afm3wPN65H3X02WWS25yzC1YKNK4t/MCVRGg81XsMVCfKl+dlelL/r7JKmI5ALcXViY786jeiUlYJfFFyI1U6cTRPC6SjASNi/Y+3+UPZGwf+nIiJH3t7HE5aFg8QvQPdUuvBz5uDQiH9RkiLGEc5jK2qZQRaF58YHTaNksnOVpbgJpHMJmmr1gJ5gCTm4Y3wjiTTSr3g5NdWzBNahb0qFr/U83G75g==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=citrix.com; dmarc=pass action=none header.from=citrix.com;
 dkim=pass header.d=citrix.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=citrix.onmicrosoft.com; s=selector2-citrix-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=Vcl89wRbh/zYNOE8yCgf6W7KaYUj0TQbn560PdhObcM=;
 b=Al3ZJkHzVTSvQSWoLFwbP1HEDhOAdnJm4vm749qna8Kf/uPt+Y2nkT5qMIXT/eIZ0Mkgqqcg/vAXN8hEwMsX7I85bW9hWyZByBrUbIJz/3vcbPbiEy1cUlw2SjXfP2Sfb0Lirf6y0yPiRpLkH1dss4NHh/Dvn7O54yFyjlUdbFk=
Date: Fri, 12 Nov 2021 12:23:58 +0100
From: Roger Pau =?utf-8?B?TW9ubsOp?= <roger.pau@citrix.com>
To: Jan Beulich <jbeulich@suse.com>
CC: "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>, Kevin
 Tian <kevin.tian@intel.com>
Subject: Re: [PATCH 1/6] VT-d: properly reserve DID 0 for caching mode IOMMUs
Message-ID: <YY5OztQdQMXJSG+u@Air-de-Roger>
References: <a97adc3d-2808-1c87-8fd6-d6b24b83bd2b@suse.com>
 <242bb589-92a8-6def-9dbc-651cda71188e@suse.com>
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <242bb589-92a8-6def-9dbc-651cda71188e@suse.com>
X-ClientProxiedBy: MR2P264CA0021.FRAP264.PROD.OUTLOOK.COM
 (2603:10a6:500:1::33) To DS7PR03MB5608.namprd03.prod.outlook.com
 (2603:10b6:5:2c9::18)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 9bb585b4-7d8d-4470-93fc-08d9a5ceee8c
X-MS-TrafficTypeDiagnostic: DM6PR03MB4602:
X-LD-Processed: 335836de-42ef-43a2-b145-348c2ee9ca5b,ExtAddr
X-Microsoft-Antispam-PRVS: <DM6PR03MB460218C7C052E1EB958FF9C78F959@DM6PR03MB4602.namprd03.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:7219;
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: MzARkGrH2jNjdDhrlMTGzQus/kUaWl+rFhQXeHZad8ab0gIA2+K3xQOq5F9Ex5tzOnMDsZ529w2los4qKQBbSn6XSnzQViOTTZHJyPuHio7oZ7jb5CNZpI8e3du1sA9sI6XKCxmPs+t6F2py7K3csxi2iiwwGbjQuUqrMvb+uTxLnzIOgDimTx9VK3ZkLPeD2cOVK5WiqrFOFb1JhVz/pOaDY1mSAxDGoXckIbyxBxfMIxSG/FpLVO63+1h4BTXEywbUHSdL3aSru1WybribzbPA4tl3/KmA16oR0mP1/aIfCTWEUaHcCjAvjD7kyMk5z++WchO+cuT96eiIjcd0uNUXd5lq2eHxYzGDRMWyJC34tbXqGK//tF6eYiFCBqk/+E/+Fv3Gz+AiVY2zQZ8jC5xys6Gdp4cw4HJtejCUpBsnXGUOVWUaxC8dMNHqYUWGR9kLWB6ohz35fRCT9HfT5tuZLDM9puQ5jnLoxlZC55AtiGElFAVJF6IKXsk/WNPKQGTVjaTwaBlyki4vwcnSd/3pgy1yCoRZcTSINP61rClhgY+ZdM5Fzgezr9dFqW/vo4fJpEfQ/6dn7dEC/FXTkUIehTNYh2U5xaq/RRZl79K1z02YjaxyjouloDC7SEa0qoJqrh2J9xQkRTxBdA0/Aln8LZ1qmN7FGEeMDSN0GWkhAdA30y3y+YLGGfy8ZQ5W0quI/EbxX2iwig75ZIVLmQ==
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DS7PR03MB5608.namprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(7916004)(4636009)(366004)(66476007)(82960400001)(38100700002)(4326008)(6666004)(2906002)(6486002)(4744005)(54906003)(33716001)(8936002)(508600001)(956004)(8676002)(66946007)(66556008)(6496006)(86362001)(6916009)(316002)(9686003)(5660300002)(85182001)(186003)(26005)(67856001);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?Tmx6SFhNVldHbUdxQ3NlM25ONG1aWnc5RXdjcS9VOExENzFESTRSbzZBS2pv?=
 =?utf-8?B?c3gwdys3bFhTK1NOQU5keG9GWXV3WUdjdE5XOThVYURINVl6dVVlVldwTXRZ?=
 =?utf-8?B?WmkyQlllK0JmSGs0cDV0Y1dNRzkwUVp4NzZ6dmFxcjUyMVNrZDAvMkpMWXAz?=
 =?utf-8?B?TGpWQmtPSzErTDY5QUdDaUZyUnVVcENyVFpQQ2QxOXZMMVVZMDl2RjA4N3Fo?=
 =?utf-8?B?YnpnRGdTcEhqY3IxSXYwS1pZb2xWT1V6dmhNRUFCdHpRdFE2Mzd0Z3ZiNm8x?=
 =?utf-8?B?emNMdVl3TkFQVWhKK2lsTkpuR2RPTUhsVlpEdEtrVUNMWWw4ZFVjb3ptRWNB?=
 =?utf-8?B?aGV5eFk1ZC9QcjBYejZmdldqaUI2cnIzSjBvYmJ3NWpwT0s3L1ZTUkIxcSs3?=
 =?utf-8?B?NHVGSkpWVUpwUFlGd29FcUVkV0tTWVpJTW8xSUtIQWNXTkg2bUlTZGRQUWdD?=
 =?utf-8?B?V3VOSVRCOEoyTmlJRmFBYmliaEcyTDJxaHhlZXJScVNDL3ZYMTdDMHduRC9F?=
 =?utf-8?B?M2RhQUh5Nlc2RGZKUmJUS2xiT3N5R3lUenNaTVV1c0JVU0pyTmFiUGUreHQw?=
 =?utf-8?B?azBtOEx1Y3ROWVNGdVQwcUQ0eUloR0JGZXNGcjExYTYyWTlLTlY1QmFnYjRx?=
 =?utf-8?B?eWdOOUNSdzBuNWZzRmMvNzhBMVFjRllRWjFsdlZqWGREQURLM2t3Vk5xUXBa?=
 =?utf-8?B?N1c0VEQ4SGNvVGd2R2tUYUd0VG5mMmVUQUh3RTZkeGMzOWhqcmFkaEZjR2RM?=
 =?utf-8?B?YlBXNHZiWlBiTXE3Z0FiUjl1eVg0UU9lcEtoa1E2cmo5YjMyaExEdUdQdTJz?=
 =?utf-8?B?QThySkg1WUtSMkxYSFd6NDJmZjRUVHo5VzBTR0kvWW45d090eGh5UHphbWdQ?=
 =?utf-8?B?L3RPU0NSV0V6MktJQ1Q3UmQxZlQrbFpBQ1hSeUtiRHNmZDJDcy9jdldFQksr?=
 =?utf-8?B?eVRIVjI3c3kzNnlUSktLdVp0Z2dzNS96S0ZzT1JaRzkySnE1SDZpeVdpWEpx?=
 =?utf-8?B?QkQycGQ2aE1tR2VPL3JRRGo1N2Y2WmZlMVI0cnh4cXI3QWlwTWNRUjZSUzZG?=
 =?utf-8?B?UmpqNlZOcjhyekR0NUNnR0RMODIrb2pTQi9lYTU2bGhsRjZuU2VYZGppajhn?=
 =?utf-8?B?eHVUNUtCM1FFK2dyVzdLaWtpWXhETGhuM3RiT0pVYVQ2QXBZcHROeS8xaklQ?=
 =?utf-8?B?VHpwbkMyWkw1VmdrNi9PTUJFUjZqaDFBY1NVcmhqMVU1L0psNXNmREdteWpV?=
 =?utf-8?B?VUxVamZUeklYdGtIWnQ1LzBpU0txek41THpvdmlYdmhzazR0NU5oME9xdGZj?=
 =?utf-8?B?czE1T1lJS0xEdnNlOVp2L2I3U3orUERab3ZWQUo3VWZDdmd2RkhFcXhPOXRu?=
 =?utf-8?B?L1hmTFhwd0tCaXlXeC83SStkUjluRVlNeXRlcVVsMkVLak1sNS8zTXlibzBs?=
 =?utf-8?B?OE9MUUNYRS9aMWRxUFpZNTkwSGlrR2xVTGt5YnhEdUtIV1BtVnpmZGlhSUtv?=
 =?utf-8?B?Ui9zc0M2bEpmMUNVMWdHbndlcDlzRDJ5U0h5a2lONTdhSEE3L2FHV2FLa3g0?=
 =?utf-8?B?Uzh0elFNZjFhcDdhT1A4VEV6azM3SGtKaFlXajRXMmphYkx3cXk1MXdUcXdu?=
 =?utf-8?B?TlE5cXI4RjVWVzBmUUlHbFlZaVVtK01JZzVvSzg4MURIT3dhQ3lnSklXTTZM?=
 =?utf-8?B?QkNFQ2thZW15NFVYTUNZN1hLRHhjTFdKK3N5eEpTNi9VQkVXdytscitESlIv?=
 =?utf-8?B?UGZKc3NmZWRjQzNTNmRVcHdyNVRzWHVGOTdXUmJxUHltQVVwWUZOUUNrb2U2?=
 =?utf-8?B?N2JBSmd4YWNwOU9sRFZERENHemhrWWkzRWJ4eXNJODFXb1ZPN2UvUldsRHo1?=
 =?utf-8?B?VVpXODdsbDNNV280djh3RnpybkE1SFIyTUpWOUY2RHltenNiWDJrelY3eDVy?=
 =?utf-8?B?VkdQVkVJRDdxbmJNRFpidERtd2dNWVFWVFlpMWNaRjZxNE5nOFAwTmlmS00r?=
 =?utf-8?B?Qm1MV1FWbXRlRXRmSTY1SDZrdDVIbHRUZEh1Q2ZMZzM1RTBkVFNSdzZadThC?=
 =?utf-8?B?ZS9TN1U5eUJ3NE43WTB0NTBJdjhVdGJBUE5laldVek03MDl2V0dYWFJoTzh1?=
 =?utf-8?B?QlZlM1lyRVVTelV0UjNSd2JhWng1MmZXcEltamhYc0JpWCtkUXlUUEJBYUxT?=
 =?utf-8?Q?N0BBKCL6SIlFOYe4nLTolg8=3D?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 9bb585b4-7d8d-4470-93fc-08d9a5ceee8c
X-MS-Exchange-CrossTenant-AuthSource: DS7PR03MB5608.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 12 Nov 2021 11:24:03.4657
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 335836de-42ef-43a2-b145-348c2ee9ca5b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: geRDcMt0hgmt861FbziJKbcp8eq4B0HzlwKE3x83wrDOAu/jjqbXs43iVTudjq8AhW4Jh/1lRKjYHfsUQKVb9Q==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM6PR03MB4602
X-OriginatorOrg: citrix.com

On Fri, Nov 12, 2021 at 10:47:59AM +0100, Jan Beulich wrote:
> Merely setting bit 0 in the bitmap is insufficient, as then Dom0 will
> still have DID 0 allocated to it, because of the zero-filling of
> domid_map[]. Set slot 0 to DOMID_INVALID to keep DID 0 from getting
> used.

Shouldn't the whole domid_map be initialized to DOMID_INVALID to
prevent dom0 matching against any unused slot?

Similarly cleanup_domid_map should set the slot to DOMID_INVALID.

Thanks, Roger.


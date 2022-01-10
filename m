Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 001C1489B9E
	for <lists+xen-devel@lfdr.de>; Mon, 10 Jan 2022 15:54:02 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.255373.437573 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1n6w3Q-0007xF-B0; Mon, 10 Jan 2022 14:53:48 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 255373.437573; Mon, 10 Jan 2022 14:53:48 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1n6w3Q-0007vR-7W; Mon, 10 Jan 2022 14:53:48 +0000
Received: by outflank-mailman (input) for mailman id 255373;
 Mon, 10 Jan 2022 14:53:46 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=/mw0=R2=citrix.com=roger.pau@srs-se1.protection.inumbo.net>)
 id 1n6w3O-0007vL-9o
 for xen-devel@lists.xenproject.org; Mon, 10 Jan 2022 14:53:46 +0000
Received: from esa4.hc3370-68.iphmx.com (esa4.hc3370-68.iphmx.com
 [216.71.155.144]) by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 1ab8868f-7225-11ec-81c1-a30af7de8005;
 Mon, 10 Jan 2022 15:53:44 +0100 (CET)
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
X-Inumbo-ID: 1ab8868f-7225-11ec-81c1-a30af7de8005
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=citrix.com; s=securemail; t=1641826424;
  h=date:from:to:cc:subject:message-id:references:
   content-transfer-encoding:in-reply-to:mime-version;
  bh=PgISbWiNS8M0/AaSR4kJSbbLwHoGGaSKVO6BiF1ABkw=;
  b=Z3Q5ojcawdNMJpIbfddNa9LSEiE7S3Z0g7gG9kD7l/K+GL6aVRjZjedj
   Zi7tVBi1PeUy4HRQVqzknvqWJ7O3DqbkFKloxTnkhSNeCvuxee59aKA+I
   FDoTZMq0WNFxvR3GKuCCFHEQyyPWbf98u55la+v8XkaytMfRc8by+NjYm
   U=;
Authentication-Results: esa4.hc3370-68.iphmx.com; dkim=pass (signature verified) header.i=@citrix.onmicrosoft.com
IronPort-SDR: PCshai0VNNXma0YrQ7EUfzpFe4Zl+claa/iWpLQiPuG+qtOzMUWMTDKzFA4LqsCnkTGhNxvCjf
 Cf+j8cH0h8n+UcbRpP5uIY4Ajpo9UE9/ihc1oEI2NpCfCj8JhidnoHynw6ZG9Rdg3TxGE4TkB8
 byCjLDFbgPAtcj1vXu6mQCl5ngMJNQOJZ1Qo0lZahfSONheA+9XQ4aV99Cn4k/CPUnuOCGhS7e
 N+eU0bYVnbhtATiZ/7IlrexvovJ0QNYobHpAXKFzsceKT+l8m0Ux8XRmveWcceMnuaemvpGEA5
 GvzxW5V9Kk7FMN8fvDaSYnlL
X-SBRS: 5.2
X-MesageID: 63774601
X-Ironport-Server: esa4.hc3370-68.iphmx.com
X-Remote-IP: 162.221.156.83
X-Policy: $RELAYED
IronPort-Data: A9a23:PD/vDqmHcRdGFdFyASq7gy3o5gxiIURdPkR7XQ2eYbSJt1+Wr1Gzt
 xIXXj/UaK2OYmr3KdkjYIzgpkJUvcPXmIVmGgdq/yExHiMWpZLJC+rCIxarNUt+DCFioGGLT
 Sk6QoOdRCzhZiaE/n9BClVlxJVF/fngqoDUUYYoAQgsA180IMsdoUg7wbRh29cw2YLR7z6l4
 rseneWOYDdJ5BYsWo4kw/rrRMRH5amaVJsw5zTSVNgT1LPsvyB94KE3fMldG0DQUIhMdtNWc
 s6YpF2PEsE1yD92Yj+tuu6TnkTn2dc+NyDW4pZdc/DKbhSvOkXee0v0XRYRQR4/ttmHozx+4
 OhulbyvYyQrBIPJhtRHSjd0FR5sYpQTrdcrIVDn2SCS50jPcn+qyPRyFkAme4Yf/46bA0kXq
 6ZecmpUKEne2aTmm9pXScE17ignBNPsM44F/Glp0BnSDOo8QICFSKLPjTNd9Glr2Z8SQ66HD
 yYfQQRzVxTFThx9AFsKKKgenLaPr1zyYjIN/Tp5ooJoujOOnWSdyoPFINfTP9CHW8hRtkKZv
 X7duXT0BAkAM96SwibD9Wij7sfBnDn2XY8OGbqi3uNxjUeIgHcUFQcdWFW8u/a0zEizR7pix
 1c8o3R06/JorQryE4e7D0bQTGO4UgA0ZvlwM/IQywO35K/K01yAKEQCcSweUYlz3CMpfgAC2
 liMltLvIDVgtryJVH6QnoupQSOO1Ts9djFbO3JdJecRy5y6+dxo0EqTJjp2OPPt1rXI9SfML
 ydmRcTUr5EaloY12qqy5jgraBr898GSHmbZCug6N19JDz+Vhqb4PeRECnCBtJ6sybp1qHHa5
 RDofODEvIgz4WmlznDlfQn0NOjBCwy5GDPdm0VzOJIq6i6g/XWuFagJvm0nexoyb51ZKW6zC
 KM2he+3zMQKVJdNRfUmC79d9uxwlfSwfTgbfq28giVyjmhZK1bcoXAGib+41GHxikk8+ZzTy
 r/AGftA+U0yUPw9pBLvHr91+eZymkgWmD2PLbimkUXP+efONRa9FOZeWHPTP79R0U9xiFiPm
 zqpH5HUm0w3vSyXSnS/zLP/2nhRfCdrXs6n+pUHHgNBSyI/cFwc5zbq6epJU6RunrhPl/eO+
 Xe4W0RCz0H4i2GBIgKPAk2Popu2NXqmhX5kbyEqI3iy3H0vPdSm4KsFLsNldrg77u1zi/VzS
 qBdKcmHB/1OTBXB+igcMsah/NAzKkzziFLcJTehbRg+Y4VkG17D9Oj7c1a97yIJFCe265cz+
 uXyygPBTJMfbA1+F8KKOum3xla8sCFFyuJ/VkfFOPdJf0Do/NQ4IiD9lKZvccoNNQ/C1n2R0
 APPWUUUouzEookU9tjVhP/b89f1QrUmRkcDRjvV97e7MyXe71GP+44YXbbaZy3ZWUP15L6mO
 bdfwcbjPaBVh11NqYd9TepmlPps+9v1qrZG5Q14B3GXPU+zA7ZtL3Taj8lCsqpBmu1QtQesA
 x/d/9BbPfOCOd//EU5XLw0gN7zR2fYRkzjUzPI0PESlu3MnoOvZCR1fb0uWlShQDLppK4d0k
 +4utfkf5xG7lhd3YM2NiTpZ9jjUI3ENO0n9Wkr23GM/ZtIX92x/
IronPort-HdrOrdr: A9a23:Hm2Ft6vXM/l1fA5GC//N/RT77skC7IMji2hC6mlwRA09TyXGra
 6TdaUguiMc1gx8ZJhBo7C90KnpewK7yXdQ2/htAV7EZnibhILIFvAZ0WKG+Vzd8kLFh4tgPM
 tbAsxD4ZjLfCdHZKXBkXmF+rQbsaG6GcmT7I+0pRodLnAJV0gj1XYDNu/yKDwGeOAsP+tBKH
 Pz3Lshm9L2Ek5nEPhTS0N1FdTrlpnurtbLcBQGDxko5E2nii6p0qfzF1y90g0FWz1C7L8++S
 yd+jaJqpmLgrWe8FvxxmXT55NZlJ/IzcZCPtWFjowwJi/3ggilSYx9U/mpvSwzosuo9FE2+e
 O87isIDoBW0Tf8b2u1qRzi103J1ysv0WbrzRuijX7qsaXCNXsHIvsEobgcXgrS6kImst05+r
 lMxXilu51eCg6FtDjh5vDTPisa13ackD4Hq6o+nnZfWYwRZPt6tooE5n5YF58GAWbT9J0nKu
 9zF8vRjcwmP29yV0qp/VWH/ebcHEjaRny9Mw0/U42uondrdUlCvgslLJd1pAZFyHo/I6M0kd
 gsfJ4Y042mdfVmH56VMt1xNvdfOla9Mi4kD1jiVGgPNJt3c04l+KSHq4nc2omRCeg1Jd0J6d
 L8bG8=
X-IronPort-AV: E=Sophos;i="5.88,277,1635220800"; 
   d="scan'208";a="63774601"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=kvC8uw9K/Jc+7AbpoV/IZhWS+HvLTmz9kF6h1YgwxW9WqtCQdbfWEm0cTU7cS/cuyX1l0X4sU7cuficK6F3JjwvflDvhFHmPZjnfMpTJE9872Xh+zcqV1DkxnI5anqXCPHuSE62ck3KtzlgWJ6ZrBu7exM4ZOGmNVwJTUEN9O/3LI1U63vqpw/rABUm7sTJM7JZF42I3ShVB/uu/f+Zxkkcs/EAp+zfNfKx+onqNwfpSrqb3Dhu43Jan47la6NTgvJeKYzZ0OkwzIRGRFOOOda7K6Mwk7tqVh5Xql0mc+TSwq64Ex7t8qna8ZdSowGCKgpls24qUxlRu9k5tINafgQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=lvAYzWc+IjyBTaIe18RY2tsPcxFALWaome1TknGHqFo=;
 b=ER/s+CDnoHo2mvQxMO11JcwtTRHuu1yNF/fDEdrD4gnzE9NwnUHydjf+7Gm+RbP4PFROybcYxcrHq3VjbealDYyiVP7z98DwH7Tc5codPATbTfzpZE3JJp0daFXJfWrhFZ+iugwQAslb+rbDcpDBLch5HOG1IYG8GUhSBWF173wzG3pPXdwPusTlimnin0f3gIZc0kFc3Jt5vsS+ZsXsFrfRZ0SSTD/tJMCpYQHE31u4xcpljitRsASmfoaMjL4lpjuUZKV/x+nHbmqvJ2+Dc0vGYzYzZt5LUwspJENb9WWiWGgCoMa1K5hORQAWp+M1NbqUkItUfiPvmzGbZuhFTA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=citrix.com; dmarc=pass action=none header.from=citrix.com;
 dkim=pass header.d=citrix.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=citrix.onmicrosoft.com; s=selector2-citrix-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=lvAYzWc+IjyBTaIe18RY2tsPcxFALWaome1TknGHqFo=;
 b=dpyKAtq4B37g51nzjYnyev5hdY3zvcxQFr/P+ACPzCqBNYlH/U4gdK4c2W66cfisIAolca0PLs+OpAC7p70PQeG9XJ4a5t2XP9V8qH4DHndbMiNeh70z5Prpy49GHofLdWqQdb5n/6M/NbigqdaS1d0VZwGN4FWykr6l5QWIZxk=
Date: Mon, 10 Jan 2022 15:53:32 +0100
From: Roger Pau =?utf-8?B?TW9ubsOp?= <roger.pau@citrix.com>
To: G.R. <firemeteor@users.sourceforge.net>
CC: <xen-devel@lists.xenproject.org>
Subject: Re: Possible bug? DOM-U network stopped working after fatal error
 reported in DOM0
Message-ID: <YdxIbLYRYh4hvVGj@Air-de-Roger>
References: <CAKhsbWaKvMtN0v57kRuwSGnTECb8JnabhgXeO1VTyLiJa4yngg@mail.gmail.com>
 <Ycw4Jna5J2iQJyeM@Air-de-Roger> <Ycyx65BDakqWmEe+@Air-de-Roger>
 <CAKhsbWYU5_DGbGK2i_uhooXk4EzCLLO4SJGjDsvAkf2udQGsbg@mail.gmail.com>
 <Yc3/ytwCHFtR1BLi@Air-de-Roger>
 <CAKhsbWbRinNavBq4NnQ64nVrfWoOQWV0mM3Foao4VBYUWjoSnQ@mail.gmail.com>
 <YdQgf2+E467kuTxK@Air-de-Roger>
 <CAKhsbWbrvF6M-SAocACO5NvBaitUQ9mB5Qx+fMGtn_yVu0ZvEA@mail.gmail.com>
 <YdWsPWqALWBRGtqW@Air-de-Roger>
 <CAKhsbWbvjEcA220TTHGB3PPbfLmdS_MuK5Mn3Xvrr+JL=dHK7w@mail.gmail.com>
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <CAKhsbWbvjEcA220TTHGB3PPbfLmdS_MuK5Mn3Xvrr+JL=dHK7w@mail.gmail.com>
X-ClientProxiedBy: MRXP264CA0022.FRAP264.PROD.OUTLOOK.COM
 (2603:10a6:500:15::34) To DS7PR03MB5608.namprd03.prod.outlook.com
 (2603:10b6:5:2c9::18)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: c7736831-5db5-4f83-f973-08d9d448fbf1
X-MS-TrafficTypeDiagnostic: DS7PR03MB5608:EE_
X-Microsoft-Antispam-PRVS: <DS7PR03MB5608A6FD24C8E3E3ED0BA8C08F509@DS7PR03MB5608.namprd03.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:5236;
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: Ey99BkANKJ+dzwwNWyBLdzdSNcQN4RURH6NC1CI8XvKP6jjJCeJkLpCCkyCpNZ2xX1y+Gi5bKeM7N9Ffnqxbzb45Ajx+qkKLBZcbiRQkY1wq2DuhkBdoMNM/Ew4uDp4sd7/UxLNhPh0rK1EFJmQ5zDdhW0wGAzWIVqZCYYVN4nsb6kknz3kE702mc8H1AkiuN+uYmDEMrTyTzmLVMqagrMGZQVq4Xo9UWjW0FTFhIeQPPHJr6Zeni/Cj+DyVyf3V+RVTB6690b56k2PzHCb2VU+NXREsAshb0hSBdszZu2eLHQPmNSzTQ0So1xDgRMCtLvQMmoTwa6z8u6pdsbljMcRALpPHFVpeHfTIA9aep+mqXXUdaigvR5IOQJ+h4e+fb5RuO1mmgqV0qjKZF73HykfP+rKMyb74oZjYV5GCSfHa2vzpB3QGi+De0TxtRmM0srUCv13hOvPUW3ylCsgO2bydvXWPQCZPQY2sWH873Yxmelf6653bM3iLtCIUmJMepwCMrOnhu0ucDYXftacj5+MB8MTK/63LmBBxz5L6j+tjVF5LgupNwyUdnMF/zd/+/wHBUOlGkBmvcv1zoOaz3uBl9wh+dEpf74IseJ7Xx6M3tdBxHdOrQ0ACzA6cjh3yaoxs657GjIMtJCximjpOmw==
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DS7PR03MB5608.namprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(7916004)(4636009)(366004)(83380400001)(6666004)(4326008)(6916009)(8936002)(86362001)(6506007)(53546011)(66946007)(8676002)(66556008)(6486002)(66476007)(9686003)(2906002)(6512007)(5660300002)(85182001)(33716001)(38100700002)(316002)(82960400001)(508600001)(186003)(26005);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?MFBFbUwwUVdCWCtJNmJYdEFKa1FoaHFMdnpGeG1ISEFKRXI4VVZiNmUwNU5i?=
 =?utf-8?B?OXJManYzbzVTdnVoVGJUUEdRNUZvSjgraDR3WDhMc3Z3c21tRnBiTkQ5eS9m?=
 =?utf-8?B?SHJ4YklNeWNpNlpIZ1pTTGljaXRWRis0TXhUbWhJOGFHUjIrNzVOTEZlV0NK?=
 =?utf-8?B?OW4yei84TFU0aDNtRGlsV0dVWG14UlNSRlVXM3VDOHhWaU9UMlRpNnlBOVRz?=
 =?utf-8?B?RGUyZGp6QnJVTVQwbmdpTDBmZEtqNVdtTllnNmhmMGRseGhkYk5GbjlzSWtY?=
 =?utf-8?B?NGRveG9YdGdvcVNaL3p6dkxRYVMzM09LanNSRlIxQ0R4WVpIek9uOTZubEto?=
 =?utf-8?B?c0k2UlBWb3JrVlFQQjF0aUx0K21iSUxwY0RUYzdrY2ZjWStiQmRKVUIzRHh2?=
 =?utf-8?B?WVVDUXhWN1hWNnY5VHA3c3A0SUlHcXJWSzRhR0U5eS96OVZka3RFMG1aNTNu?=
 =?utf-8?B?VFNHazRsaHJiVS82dE5BdmhJdUN1enRRM0FWNkFPelZmVHhTNngydlFQUURa?=
 =?utf-8?B?SjQ0czVXUDNhVmNNZ1J2UGFIOUhWZ0hZamxMdkM3amdZMjlUZktjNnNhZkw1?=
 =?utf-8?B?SnJ4NmtUb0p3eHNoWXJqdHdSYkRHeFRLYWQzUnhzeFFTdURQODVndTJNUmtX?=
 =?utf-8?B?Q0JIRVRobnVxNFZkSjJPVUtQMklEaCs1bGtiVjZuMTdMQzhXOXpncUZmOGlP?=
 =?utf-8?B?cXpGNjFGdVNRdU8rMDdPMGd2ZWJjWnkrK3Nwb1VZQ2pYWlJucWV3ZGpPSklM?=
 =?utf-8?B?ZkFUUHlhcXppV0tBUG4vRWJDLzBnMW11RlozR0EwSWJHYVFpTmZueHczaGxp?=
 =?utf-8?B?cDJ6YTNDYjRjR0gxVUlVQmYwUEpvVzlKVFJnYmxGWE5YLys4Zm5CZkZKWHBz?=
 =?utf-8?B?VzJ0L2JZdkFZaEtBcysrdkhqZW1lVE96NnUyRTRYNE1qcGc1elJSWGQ5VTJL?=
 =?utf-8?B?dGJpUnVPcW5XbEozUjE1eks0YjFOYlp0MDVDY0VlVmdnSjdVY3FydzRYaFk4?=
 =?utf-8?B?dzliMEhLVVc5QU81cENuaE13RGg1bUJiNTBGRjY2ZWNwSU9UamdzM0ZHaGZa?=
 =?utf-8?B?eS9VcUJ1MWtuZCtYN1JRK1pBTGVFMlBua2RUSFJJM0c2RFFPWjNxa1MzQWZG?=
 =?utf-8?B?T24wRk9WYXIraEtVOUFDOTBtYW9BVmxMYytkTmp5b2pybFFhVTFPazdmaFhM?=
 =?utf-8?B?bHpCQlorODk4WlBRMERyYzdiQXo0SEp5SFhkOCtrd09acHpkRDFnK2FmM29D?=
 =?utf-8?B?b0RUbkRVK01OTXpOWWhrWUhsYmUwM0hlQVhWS0ExSERobXpCSXV3cWw5L0RT?=
 =?utf-8?B?VVVmSEdwdlZ5alJKOXJTemNMdjlLL0hxRU0rSm1ydm02alp4RzhmcnBnNVJp?=
 =?utf-8?B?YUNtODd1K1kzcjdmeW9GWDhFUCtOc3hrRHprSTBqRFlVVFRidTV1Wmp3djh4?=
 =?utf-8?B?NFVqQ05lZG1NaEU3Qzhkd2NvQ1pJYkdITVM1SFVzeGVLWXdydnZGdUxCNkY0?=
 =?utf-8?B?ZDJjVktBK1c0SC91UnRWVDloOUVYUlN5TEpvL0Njbjl4aEdvYS9YaUttSDJa?=
 =?utf-8?B?eXB5RmZQcVVyVGsvSGtaTnlRRUNTYVlvUlgrYnFwaDdRUjNsbW50L2ZYbG1m?=
 =?utf-8?B?WGZTWnZwbE5nN2hZSkh1akV0QWo4SlMwY3NTS1crYnFDRDdxdjhKSmYzdnpT?=
 =?utf-8?B?TDJHcFBYUysxMENvbDhQWk12NjZKcjFIb3hoSGFibG5YTy9ORWVSYVZMaElR?=
 =?utf-8?B?QWQza2t3Y2x2VFdPakVEYzJMa3NZcGpoK3lBOTZ0R3ZOQkw2ZmVmNzIxeUNh?=
 =?utf-8?B?SmZYUkdFaWRxU3RnbFJVQTh2T0V1RFZBVm1pUldQaGQ2QVEyRXpBaUNBcjBF?=
 =?utf-8?B?YUNLUCtlMVl3TnJNTGJsSk9JYW8wVFAxTHhhVjVKYk00UDErbGsybFNKRFpp?=
 =?utf-8?B?eWJWOHduUXBHWnV0eHNIUDlMQzdGNGxzc2dSUXRNZUEyWWE5QzhyVkRSdFgx?=
 =?utf-8?B?cGJ1aWFCaDU2TGt2Z2VuL2RiS2xHNnA0bUR0ZVdTWE5iTTlua2xDam84WnBP?=
 =?utf-8?B?WHI4U2JSeWxoNUlLT0J3ZkVMVy9BQmtOQmJ0U0RGY2pIcGZ4dlpjK3YrYlRv?=
 =?utf-8?B?ZE1ZWTZmQW02dFJRSWxkcTBVbHFrZDlqVGNqa0lKbXowNXZDZFFnSVhMbmtu?=
 =?utf-8?Q?tFZMjHDqe8g6efoU17wrJ5Q=3D?=
X-MS-Exchange-CrossTenant-Network-Message-Id: c7736831-5db5-4f83-f973-08d9d448fbf1
X-MS-Exchange-CrossTenant-AuthSource: DS7PR03MB5608.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 10 Jan 2022 14:53:38.0870
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 335836de-42ef-43a2-b145-348c2ee9ca5b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: VFDhlGBh4LUSxdVvnTIm3LTVrse5hoYg2afWjDFpnj4AVllVs1lipBf4ujQ5J2XczncYeKRHNHe8oKeh6HNnqg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DS7PR03MB5608
X-OriginatorOrg: citrix.com

On Sat, Jan 08, 2022 at 01:14:26AM +0800, G.R. wrote:
> On Wed, Jan 5, 2022 at 10:33 PM Roger Pau Monné <roger.pau@citrix.com> wrote:
> >
> > On Wed, Jan 05, 2022 at 12:05:39AM +0800, G.R. wrote:
> > > > > > > But seems like this patch is not stable enough yet and has its own
> > > > > > > issue -- memory is not properly released?
> > > > > >
> > > > > > I know. I've been working on improving it this morning and I'm
> > > > > > attaching an updated version below.
> > > > > >
> > > > > Good news.
> > > > > With this  new patch, the NAS domU can serve iSCSI disk without OOM
> > > > > panic, at least for a little while.
> > > > > I'm going to keep it up and running for a while to see if it's stable over time.
> > > >
> > > > Thanks again for all the testing. Do you see any difference
> > > > performance wise?
> > > I'm still on a *debug* kernel build to capture any potential panic --
> > > none so far -- no performance testing yet.
> > > Since I'm a home user with a relatively lightweight workload, so far I
> > > didn't observe any difference in daily usage.
> > >
> > > I did some quick iperf3 testing just now.
> >
> > Thanks for doing this.
> >
> > > 1. between nas domU <=> Linux dom0 running on an old i7-3770 based box.
> > > The peak is roughly 12 Gbits/s when domU is the server.
> > > But I do see regression down to ~8.5 Gbits/s when I repeat the test in
> > > a short burst.
> > > The regression can recover when I leave the system idle for a while.
> > >
> > > When dom0 is the iperf3 server, the transfer rate is much lower, down
> > > all the way to 1.x Gbits/s.
> > > Sometimes, I can see the following kernel log repeats during the
> > > testing, likely contributing to the slowdown.
> > >              interrupt storm detected on "irq2328:"; throttling interrupt source
> >
> > I assume the message is in the domU, not the dom0?
> Yes, in the TrueNAS domU.
> BTW, I rebooted back to the stock kernel and the message is no longer observed.
> 
> With the stock kernel, the transfer rate from dom0 to nas domU can be
> as high as 30Gbps.
> The variation is still observed, sometimes down to ~19Gbps. There is
> no retransmission in this direction.
> 
> For the reverse direction, the observed low transfer rate still exists.
> It's still within the range of 1.x Gbps, but should still be better
> than the previous test.
> The huge number of re-transmission is still observed.
> The same behavior can be observed on a stock FreeBSD 12.2 image, so
> this is not specific to TrueNAS.

So that's domU sending the data, and dom0 receiving it.

> 
> According to the packet capture, the re-transmission appears to be
> caused by packet reorder.
> Here is one example incident:
> 1. dom0 sees a sequence jump in the incoming stream and begins to send out SACKs
> 2. When SACK shows up at domU, it begins to re-transmit lost frames
>    (the re-transmit looks weird since it show up as a mixed stream of
> 1448 bytes and 12 bytes packets, instead of always 1448 bytes)
> 3. Suddenly the packets that are believed to have lost show up, dom0
> accept them as if they are re-transmission

Hm, so there seems to be some kind of issue with ordering I would say.

> 4. The actual re-transmission finally shows up in dom0...
> Should we expect packet reorder on a direct virtual link? Sounds fishy to me.
> Any chance we can get this re-transmission fixed?

Does this still happen with all the extra features disabled? (-rxcsum
-txcsum -lro -tso)

> So looks like at least the imbalance between two directions are not
> related to your patch.
> Likely the debug build is a bigger contributor to the perf difference
> in both directions.
> 
> I also tried your patch on a release build, and didn't observe any
> major difference in iperf3 numbers.
> Roughly match the 30Gbps and 1.xGbps number on the stock release kernel.

Thanks a lot, will try to get this upstream then.

Roger.

